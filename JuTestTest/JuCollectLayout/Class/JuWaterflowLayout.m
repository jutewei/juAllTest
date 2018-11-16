//
//  JuWaterflowLayout.m
//  JuTestTest
//
//  Created by Juvid on 2018/11/16.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuWaterflowLayout.h"

@interface JuWaterflowLayout()
@property (nonatomic, strong) NSMutableDictionary *maxYDict;

/** 存放所有的布局属性 */
@property (nonatomic, strong) NSMutableArray *attrsArray;
@end

@implementation JuWaterflowLayout

- (NSMutableDictionary *)maxYDict
{
    if (!_maxYDict) {
        self.maxYDict = [[NSMutableDictionary alloc] init];
    }
    return _maxYDict;
}

- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        self.attrsArray = [[NSMutableArray alloc] init];
    }
    return _attrsArray;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.columnMargin = 10;
        self.rowMargin = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.columnsCount = 3;
    }
    return self;
}
//发生滚动的时候改变bounds
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    NSLog(@"shouldInvalidateLayoutForBoundsChange");
    return YES;
}

/**
 *  每次布局之前的准备
 */
- (void)prepareLayout
{
    [super prepareLayout];
    NSLog(@"prepareLayout");
    // 1.清空最大的Y值
    for (int i = 0; i<self.columnsCount; i++) {
        NSString *column = [NSString stringWithFormat:@"%d", i];
        self.maxYDict[column] = @(self.sectionInset.top);
    }

    // 2.计算所有cell的属性
    [self.attrsArray removeAllObjects];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i<count; i++) {
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [self.attrsArray addObject:attrs];
    }
}

/**
 *  返回所有的尺寸
 */
- (CGSize)collectionViewContentSize
{
    NSLog(@"collectionViewContentSize");
    __block NSString *maxColumn = @"0";
    //找出最大的那一列
    [self.maxYDict enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL *stop) {
        if ([maxY floatValue] > [self.maxYDict[maxColumn] floatValue]) {
            maxColumn = column;
        }
    }];
    return CGSizeMake(0, [self.maxYDict[maxColumn] floatValue] + self.sectionInset.bottom);
}

/**
 *  返回indexPath这个位置Item的布局属性,每次要显示一个新的cell的时候就要调用
 找到最短的那一列,在这个最短的那一列后面返回一个attribute
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"layoutAttributesForItemAtIndexPath");
    // 假设最短的那一列的第0列
    __block NSString *minColumn = @"0";
    // 找出最短的那一列
    [self.maxYDict enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL *stop) {
        if ([maxY floatValue] < [self.maxYDict[minColumn] floatValue]) {
            minColumn = column;
        }
    }];


    // 计算尺寸
    CGFloat width = (self.collectionView.frame.size.width - self.sectionInset.left - self.sectionInset.right - (self.columnsCount - 1) * self.columnMargin)/self.columnsCount;
    CGFloat height = [self.delegate waterflowLayout:self heightForWidth:width atIndexPath:indexPath];

    // 计算位置
    CGFloat x = self.sectionInset.left + (width + self.columnMargin) * [minColumn intValue];
    CGFloat y = [self.maxYDict[minColumn] floatValue] + self.rowMargin;

    // 更新这一列的最大Y值
    self.maxYDict[minColumn] = @(y + height);

    // 创建属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.frame = CGRectMake(x, y, width, height);
    return attrs;
}

/**
 *  返回rect范围内的布局属性
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSLog(@"layoutAttributesForElementsInRect");
    return self.attrsArray;
}

@end
