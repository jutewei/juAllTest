//
//  StackViewController.m
//  JuTestTest
//
//  Created by Juvid on 2018/11/27.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "StackViewController.h"
#import "JuNaviBarButton.h"
#import "UINavigationItem+FixSpace.h"
@interface StackViewController ()
@property (weak, nonatomic) IBOutlet UIStackView *ju_stackView;

@end

@implementation StackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    JuNaviBarButton *btn=[[JuNaviBarButton alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
    [btn setTitle:@"右边" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem=item;
//    UIButton *btn2=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
//    [btn2 setTitle:@"第二" forState:UIControlStateNormal];
//    [btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    UIBarButtonItem *item2=[[UIBarButtonItem alloc]initWithCustomView:btn2];
//    self.navigationItem.rightBarButtonItems=@[item,item2];


    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    for (UIView *subView in self.navigationController.navigationBar.subviews) {
//        for (UIView *view in subView.subviews) {
//            if ([view isKindOfClass:[UIStackView class]]) {
//                CGRect frame=view.frame;
//                frame.origin.x=360;
//                view.frame=frame;
//            }
//            NSLog(@"%@",view);
//        }
//    }
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
