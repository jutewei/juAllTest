//
//  JuDetailViewController.m
//  JuTestTest
//
//  Created by Juvid on 2018/10/12.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuDetailViewController.h"
#import "NSObject+Test.h"
typedef void (^JuComplete)(void);
@interface JuDetailViewController (){
    NSObject *object;
}

@end

@implementation JuDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];

    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%ld",(long)object.ju_integer);
    NSLog(@"%@",object.ju_number);
    NSLog(@"%@",object.testObject);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        JuComplete comple= self.diParam[@"complete"];

        comple();
    });
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
