//
//  JuDrawPumpkin.m
//  JuDrawPath
//
//  Created by Juvid on 2018/10/8.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuDrawPumpkin.h"

@implementation JuDrawPumpkin

-(void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor=[UIColor whiteColor];
    [self juDrawPumpkin];
}

-(void)juDrawPumpkin{
    [self drawEllipse];
    [self drawTriangle];
    [self drawRectangle];
    [self drawCurve];
    [self drawCircleAtX:120 Y:170];
    [self drawCircleAtX:200 Y:170];
}

//三角形
- (void)drawTriangle {

    UIBezierPath *curvePath = [UIBezierPath bezierPath];
    //  起点
    [curvePath moveToPoint:(CGPoint){160,220}];
    [curvePath addLineToPoint:(CGPoint){190,260}];
    [curvePath addLineToPoint:(CGPoint){130,260}];

    CAShapeLayer *curveLayer = [CAShapeLayer layer];
    curveLayer.path = curvePath.CGPath;
    curveLayer.fillColor=[UIColor blackColor].CGColor;
    [self.layer addSublayer:curveLayer];

}
//正方形
- (void)drawRectangle {
    UIBezierPath *rectanglePath = [UIBezierPath bezierPathWithRect:CGRectMake(100, 290, 120, 25)];
    //  起点
    CAShapeLayer *rectangleLayer = [CAShapeLayer layer];
    rectangleLayer.path = rectanglePath.CGPath;
    rectangleLayer.fillColor= [UIColor blackColor].CGColor;
    [self.layer addSublayer:rectangleLayer];
}
//把
- (void)drawCurve {
    UIBezierPath *curvePath = [UIBezierPath bezierPath];
    //  起点
    [curvePath moveToPoint:(CGPoint){160,100}];
    [curvePath addQuadCurveToPoint:CGPointMake(190, 50) controlPoint:CGPointMake(160, 50)]; // 二次贝塞尔曲线

    CAShapeLayer *curveLayer = [CAShapeLayer layer];
    curveLayer.path = curvePath.CGPath;
    curveLayer.lineWidth=20;
    curveLayer.strokeColor  = [UIColor brownColor].CGColor;   //  默认是black
    curveLayer.fillColor=nil;
    [self.layer addSublayer:curveLayer];
}
//大圆
- (void)drawEllipse {
    UIBezierPath *curvePath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(10, 100, 300, 280)];
    CAShapeLayer *curveLayer = [CAShapeLayer layer];
    curveLayer.path = curvePath.CGPath;
    curveLayer.fillColor=[UIColor orangeColor].CGColor;
    [self.layer addSublayer:curveLayer];
}
//小圆
- (void)drawCircleAtX:(float)x Y:(float)y {
    //两种方式画圆
    //    UIBezierPath *curvePath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(x-20, y-20, 40, 40)];
    UIBezierPath *curvePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(x, y) radius:20 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    CAShapeLayer *curveLayer = [CAShapeLayer layer];
    curveLayer.path = curvePath.CGPath;
    curveLayer.fillColor=[UIColor blackColor].CGColor;
    [self.layer addSublayer:curveLayer];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
