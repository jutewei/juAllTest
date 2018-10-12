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
@interface ViewController (){
    JuRunLoop *ju_runLoop;
}
@property (weak, nonatomic) IBOutlet UIView *ju_view;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.view.backgroundColor=[UIColor whiteColor];

    [JuArithmetic juBubbling];

    [JuTestEncrypt juTest];

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
-(void)juEqualString{
    NSString *aString  = @"iPhone 8";
    NSString *aString2 = @"iPhone 7";
    NSString *aString3 = @"iPhone 8";
    NSString *bString = [NSString stringWithFormat:@"iPhone %i", 8];
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
    [self presentViewController:vc animated:YES completion:nil];
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
