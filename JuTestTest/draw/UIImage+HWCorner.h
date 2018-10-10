//
//  UIImage+HWCorner.h
//  JuTestTest
//
//  Created by Juvid on 2018/9/25.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HWCorner)
- (UIImage *)drawCornerInRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius;
@end
