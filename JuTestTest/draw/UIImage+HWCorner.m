//
//  UIImage+HWCorner.m
//  JuTestTest
//
//  Created by Juvid on 2018/9/25.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "UIImage+HWCorner.h"

@implementation UIImage (HWCorner)
- (UIImage *)drawCornerInRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius{
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    UIGraphicsBeginImageContextWithOptions(rect.size, false, [UIScreen mainScreen].scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(), bezierPath.CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:rect];
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;

}


@end
