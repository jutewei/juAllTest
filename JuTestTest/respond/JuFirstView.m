//
//  JuFirstView.m
//  JuTestTest
//
//  Created by Juvid on 2018/9/21.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuFirstView.h"

@implementation JuFirstView

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    return [super hitTest:point withEvent:event];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation JuSectionView

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    return [super hitTest:point withEvent:event];
}

@end


@implementation JuThirdView

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    return [super hitTest:point withEvent:event];
}

@end
