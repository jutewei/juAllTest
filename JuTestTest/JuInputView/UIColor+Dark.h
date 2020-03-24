//
//  UIColor+Hex.h
//  UIColorManager
//
//  Created by Juvid on 2019/11/7.
//  Copyright © 2019 Juvid. All rights reserved.
//

#define UIColorFromRGB(rgbValue)            [UIColor colorWithHex:rgbValue alpha:1.0]
#define UIColorFromRGBA(rgbValue,aValue)    [UIColor colorWithHex:rgbValue alpha:aValue]

#define JUDarkColorHex(value)               [UIColor colorDarkWithHex:value alpha:1]
#define JUDarkColorHexA(value,aV)           [UIColor colorDarkWithHex:value alpha:aV]

#define JUDarkColorWhiteA(wV,aV)            [UIColor colorDarkWithWhite:wV alpha:aV]
#define JUDarkColorRBGA(rV,gV,bV,aV)        [UIColor colorDarkWithRed:rV green:gV blue:bV alpha:aV]

#define JUDarkColorBothCol(wV,dV)           [UIColor colorWithWhite:wV darkColor:dV]
#define JUDarkColorBothRGB(wRGB,dRGB)       [UIColor colorWithWhite:UIColorFromRGB(wRGB) darkColor:UIColorFromRGB(dRGB)]

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Dark)


+(UIColor *)colorWithHex:(NSInteger)rgbV alpha:(CGFloat)alpha;

/// 16进制暗黑模式自动反转
/// @param rgbValue 16进制数
/// @param alpha 透明度
+ (UIColor *)colorDarkWithHex:(NSInteger)rgbValue alpha:(CGFloat)alpha;

/// 白色-黑色 暗黑模式自动反转
/// @param wValue 白色值
/// @param alpha 透明度
+ (UIColor *)colorDarkWithWhite:(NSInteger)wValue alpha:(CGFloat)alpha;

/// 十进制RBG颜色暗黑模式自动反转
/// @param red 红色
/// @param green 绿色
/// @param blue 蓝色
/// @param alpha 透明度
+ (UIColor *)colorDarkWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/// 暗黑模式颜色设置
/// @param whiteColor 白色
/// @param darkColor 黑色
+ (UIColor *)colorWithWhite:(UIColor *)whiteColor darkColor:(UIColor *)darkColor;

@end

NS_ASSUME_NONNULL_END
