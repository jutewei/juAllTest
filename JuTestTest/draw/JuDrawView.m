//
//  JuDrawView.m
//  JuDrawPath
//
//  Created by Juvid on 2018/10/8.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuDrawView.h"

@implementation JuDrawView{
    CAShapeLayer *curveLayer;
    BOOL isEnd;
}

-(void)awakeFromNib{
    [super awakeFromNib];
     self.backgroundColor=[UIColor whiteColor];
    [self juCurveToPoint];
//    [self juDisplayLine];
//    [self juMoreLayer];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)didMoveToSuperview{
    [super didMoveToSuperview];

}
-(void)juMoreLayer{
    //   创建一个路径对象
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    //  起点
    [linePath moveToPoint:(CGPoint){20,40}];
    // 其他点
    [linePath addLineToPoint:(CGPoint){20,60}];
    [linePath addLineToPoint:(CGPoint){220,60}];
    [linePath addLineToPoint:(CGPoint){220,40}];
    [linePath addQuadCurveToPoint:(CGPoint){20,40} controlPoint:CGPointMake(120, 0)]; // 二次贝塞尔曲线


    //  设置路径画布
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.bounds = (CGRect){0,0,200,400};
    lineLayer.position = CGPointMake(200, 700);
    lineLayer.lineWidth = 1.0;
    lineLayer.strokeColor = [UIColor purpleColor].CGColor; //   边线颜色

    lineLayer.path = linePath.CGPath;
    lineLayer.fillColor  = [UIColor whiteColor].CGColor;   //  默认是black
    [self.layer addSublayer:lineLayer];
}
//三次曲线
-(void)juCurveToPoint{
    CGPoint startPoint = CGPointMake(20, 100);
    CGPoint endPoint = CGPointMake(260, 100);

    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:startPoint];
    [path1 addCurveToPoint:endPoint controlPoint1:CGPointMake(140, 0) controlPoint2:CGPointMake(140, 200)];
    curveLayer = [CAShapeLayer layer];
    curveLayer.position = (CGPoint){100,50};
    curveLayer.lineWidth = 2;
    curveLayer.strokeColor = [UIColor greenColor].CGColor;
    curveLayer.fillColor = nil; // 默认为blackColor
    curveLayer.path = path1.CGPath;
    [self.layer addSublayer:curveLayer];
    curveLayer.strokeEnd=0;

    CADisplayLink *linkPlay = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave)];
    [linkPlay addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}
- (void)getCurrentWave {

    if (curveLayer.strokeEnd >= 1) {
        isEnd=YES;
        [NSThread sleepForTimeInterval:0.3];
    }else if (curveLayer.strokeEnd <=0 ){
        isEnd=NO;
          [NSThread sleepForTimeInterval:0.3];
    }

    if (isEnd) {
        curveLayer.strokeEnd-=0.002;
    }else{
        curveLayer.strokeEnd+=0.002;
    }
}
//两次曲线
-(void)juQuadCurve{
    CGPoint startPoint = CGPointMake(0, 100);
    CGPoint endPoint = CGPointMake(200, 50);
    //   绿色二次贝塞尔曲线
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:startPoint];
    [path1 addQuadCurveToPoint:endPoint controlPoint:CGPointMake(100, 200)]; // 二次贝塞尔曲线
    CAShapeLayer *path1Layer = [CAShapeLayer layer];
    path1Layer.position = (CGPoint){100,100};
    path1Layer.lineWidth = 2;
    path1Layer.strokeColor = [UIColor greenColor].CGColor;
    path1Layer.fillColor = nil; // 默认为blackColor
    path1Layer.path = path1.CGPath;
    [self.layer addSublayer:path1Layer];


    // 红色二次贝塞尔曲线
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:startPoint];
    [path2 addQuadCurveToPoint:endPoint controlPoint:CGPointMake(100, 150)]; // 二次贝塞尔曲线
    CAShapeLayer *path2Layer = [CAShapeLayer layer];
    path2Layer.position = (CGPoint){100,100};
    path2Layer.lineWidth = 2;
    path2Layer.strokeColor = [UIColor redColor].CGColor;
    path2Layer.fillColor = nil; // 默认为blackColor
    path2Layer.path = path2.CGPath;
    [self.layer addSublayer:path2Layer];


}
-(void)juDisplayLine{
    //   创建一个路径对象
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    //  起点
    [linePath moveToPoint:(CGPoint){20,20}];
    // 其他点
    [linePath addLineToPoint:(CGPoint){160,160}];
    [linePath addLineToPoint:(CGPoint){180,50}];
    //    [linePath addLineToPoint:(CGPoint){80,60}];
    [linePath addLineToPoint:(CGPoint){20,20}];

    [linePath closePath];

    [linePath moveToPoint:(CGPoint){150,200}];
    [linePath addArcWithCenter:CGPointMake(100, 200) radius:50 startAngle:0 endAngle:2*M_PI clockwise:YES];



    //  设置路径画布
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.bounds = (CGRect){0,0,200,400};
    lineLayer.position = CGPointMake(200, 400);
    lineLayer.lineWidth = 2.0;
    lineLayer.strokeColor = [UIColor orangeColor].CGColor; //   边线颜色

    lineLayer.path = linePath.CGPath;
    lineLayer.fillColor  = nil;   //  默认是black
    [self.layer addSublayer:lineLayer];

    lineLayer.strokeEnd=0.01;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        lineLayer.strokeEnd=1;
    });
}
//- (void)drawRect:(CGRect)rect {
//    [super drawRect:rect];
//    // Initialization code
//
//    [self drawCurve];
//}

- (void)drawCurve {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 160, 100);
    CGContextAddQuadCurveToPoint(ctx, 160, 50, 190, 50);
    CGContextSetLineWidth(ctx, 20);
    CGContextSetStrokeColorWithColor(ctx, [UIColor brownColor].CGColor);
    CGContextStrokePath(ctx);
}





@end
