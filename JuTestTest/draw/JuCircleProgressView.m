//
//  JuCircleProgressView.m
//  JuCircleProgress
//
//  Created by Juvid on 2017/11/20.
//  Copyright © 2017年 Juvid. All rights reserved.
//

#import "JuCircleProgressView.h"

#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface JuCircleProgressView()

@end

@implementation JuCircleProgressView


- (void)awakeFromNib {
    [super awakeFromNib];
    _ju_progressColors=@[(id)kUIColorFromRGB(0xff0000).CGColor,(id)kUIColorFromRGB(0x0000ff).CGColor];
    self.ju_progressWidth=5;
    [self shSetView];
}

-(void)shSetView{
//    self.backgroundColor = kUIColorFromRGB(0xE5F1FF);
    [self setupColorLayer];
    [self setupColorMaskLayer];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/**
*  设置整个蓝色view的遮罩
*/
/*- (void)setupBlueMaskLayer {
    CAShapeLayer *layer = [self generateMaskLayer];
    self.layer.mask = layer;
    self.blueMaskLayer = layer;
    self.blueMaskLayer.strokeEnd =1;
}*/
/**
 *  设置渐变色的遮罩
 */
- (void)setupColorMaskLayer {
    CAShapeLayer *layer = [self generateMaskLayer];
//    layer.lineWidth = _ju_progressWidth + 0.5; // 渐变遮罩线宽较大，防止蓝色遮罩有边露出来
    self.colorLayer.mask = layer;
//    self.colorMaskLayer = layer;
}

/**
 *  设置渐变色，渐变色由左右两个部分组成，左边部分由黄到绿，右边部分由黄到红(渐变背景)
 */
- (void)setupColorLayer {

    [self.superview layoutIfNeeded];

    self.colorLayer = [CAShapeLayer layer];
    self.colorLayer.frame = CGRectMake(0, 0, 414, 400);
    [self.layer addSublayer:self.colorLayer];


    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,414,400);
    gl.startPoint = CGPointMake(0.5613333582878113, 0.8869732022285461);
    gl.endPoint = CGPointMake(0.41999998688697815, -0.12835249304771423);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:164/255.0 green:239/255.0 blue:225/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:80/255.0 green:168/255.0 blue:254/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0),@(1.0f)];
    [self.colorLayer addSublayer:gl];

//    CAGradientLayer *leftLayer = [CAGradientLayer layer];
//    leftLayer.frame = CGRectMake(0, 0, 414, 400);
//    // 分段设置渐变色
//    leftLayer.locations = @[@0.3, @0.9, @1];
//    leftLayer.colors = _ju_progressColors;
//    [self.colorLayer addSublayer:leftLayer];

}

/**
 *  生成一个圆环形的遮罩层
 *  因为蓝色遮罩与渐变遮罩的配置都相同，所以封装出来
 *
 *  @return 环形遮罩
 */
- (CAShapeLayer *)generateMaskLayer {

    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(0, 0, 414, 400);

    // 创建一个圆心为父视图中点的圆，半径为父视图宽的2/5，起始角度是从-240°到60°

//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(SELF_WIDTH/2.0, SELF_WIDTH/2.0) radius:(SELF_WIDTH-_ju_progressWidth)/2.0 startAngle:M_PI*1.5 endAngle:M_PI*3.5 clockwise:YES];
//    CGSize finalSize =  CGSizeMake(414, 400);
//    CGFloat layerHeight = 100;

    UIBezierPath *bezier = [UIBezierPath bezierPath];

    [bezier moveToPoint:CGPointMake(0, 300)];
    [bezier addLineToPoint:CGPointMake(0, 0)];
    [bezier addLineToPoint:CGPointMake(414, 0)];
    [bezier addLineToPoint:CGPointMake(414, 300)];

    [bezier addQuadCurveToPoint:CGPointMake(0, 300)
                   controlPoint:CGPointMake(212,330)];

//    layer.lineWidth =100;
    layer.path = bezier.CGPath;
    layer.fillColor = [UIColor redColor].CGColor; // 填充色为透明（不设置为黑色）
    layer.strokeColor = [UIColor redColor].CGColor; // 随便设置一个边框颜色
//    layer.lineCap = kCALineCapRound; // 设置线为圆角


//    CGSize finalSize =  CGSizeMake(414, 400);
//    CGFloat layerHeight = 100;
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    UIBezierPath *bezier = [UIBezierPath bezierPath];
//    [bezier moveToPoint:CGPointMake(0, finalSize.height - layerHeight)];
//    [bezier addLineToPoint:CGPointMake(0, finalSize.height - 1)];
//    [bezier addLineToPoint:CGPointMake(finalSize.width, finalSize.height - 1)];
//    [bezier addLineToPoint:CGPointMake(finalSize.width, finalSize.height - layerHeight)];
//    [bezier addQuadCurveToPoint:CGPointMake(0,finalSize.height - layerHeight)
//                   controlPoint: CGPointMake(finalSize.width / 2, (finalSize.height - layerHeight) - 40)];
//    layer.path = bezier.CGPath;
//    layer.fillColor = [UIColor clearColor].CGColor;
//    layer.strokeColor = [UIColor blackColor].CGColor; // 随便设置一个边框颜色

    return layer;
}


- (void)setJu_Progress:(CGFloat)ju_Progress {
    _ju_Progress = ju_Progress;
    self.colorMaskLayer.strokeEnd = ju_Progress;
}
@end
