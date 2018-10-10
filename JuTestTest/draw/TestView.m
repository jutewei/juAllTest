//
//  TestView.m
//  testDraw
//
//  Created by minfo on 13-8-1.
//  Copyright (c) 2013年 minfo. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor whiteColor];
         }
//    NSLog(@"%f",frame.size.height);

    return self;
}

//三角形
- (void)drawTriangle {
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextBeginPath(ctx);
	CGContextMoveToPoint(ctx, 160, 220);
	CGContextAddLineToPoint(ctx, 190, 260);
	CGContextAddLineToPoint(ctx, 130, 260);
	CGContextClosePath(ctx);
	CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
	CGContextFillPath(ctx);
}
//正方形
- (void)drawRectangle {
	CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rectangle = CGRectMake(100, 290, 120, 25);
	CGContextAddRect(ctx, rectangle);
	CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
	CGContextFillPath(ctx);
}
//把
- (void)drawCurve {
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextBeginPath(ctx);
	CGContextMoveToPoint(ctx, 160, 100);
	CGContextAddQuadCurveToPoint(ctx, 160, 50, 190, 50);
	CGContextSetLineWidth(ctx, 20);
	CGContextSetStrokeColorWithColor(ctx, [UIColor brownColor].CGColor);
	CGContextStrokePath(ctx);
}
//大圆
- (void)drawEllipse {
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGRect rectangle = CGRectMake(10, 100, 300, 280);
	CGContextAddEllipseInRect(ctx, rectangle);
	CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
	CGContextFillPath(ctx);
}
//圆
- (void)drawCircleAtX:(float)x Y:(float)y {
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
	CGContextAddArc(ctx, x, y, 20, 0, 2 * M_PI, 1);
	CGContextFillPath(ctx);
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    [self drawEllipse];
    [self drawTriangle];
    [self drawRectangle];
	[self drawCurve];
    [self drawCircleAtX:120 Y:170];
    [self drawCircleAtX:200 Y:170];
//    NSLog(@"%f",self.frame.size.height);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
