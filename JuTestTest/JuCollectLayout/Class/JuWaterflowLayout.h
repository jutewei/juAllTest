//
//  JuWaterflowLayout.h
//  JuTestTest
//
//  Created by Juvid on 2018/11/16.
//  Copyright © 2018年 Juvid. All rights reserved.
//
/*
 *瀑布流布局
 *
 */
#import <UIKit/UIKit.h>


@class JuWaterflowLayout;

@protocol HMWaterflowLayoutDelegate <NSObject>

//通过宽度和indexpath 返回当前位置的高度
- (CGFloat)waterflowLayout:(JuWaterflowLayout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath;

@end
NS_ASSUME_NONNULL_BEGIN

@interface JuWaterflowLayout : UICollectionViewLayout
//距离边上多少距离
@property (nonatomic, assign) UIEdgeInsets sectionInset;
/** 每一列之间的间距 */
@property (nonatomic, assign) CGFloat columnMargin;
/** 每一行之间的间距 */
@property (nonatomic, assign) CGFloat rowMargin;
/** 显示多少列 */
@property (nonatomic, assign) int columnsCount;

@property (nonatomic, weak) id<HMWaterflowLayoutDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
