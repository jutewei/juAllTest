//
//  JuShopCell.h
//  JuTestTest
//
//  Created by Juvid on 2018/11/16.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class HMShop;
@interface JuShopCell : UICollectionViewCell
@property (nonatomic, strong) HMShop *shop;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@end

NS_ASSUME_NONNULL_END
