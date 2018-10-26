//
//  JUCollectionViewLayout.m
//  JuTestTest
//
//  Created by Juvid on 2018/10/26.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JUCollectionViewLayout.h"

@implementation JUCollectionViewLayout
- (void)prepareLayout{
    [super prepareLayout];
    NSMutableArray *layoutInfoArr = [NSMutableArray array];
    NSInteger maxNumberOfItems = 0;
    //获取布局信息
    NSInteger numberOfSections = [self.collectionView numberOfSections];
    for (NSInteger section = 0; section < numberOfSections; section++){
        NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:section];
        NSMutableArray *subArr = [NSMutableArray arrayWithCapacity:numberOfItems];
        for (NSInteger item = 0; item < numberOfItems; item++){
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
            [subArr addObject:attributes];
        }
        if(maxNumberOfItems < numberOfItems){
            maxNumberOfItems = numberOfItems;
        }
        //添加到二维数组
        [layoutInfoArr addObject:[subArr copy]];
    }
//    //存储布局信息
//    self.layoutInfoArr = [layoutInfoArr copy];
//    //保存内容尺寸
//    self.contentSize = CGSizeMake(maxNumberOfItems*(self.itemSize.width+self.interitemSpacing)+self.interitemSpacing, numberOfSections*(self.itemSize.height+self.lineSpacing)+self.lineSpacing);
}
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //每一组cell为一行
//    attributes.frame = CGRectMake((self.itemSize.width+self.interitemSpacing)*indexPath.row+self.interitemSpacing, (self.itemSize.height+self.lineSpacing)*indexPath.section+self.lineSpacing, self.itemSize.width, self.itemSize.height);
    return attributes;
}
//- (CGSize)collectionViewContentSize{
//    return self.contentSize;
//}
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *layoutAttributesArr = [NSMutableArray array];
//    [self.layoutInfoArr enumerateObjectsUsingBlock:^(NSArray *array, NSUInteger i, BOOL * _Nonnull stop) {
//        [array enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            if(CGRectIntersectsRect(obj.frame, rect)) {
//                [layoutAttributesArr addObject:obj];
//            }
//        }];
//    }];
    return layoutAttributesArr;
}
@end
