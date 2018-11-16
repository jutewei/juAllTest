//
//  JuShopCell.m
//  JuTestTest
//
//  Created by Juvid on 2018/11/16.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuShopCell.h"
#import "HMShop.h"

@implementation JuShopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setShop:(HMShop *)shop
{
    _shop = shop;

    // 1.图片
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:shop.img] placeholderImage:[UIImage imageNamed:@"loading"]];

    // 2.价格
    self.priceLabel.text = shop.price;
}

@end
