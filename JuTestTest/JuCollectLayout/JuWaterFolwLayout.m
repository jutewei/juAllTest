//
//  JuWaterFolwLayout.m
//  JuTestTest
//
//  Created by Juvid on 2018/11/13.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuWaterFolwLayout.h"
#define colCount 3

@interface JuWaterFolwLayout ()
//数组存放每列的总高度
@property(nonatomic,strong)NSMutableArray* colsHeight;
//单元格宽度
@property(nonatomic,assign)CGFloat colWidth;
@end

@implementation JuWaterFolwLayout
-(void)prepareLayout{
    NSLog(@"---------1");
    ///和init相似，必须call super的prepareLayout以保证初始化正确
    [super prepareLayout];
     self.colsHeight = nil;
    ///1.首先被调用
}
-(CGSize)collectionViewContentSize{
    NSNumber * longest = self.colsHeight[0];
    for (NSInteger i =0;i<self.colsHeight.count;i++) {
        NSNumber* rolHeight = self.colsHeight[i];
        if(longest.floatValue<rolHeight.floatValue){
            longest = rolHeight;
        }
    }
    return CGSizeMake(self.collectionView.frame.size.width, longest.floatValue);
//    return [super collectionViewContentSize];
}
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes* attr = [[super layoutAttributesForItemAtIndexPath:indexPath] copy];
    NSNumber * shortest = self.colsHeight[0];
    NSInteger  shortCol = 0;
    for (NSInteger i =0;i<self.colsHeight.count;i++) {
        NSNumber* rolHeight = self.colsHeight[i];
        if(shortest.floatValue>rolHeight.floatValue){
            shortest = rolHeight;
            shortCol=i;
        }
    }
    UIEdgeInsets sectionInset = self.sectionInset;
    CGFloat width= attr.frame.size.width;
    CGFloat x = (shortCol+1)*sectionInset.left+ shortCol * width;
    CGFloat y = shortest.floatValue+self.minimumLineSpacing;
//    NSLog(@"坐标：%f index %ld",y,(long)attr.indexPath.row);
    //获取cell高度
    CGFloat height=attr.frame.size.height;
    attr.frame= CGRectMake(x, y, width, height);
    self.colsHeight[shortCol]=@(shortest.floatValue+self.minimumLineSpacing+height);

    return attr;
}
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray* array = [NSMutableArray array];
    NSInteger items = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i<items;i++) {
        UICollectionViewLayoutAttributes* attr = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [array addObject:attr];
    }
    return array;
//    NSArray *originalAttributes = [super layoutAttributesForElementsInRect:rect];
//    NSMutableArray *updatedAttributes = [NSMutableArray arrayWithArray:originalAttributes];
//
//    for (UICollectionViewLayoutAttributes *attributes in originalAttributes) {
//        if (!attributes.representedElementKind) {
//            NSUInteger index = [updatedAttributes indexOfObject:attributes];
//            updatedAttributes[index] = [self layoutAttributesForItemAtIndexPath:attributes.indexPath];
//        }
//    }
//    return updatedAttributes;
}
-(NSMutableArray *)colsHeight{
    if(!_colsHeight){
        NSMutableArray * array = [NSMutableArray array];
        for(int i =0;i<colCount;i++){
            //这里可以设置初始高度
            [array addObject:@(0)];
        }
        _colsHeight = [array mutableCopy];
    }
    return _colsHeight;
}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}
@end
