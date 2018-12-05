//
//  UINavigationBar+barItem.m
//  JuTestTest
//
//  Created by Juvid on 2018/11/27.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "UINavigationBar+barItem.h"

@implementation UINavigationBar (barItem)
-(void)layoutSubviews{
    [super layoutSubviews];
    for (UIView *subView in self.subviews) {
        for (UIView *view in subView.subviews) {
            if ([view isKindOfClass:[UIStackView class]]) {
                CGRect frame=view.frame;
                frame.origin.x=360;
                view.frame=frame;
            }
            NSLog(@"%@",view);
        }
    }
}
@end
