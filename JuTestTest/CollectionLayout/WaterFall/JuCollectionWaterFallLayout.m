//
//  JuCollectionWaterFallLayout.m
//  JuTestTest
//
//  Created by Juvid on 2019/6/1.
//  Copyright © 2019 Juvid. All rights reserved.
//

#import "JuCollectionWaterFallLayout.h"
CGFloat const colCount = 2;

@interface JuCollectionWaterFallLayout()

@end


@implementation JuCollectionWaterFallLayout

- (void)prepareLayout{
    [super prepareLayout];
    NSLog(@"prepareLayout");
    _ju_arrColumnHeight = [NSMutableArray array];
    _ju_dicAttribute = [NSMutableDictionary dictionary];
    self.delegate = (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
    //获取cell的总个数
    _ju_cellCount = [self.collectionView numberOfItemsInSection:0];
    if (_ju_cellCount == 0) {
        return;
    }
    float top = [self inset:[NSIndexPath indexPathForRow:0 inSection:0]].top;
    NSInteger column=MAX(colCount, _ju_columnCount);
    for (int i = 0; i < column; i++) {
        [_ju_arrColumnHeight addObject:[NSNumber numberWithFloat:top]];
    }
    //循环调用layoutForItemAtIndexPath方法，为每个cell布局，将indexPath传入，作为布局字典的key
    //layoutAttributesForItemAtIndexPath方法的实现，这里用到了一个布局字典，其实就是将每个cell的位置信息与indexPath相对应，将它们放到字典中，方便后面视图的检索
    for (int i = 0; i < _ju_cellCount; i++) {
        [self layoutItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
    }

}
-(UIEdgeInsets )inset:(NSIndexPath *)indexPath{
    UIEdgeInsets edgeInsets = self.sectionInset;
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
        edgeInsets =[self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:indexPath.row];
    }
    return edgeInsets;
}
//此方法会多次调用，为每个cell布局
- (void)layoutItemAtIndexPath:(NSIndexPath *)indexPath{
    //通过协议得到cell的间隙
    NSLog(@"layoutItemAtIndexPath");
    UIEdgeInsets edgeInsets = self.sectionInset;
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
        edgeInsets =[self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:indexPath.row];
    }
    CGSize itemSize = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    float column = 0;
    float shortHeight = [[_ju_arrColumnHeight objectAtIndex:column] floatValue];
    //找出高度最小的列，将cell加到最小列中
    for (int i = 0; i < _ju_arrColumnHeight.count; i++) {
        float height = [[_ju_arrColumnHeight objectAtIndex:i] floatValue];
        if (height < shortHeight) {
            shortHeight = height;
            column = i;
        }
    }
    float top = [[_ju_arrColumnHeight objectAtIndex:column] floatValue];
    CGFloat lineSpacing = self.minimumLineSpacing;
    CGFloat itemSpace = self.minimumInteritemSpacing;
    NSLog(@"top:%f",top);
    //确定cell的frame
    CGRect frame = CGRectMake(edgeInsets.left + column * (itemSpace + itemSize.width), top , itemSize.width, itemSize.height);
    top+=lineSpacing;
    NSLog(@"frme:%@",NSStringFromCGRect(frame));
    //更新列高
    [_ju_arrColumnHeight replaceObjectAtIndex:column withObject:[NSNumber numberWithFloat:top  + itemSize.height]];

    //每个cell的frame对应一个indexPath，放入字典中
    [_ju_dicAttribute setObject:indexPath forKey:NSStringFromCGRect(frame)];
}

- (NSArray *)indexPathsOfItem:(CGRect)rect{
    //遍历布局字典通过CGRectIntersectsRect方法确定每个cell的rect与传入的rect 是否有交集，如果结果为true，则此cell应该显示，将布局字典中对应的indexPath加入数组
    NSLog(@"indexPathsOfItem");
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *rectStr in _ju_dicAttribute) {
        CGRect cellRect = CGRectFromString(rectStr);
        if (CGRectIntersectsRect(cellRect, rect)) {
            NSIndexPath *indexPath = _ju_dicAttribute[rectStr];
            [array addObject:indexPath];
        }
    }
    return array;
}

//返回cell的布局信息，如果忽略传入的rect一次性将所有的cell布局信息返回，图片过多时性能会很差
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSLog(@"layoutAttributesForElementsInRect");
    NSMutableArray *muArr = [NSMutableArray array];
    //indexPathsOfItem方法，根据传入的frame值计算当前应该显示的cell
    NSArray *indexPaths = [self indexPathsOfItem:rect];
    for (NSIndexPath *indexPath in indexPaths) {
        //  UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
        UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
        [muArr addObject:attribute];
    }
    return muArr;
}

//返回每个CollectionViewCell的属性
-(UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    for (NSString *rectStr in _ju_dicAttribute) {
        if (_ju_dicAttribute[rectStr]==indexPath) {
            attributes.frame = CGRectFromString(rectStr);
        }
    }
    return attributes;
}

//最后还要实现这个方法，返回collectionView内容的大小
//只需要遍历前面创建的存放列高的数组得到列最高的一个作为高度返回就可以了
- (CGSize)collectionViewContentSize{
    NSLog(@"collectionViewContentSize");
    CGSize size = self.collectionView.frame.size;
    float maxHeight = [[_ju_arrColumnHeight objectAtIndex:0] floatValue];
    //查找最高的列的高度
    for (int i = 0; i < _ju_arrColumnHeight.count; i++) {
        float colHeight = [[_ju_arrColumnHeight objectAtIndex:i] floatValue];
        if (colHeight > maxHeight) {
            maxHeight = colHeight;
        }
    }
    size.height = maxHeight;
    return size;
}


@end
