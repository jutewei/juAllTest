//
//  UIColor+Hex.m
//  UIColorManager
//
//  Created by Juvid on 2019/11/7.
//  Copyright © 2019 Juvid. All rights reserved.
//

#import "UIColor+Dark.h"

@implementation UIColor (Dark)

+(UIColor *)colorWithHex:(NSInteger)rgbV alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:((float)((rgbV & 0xFF0000) >> 16))/255.0 green:((float)((rgbV & 0xFF00) >> 8))/255.0 blue:((float)(rgbV & 0xFF))/255.0 alpha:alpha];
}
/// 16进制暗黑模式自动反转
+(UIColor *)colorDarkWithHex:(NSInteger)rgbV alpha:(CGFloat)alpha{
	return [self colorWithWhite:[UIColor colorWithRed:((float)((rgbV & 0xFF0000) >> 16))/255.0 green:((float)((rgbV & 0xFF00) >> 8))/255.0 blue:((float)(rgbV & 0xFF))/255.0 alpha:alpha] darkColor:[UIColor colorWithRed:1-((float)((rgbV & 0xFF0000) >> 16))/255.0 green:1-((float)((rgbV & 0xFF00) >> 8))/255.0 blue:1-((float)(rgbV & 0xFF))/255.0 alpha:alpha]];
}

/// 白色-黑色 暗黑模式自动反转
+(UIColor *)colorDarkWithWhite:(NSInteger)wValue alpha:(CGFloat)alpha{
    return [self colorWithWhite:[UIColor colorWithWhite:wValue alpha:alpha] darkColor:[UIColor colorWithWhite:1-wValue alpha:alpha]];
}

/// 十进制RBG颜色暗黑模式自动反转
+ (UIColor *)colorDarkWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha{
    return [self colorWithWhite:[UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha] darkColor:[UIColor colorWithRed:1-red/255.0 green:1-green/255.0 blue:1-blue/255.0 alpha:alpha]];
}

/// 暗黑模式颜色设置
+(UIColor *)colorWithWhite:(UIColor *)whiteColor darkColor:(UIColor *)darkColor{
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle== UIUserInterfaceStyleDark) {
                return darkColor;
            }
            else{
                return whiteColor;
            }
        }];
    } else {
        return whiteColor;
    }
}

@end
