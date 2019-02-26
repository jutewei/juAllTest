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
#import "StackView/StackViewController.h"
#import "JuLocationWebViewController.h"
#import "JuWebViewController.h"
#import "NSString+Format.h"
#import "NSObject+Invocation.h"
#import "JuVariable.h"
#define ToRad(deg)         ( (M_PI * (deg-90)) / 180.0 )
@interface ViewController ()<JuFruitsDelegate>{
    JuRunLoop *ju_runLoop;
    NSInteger colorIndex;
    __weak IBOutlet UIButton *ju_btnTest;
    __weak IBOutlet UIImageView *ju_imgAni;
    __weak IBOutlet UILabel *ju_labTest;
}
@property (weak, nonatomic) IBOutlet UIView *ju_view;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *languages = [[NSUserDefaults standardUserDefaults] valueForKey:@"AppleLanguages"];
    NSString *currentLanguage = languages.firstObject;
    NSLog(@"模拟器当前语言：%@",currentLanguage);

    NSLog(@"%@",NSLocalizedString(@"click", nil));
    JuVariable *variable=[[JuVariable alloc]init];
    [variable juStart];

    [_ju_view.layer setCornerRadius:90];
    _ju_view.layer.shadowColor = [UIColor redColor].CGColor;
    _ju_view.layer.shadowOffset = CGSizeMake(0, 0);
    _ju_view.layer.shadowOpacity = 1;
    _ju_view.layer.shadowRadius = 5;

    [self shTransformTotation];
    [self juInvocationSelector:@selector(juTest1:test2:) withObjects:@[@"test1",@"test2"]];
    ;
//    ju_btnTest.selected=YES;
//    self.navigationController.view.backgroundColor=[UIColor whiteColor];
//    [[NSNotificationCenter defaultCenter]addObserver:self
//                                            selector:@selector(testNoti1)
//                                                name:@"test"
//                                              object:nil];
//
//    [JuArithmetic juBubbling];
//
//    JuFruits * tool = [JuFruits buyTool:1];
//    tool.delegate=self;
//    [tool run];//成员关系从属于CarFactory类，所以调用CarFactory类中的run方法
//    NSLog(@"花了:%d钱",[tool shouldPayMoney]);
//
//    JuFruits * tool2 = [[JuSubFruits alloc]init];
//    tool2.delegate=self;
//    [tool2 run];
//    NSLog(@"花了:%d钱",[tool2 shouldPayMoney]);
//
//    JUURLCache *cache=[JUURLCache initWithPath:@"test" parameter:@{@"name":@"zhu",@"age":@"18"}];
//    NSLog(@"%@",cache.juGetCached);
//    [cache juGetCache:NO withData:^(id result) {
//        NSLog(@"%@",result);
//    }];
//    [cache juSaveCacheData:@{@"name":@"zhu",@"age":@"18",@"sex":@"男"}];
//    NSString *url=@"https://p.i.cdn.pifubao.com/12%E6%9C%88%E7%AD%94%E7%96%91%E8%A7%A3%E6%83%91%E6%8B%BF%E5%A5%BD%E7%A4%BC-%E8%90%BD%E5%9C%B0%E9%A1%B5";
//    NSURL *pathUrl=[NSURL URLWithString:url];
//
//    NSString *string=@"www.zhidao.baidu.com";//com/baidu/zhidao/www
//    NSMutableString *afterStr=[NSMutableString string];
//    for (int i=string.length-1; i>=0; i--) {
//        [afterStr appendString:[string substringWithRange:NSMakeRange(i, 1)]];
//    }
//    string=afterStr;
//    afterStr=[NSMutableString string];
//    for (int i=0; i<string.length; i++) {
//        [afterStr appendString:[string substringWithRange:NSMakeRange(i, 1)]];
//    }
//
//    NSLog(@"字符串 %@",afterStr);
//
//    NSLog(@"%@",[url  stringByAppendingPathExtension:@"zhutiwen"]);
//    NSString *tring=[url juSetEncodingNew];
//
//    NSLog(@"%@",tring);
//    NSLog(@"%@",[tring stringByRemovingPercentEncoding]);
//
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"test" ofType:@"html"];
//    ju_labTest.attributedText= [[NSAttributedString alloc] initWithData:[NSData dataWithContentsOfFile:path] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
//    ju_labTest.backgroundColor=[UIColor redColor];
//    [JuTestEncrypt juTest];

    ju_runLoop=[[JuRunLoop alloc]init];
    [ju_runLoop juStatrThread];
//
//
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self->ju_runLoop=nil;
    });
//
//    NSString *string=[NSString new];
//    JuChangMethod *chang=[[JuChangMethod alloc]init];
//    [chang method1:@"方法交换"];
//
//    [self juEqualString];
//    [self juEqualNum];

//    [self performSelector:<#(nonnull SEL)#> onThread:<#(nonnull NSThread *)#> withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#>]
//    [self shDraw];
    // Do any additional setup after loading the view, typically from a nib.
}
-(CGSize)juTest1:(NSString *)string test2:(NSString *)string2{
    NSLog(@"参数 :%@",string);
    return CGSizeMake(100, 100);
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
//    ju_imgAni.layer.timeOffset=1;
    [self shWriteText];
//    [ju_imgAni.layer removeAnimationForKey:@"rotation"];
}
-(void)shWriteText{
//    CABasicAnimation *writeText =[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    writeText.fromValue = @0;
//    writeText.toValue = @1;
//    CABasicAnimation *move =[CABasicAnimation animationWithKeyPath:@"position.y"];
//    move.byValue = @(-22);
//    move.toValue = @0;
//    CAAnimationGroup *group = [CAAnimationGroup animation];
//    group.duration = 1.0;
//    group.animations = @[writeText, move];
//    [ju_imgAni.layer addAnimation:group forKey:@"group"];

//    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    pathAnimation.duration = 1.5;
//    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
//    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
//    pathAnimation.autoreverses = NO;
//    [ju_imgAni.layer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
//    ju_imgAni.layer.strokeEnd = 2.0;
}
// 对指针p和q之间的所有字符逆序

-(void)testNoti1{
    NSLog(@"testNoti1");
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
     [ju_imgAni.layer beginTime];
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
    JuWebViewController *vc=[[JuWebViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];

//    
//    StackViewController *vc=[[StackViewController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
//    JuCollectionViewController *vc=[[JuCollectionViewController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
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
