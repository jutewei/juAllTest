//
//  ViewController.m
//  JuTestTest
//
//  Created by Juvid on 2018/9/21.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "ViewController.h"
#import "JuChangMethod.h"
#import "JuRunLoop.h"
#import "JuNextViewController.h"
#import "JuArithmetic.h"
#import "JuTestEncrypt.h"
#import "JUMediator+DetailAction.h"
#import "JuSubFruits.h"
#import "JUURLCache.h"
#import "JuCollectionViewController.h"
#define ToRad(deg)         ( (M_PI * (deg-90)) / 180.0 )
@interface ViewController ()<JuFruitsDelegate>{
    JuRunLoop *ju_runLoop;
    NSInteger colorIndex;
}
@property (weak, nonatomic) IBOutlet UIView *ju_view;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.view.backgroundColor=[UIColor whiteColor];


    [JuArithmetic juBubbling];

    JuFruits * tool = [JuFruits buyTool:1];
    tool.delegate=self;
    [tool run];//成员关系从属于CarFactory类，所以调用CarFactory类中的run方法
    NSLog(@"花了:%d钱",[tool shouldPayMoney]);

    JuFruits * tool2 = [[JuSubFruits alloc]init];
    tool2.delegate=self;
    [tool2 run];
    NSLog(@"花了:%d钱",[tool2 shouldPayMoney]);

    JUURLCache *cache=[JUURLCache initWithPath:@"test" parameter:@{@"name":@"zhu",@"age":@"18"}];
    NSLog(@"%@",cache.juGetCached);
    [cache juGetCache:NO withData:^(id result) {
        NSLog(@"%@",result);
    }];
    [cache juSaveCacheData:@{@"name":@"zhu",@"age":@"18",@"sex":@"男"}];
//这是几个意思呢，这是做好事一定要要先留名嘛
//    [JuTestEncrypt juTest];

//    ju_runLoop=[[JuRunLoop alloc]init];
//    [ju_runLoop juStatrThread];
//
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
////        ju_runLoop=nil;
//    });
//
//    NSString *string=[NSString new];
//    JuChangMethod *chang=[[JuChangMethod alloc]init];
//    [chang method1:@"方法交换"];
//
//    [self juEqualString];
//    [self juEqualNum];

//    [self performSelector:<#(nonnull SEL)#> onThread:<#(nonnull NSThread *)#> withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#>]
    [self shDraw];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    ju_pointView.transform = CGAffineTransformMakeRotation(M_PI/4);
//    ju_pointView.layer.anchorPoint=CGPointMake(0.5, 1);
//
//    ju_pointView.layer.position = CGPointMake(ju_pointView.frame.origin.x+7,  ju_pointView.frame.origin.y+14+7);
}

-(void)shDraw{
    [_ju_view.superview layoutIfNeeded];

    // 阴影
    _ju_view.backgroundColor = nil;
    _ju_view.layer.masksToBounds = NO;
    _ju_view.layer.shadowOpacity = 1;
    _ju_view.layer.shadowOffset = CGSizeZero;
    _ju_view.layer.shadowRadius = 4;

    // 任意圆角
    CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:_ju_view.bounds
                                           byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(40, 40)].CGPath;
    CAShapeLayer *lay = [CAShapeLayer layer];
    lay.path = path;
   _ju_view.layer.mask = lay;

//    UIBezierPath *maskPath= [UIBezierPath bezierPathWithRoundedRect:_ju_view.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(8, 8)];
//
//
////    CAShapeLayer *border = [CAShapeLayer layer];
////    border.strokeColor = [UIColor redColor].CGColor;
////    border.fillColor = nil;
////    border.path = maskPath.CGPath;
////    border.frame = _ju_view.bounds;
////    border.shadowOpacity = 1;
////    border.shadowColor = [UIColor redColor].CGColor;
////    border.shadowOffset = CGSizeMake(0, 1);
////    border.lineWidth = 1.0f;
////    _ju_view.layer.mask=border;
////    [_ju_view.layer addSublayer:border];
//
//   _ju_view.layer.masksToBounds = NO;
//    _ju_view.layer.shadowOpacity = 1;
//    _ju_view.layer.shadowOffset = CGSizeZero;
//    _ju_view.layer.shadowColor=[UIColor redColor].CGColor;
//    _ju_view.layer.shadowRadius = 10;
//
//
//
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
//    maskLayer.frame = _ju_view.bounds;
//    maskLayer.fillColor = [UIColor greenColor].CGColor;
//    maskLayer.path = maskPath.CGPath;
////    [_ju_view.layer addSublayer:maskLayer];
//    _ju_view.layer.mask=maskLayer;
}
+(CABasicAnimation *) AlphaLight:(float)time
{
    CABasicAnimation *animation =[CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:1.0f];
    animation.toValue = [NSNumber numberWithFloat:0.0f];//这是透明度。
    animation.autoreverses = YES;
    animation.duration = time;//动画循环的时间，也就是呼吸灯效果的速度
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];

    return animation;
}

-(void)toHome:(Class)class{
    NSLog(@"%@",NSStringFromClass(class));
}
-(void)juEqualString{
    NSString *aString  = @"iPhone 8";
    NSString *akey  = @"www.key098765432.com";
    NSString *aString2 = @"iPhone 7";
    NSString *aString3 = @"iPhone 8";
    NSString *bString = [NSString stringWithFormat:@"iPhone %i", 8];
    NSLog(@"%@",akey);
    NSLog(@"%d", [aString isEqual:bString]);
    NSLog(@"%d", [aString isEqualToString:bString]);
    NSLog(@"%d", aString == bString);
    NSLog(@"%d", aString == aString2);
    NSLog(@"%d", aString == aString3);
    NSLog(@"%p %p %p %p", aString , aString3,aString2,bString);
}
- (IBAction)juRunDetail:(id)sender {
//    UIViewController *vc=[[JUMediator sharedInstance]JUMediator_Detail:^{
//        NSLog(@"显示了");
//    }];

//    UIViewController *vc=[[JUMediator sharedInstance]performActionWithUrl:[NSURL URLWithString:@"juvid://Detail/openWebVC"] completion:^(NSDictionary *parameter) {
//        NSLog(@"");
//    }];
//    [self.navigationController pushViewController:vc animated:YES];


    JuCollectionViewController *vc=[[JuCollectionViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)juEqualNum{
    id maybeAnArray = @[];
    if ([maybeAnArray class] == [NSArray class]) {
        //Code will never be executed
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
