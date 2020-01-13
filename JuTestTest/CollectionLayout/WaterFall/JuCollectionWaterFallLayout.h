//
//  JuCollectionWaterFallLayout.h
//  JuTestTest
//
//  Created by Juvid on 2019/6/1.
//  Copyright © 2019 Juvid. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JuCollectionWaterFallLayout : UICollectionViewFlowLayout

@property(nonatomic,assign)id<UICollectionViewDelegateFlowLayout> delegate;
@property(nonatomic,assign)NSInteger ju_columnCount;//列数
@property(nonatomic,assign)NSInteger ju_cellCount;//cell的个数
@property(nonatomic,strong)NSMutableArray *ju_arrColumnHeight;//存放列的高度
@property(nonatomic,strong)NSMutableDictionary *ju_dicAttribute;//cell的位置信息

@end

NS_ASSUME_NONNULL_END
