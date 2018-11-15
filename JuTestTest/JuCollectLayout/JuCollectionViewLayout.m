//
//  JuCollectionViewLayout.m
//  JuTestTest
//
//  Created by Juvid on 2018/11/13.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuCollectionViewLayout.h"

@implementation JuCollectionViewLayout


///每次更新layout布局都会首先调用此方法
-(void)prepareLayout{
    NSLog(@"---------1");
    ///和init相似，必须call super的prepareLayout以保证初始化正确
    [super prepareLayout];
    ///1.首先被调用
}
///返回collectionView的内容的尺寸
-(CGSize)collectionViewContentSize{
    ///2.其次被调用(layoutAttributesForElementsInRect 调用后会在此调用此方法)
    return [super collectionViewContentSize];
//    return CGSizeMake(self.collectionView.bounds.size.width, 60);
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    ///3.被调用
    NSArray *originalAttributes = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *updatedAttributes = [NSMutableArray arrayWithArray:originalAttributes];
    NSMutableIndexSet *noneHeaderSections = [NSMutableIndexSet indexSet];
    for (UICollectionViewLayoutAttributes *attributes in originalAttributes) {
        if (!attributes.representedElementKind) {
            NSUInteger index = [updatedAttributes indexOfObject:attributes];
            updatedAttributes[index] = [self layoutAttributesForItemAtIndexPath:attributes.indexPath];
            [noneHeaderSections addIndex:attributes.indexPath.section];
        }else{
            [noneHeaderSections addIndex:attributes.indexPath.section];
        }
    }
    return updatedAttributes;
}
///返回对应于indexPath的位置的cell的布局属性,返回指定indexPath的item的布局信息。子类必须重载该方法,该方法只能为cell提供布局信息，不能为补充视图和装饰视图提供。
-(UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath*)indexPath{
    UICollectionViewLayoutAttributes *attributs = [[super layoutAttributesForItemAtIndexPath:indexPath] copy];
//    如果是第一个，不做任何计算
    if (attributs.indexPath.row==0) {
        return attributs;
    }

    UIEdgeInsets sectionInset = self.sectionInset;
    CGFloat layoutWidth = CGRectGetWidth(self.collectionView.frame) - sectionInset.left - sectionInset.right;

//    上一个cell
    NSIndexPath* previousIndexPath = [NSIndexPath indexPathForItem:indexPath.item-1 inSection:indexPath.section];
    CGRect previousFrame = [self layoutAttributesForItemAtIndexPath:previousIndexPath].frame;
    CGFloat previousFrameRightPoint = previousFrame.origin.x + previousFrame.size.width;
    CGRect currentFrame = attributs.frame;
    CGRect strecthedCurrentFrame = CGRectMake(sectionInset.left,
                                              currentFrame.origin.y,
                                              layoutWidth,
                                              currentFrame.size.height);
    BOOL isFirstItemInRow = !CGRectIntersectsRect(previousFrame, strecthedCurrentFrame);
    //每行的第一个
    if (isFirstItemInRow) {
        // make sure the first item on a line is left aligned
        return attributs;
    }
    CGRect frame = attributs.frame;
    frame.origin.x = previousFrameRightPoint + self.minimumInteritemSpacing;
    attributs.frame = frame;
    if (currentFrame.origin.y<ju_lowPoint.y) {
         ju_lowPoint=currentFrame.origin;
    }

    return attributs;
}

///返回对应于indexPath的位置的追加视图的布局属性，如果没有追加视图可不重载
-(UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attributs =  [super layoutAttributesForSupplementaryViewOfKind:kind atIndexPath:indexPath];
    CGRect frame=attributs.frame;
//    frame.origin.x=0;
//    frame.origin.y=0;
    attributs.frame=frame;
    return attributs;
}

///返回对应于indexPath的位置的装饰视图的布局属性，如果没有装饰视图可不重载
-(UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString*)decorationViewKind atIndexPath:(NSIndexPath*)indexPath{
    return [super layoutAttributesForDecorationViewOfKind:decorationViewKind atIndexPath:indexPath];
}

///当边界发生改变时，是否应该刷新布局。如果YES则在边界变化（一般是scroll到其他地方）时，将重新计算需要的布局信息。
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return [super shouldInvalidateLayoutForBoundsChange:newBounds];
}


@end
