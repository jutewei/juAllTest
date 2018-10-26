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
#import "JuURLCache.h"
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
    [self setViewAaimation];



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
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setViewAaimation{
    if (colorIndex==6) {
        colorIndex=0;
        return;
    }

    [UIView animateWithDuration:3 animations:^{
        if (self->colorIndex==0) {
            self.navigationController.navigationBar.barTintColor=[UIColor redColor];
        }else if (self->colorIndex==1){
            self.navigationController.navigationBar.barTintColor=[UIColor blueColor];
        }else if (self->colorIndex==2){
            self.navigationController.navigationBar.barTintColor=[UIColor yellowColor];
        }else if (self->colorIndex==3){
            self.navigationController.navigationBar.barTintColor=[UIColor greenColor];
        }else if (self->colorIndex==4){
            self.navigationController.navigationBar.barTintColor=[UIColor orangeColor];
        }else if (self->colorIndex==5){
            self.navigationController.navigationBar.barTintColor=[UIColor purpleColor];
        }else if (self->colorIndex==6){
            self.navigationController.navigationBar.barTintColor=[UIColor brownColor];
        }
    } completion:^(BOOL finished) {
        self->colorIndex++;
        [self setViewAaimation];
    }];
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
    UIViewController *vc=[[JUMediator sharedInstance]JUMediator_Detail:^{
        NSLog(@"显示了");
    }];
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
