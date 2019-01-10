//
//  JuDrawArcGradient.m
//  JuTestTest
//
//  Created by Juvid on 2018/12/18.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuDrawArcGradient.h"

@implementation JuDrawArcGradient

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib {
    [super awakeFromNib];
    [self shSetView];
}
-(void)shSetView{
    [self setupColorLayer];
    [self setupColorMaskLayer];
}
- (void)setupColorMaskLayer {
    CAShapeLayer *layer = [self generateMaskLayer];
    self.colorLayer.mask = layer;
}

- (void)setupColorLayer {

    self.colorLayer = [CAShapeLayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 414, 400);
    [self.layer addSublayer:self.colorLayer];

    CAShapeLayer *layer = [self generateMaskLayer];
    self.colorLayer.mask=layer;

    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,414,400);
    gl.startPoint = CGPointMake(0.5613333582878113, 0.8869732022285461);
    gl.endPoint = CGPointMake(0.41999998688697815, -0.12835249304771423);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:164/255.0 green:239/255.0 blue:225/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:80/255.0 green:168/255.0 blue:254/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0),@(1.0f)];
    [self.colorLayer addSublayer:gl];

}
- (CAShapeLayer *)generateMaskLayer {
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(0, 0, 414, 400);
    UIBezierPath *bezier = [UIBezierPath bezierPath];
    [bezier moveToPoint:CGPointMake(0, 300)];
    [bezier addLineToPoint:CGPointMake(0, 0)];
    [bezier addLineToPoint:CGPointMake(414, 0)];
    [bezier addLineToPoint:CGPointMake(414, 300)];

    [bezier addQuadCurveToPoint:CGPointMake(0, 300)
                   controlPoint:CGPointMake(212,330)];

    layer.path = bezier.CGPath;
    layer.fillColor = [UIColor redColor].CGColor; // 填充色为透明（不设置为黑色）
    layer.strokeColor = [UIColor redColor].CGColor; // 随便设置一个边框颜色


    return layer;
}

@end
