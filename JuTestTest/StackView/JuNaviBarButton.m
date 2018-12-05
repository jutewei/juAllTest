//
//  JuNaviBarButton.m
//  JuTestTest
//
//  Created by Juvid on 2018/11/27.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuNaviBarButton.h"

@implementation JuNaviBarButton{
    BOOL isFinishFix;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    if ([[[UIDevice currentDevice] systemVersion] floatValue]  < 11||isFinishFix) return;
    UIView *view = self;
    while (![view isKindOfClass:UINavigationBar.class] && view.superview) {
        view = [view superview];
        if ([view isKindOfClass:UIStackView.class] && view.superview) {
              NSLog(@"视图 %@",view);
                for (NSLayoutConstraint *constraint in view.superview.constraints) {
                    if ([constraint.firstItem isKindOfClass:UILayoutGuide.class]) {
                        if(constraint.firstAttribute == NSLayoutAttributeTrailing){
                            isFinishFix=YES;
                            NSLog(@"右边 第一个:%@ 第二个:%@ 距离：%f",constraint.firstItem,constraint.secondItem,constraint.constant);
                            constraint.constant=0;
                        }else if (constraint.firstAttribute == NSLayoutAttributeLeading){
//                            NSLog(@"左边  第一个:%@ 第二个:%@",constraint.firstItem,constraint.secondItem);
                            constraint.constant=0;
                        }
                    }
                }
            break;
        }
    }
}

-(void)didMoveToSuperview{
    [super didMoveToSuperview];
    if (self.superview) {

    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
