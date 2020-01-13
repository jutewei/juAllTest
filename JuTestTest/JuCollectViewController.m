//
//  JuCollectViewController.m
//  JuTestTest
//
//  Created by Juvid on 2019/6/1.
//  Copyright © 2019 Juvid. All rights reserved.
//

#import "JuCollectViewController.h"
#import "JuWaterFallCollectView.h"
@interface JuCollectViewController ()

@end

@implementation JuCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    JuWaterFallCollectView *view=[[JuWaterFallCollectView alloc]initWithFrame:self.view.bounds collectionViewLayout:nil];
    [self.view addSubview:view];
    // Do any additional setup after loading the view.
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
