//
//  JuAnimationVC.m
//  JuTestTest
//
//  Created by Juvid on 2019/1/24.
//  Copyright © 2019 Juvid. All rights reserved.
//

#import "JuAnimationVC.h"

@interface JuAnimationVC (){
    __weak IBOutlet UIImageView *ju_imgAni;
    __weak IBOutlet UIView *juView;
}

@end

@implementation JuAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self juChangeColor];
//    [self shTransformTotation];
    [self shKeyAnimation];
    [self shBezierPath];
    // Do any additional setup after loading the view.
}
- (IBAction)juChangeValue:(UISlider *)sender {
    juView.layer.timeOffset=sender.value;
}
-(void)juChangeColor{
    CABasicAnimation *changeColor = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    changeColor.fromValue = (id)[UIColor redColor].CGColor;
    changeColor.toValue   = (id)[UIColor greenColor].CGColor;
    changeColor.duration  = 1.0; // For convenience
    [juView.layer addAnimation:changeColor forKey:@"Change color"];
    juView.layer.speed = 0.0; // Pause the animation
}
-(void)shBezierPath{
    //创建路径
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 450)];
    [bezierPath addCurveToPoint:CGPointMake(370, 500) controlPoint1:CGPointMake(350, 200) controlPoint2:CGPointMake(300, 600)]; //一个曲线
    //路径样式
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor; //填充色<默认黑色>
    shapeLayer.strokeColor = [UIColor blueColor].CGColor; //线色
    shapeLayer.lineWidth = 2;
    [self.view.layer addSublayer:shapeLayer];
}
-(void)shTransformTotation{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue = [NSNumber numberWithFloat: M_PI *2];
    animation.duration = 1;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeRemoved;
    animation.repeatCount = MAXFLOAT; //如果这里想设置成一直自旋转，可以设置为MAXFLOAT，否则设置具体的数值则代表执行多少次
    [ju_imgAni.layer addAnimation:animation forKey:@"rotationAnimation"];
}
-(void)shKeyAnimation{
    CAKeyframeAnimation *animaiton = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    NSArray *rotationVelues = @[@(M_PI_4), @(-M_PI_4), @(M_PI_4)];
    animaiton.values = rotationVelues;
    animaiton.rotationMode = kCAAnimationRotateAuto;  //方向
    animaiton.duration = 3.0f;
    animaiton.keyTimes = @[@0.2 ,@0.8 ,@1];
//    animaiton.path = bezierPath.CGPath;
    animaiton.repeatCount = HUGE_VALF;     //   #define    HUGE_VALF    1e50f
    [ju_imgAni.layer addAnimation:animaiton forKey:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
