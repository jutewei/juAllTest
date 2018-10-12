//
//  JuTarget_Detail.m
//  JuTestTest
//
//  Created by Juvid on 2018/10/12.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuTarget_Detail.h"
#import "JuDetailViewController.h"
#import "JuWebViewController.h"

@implementation JuTarget_Detail
- (UIViewController *)JuAction_nativeDetailVC:(NSDictionary *)params{
    JuDetailViewController *vc=[[JuDetailViewController alloc]init];
    vc.diParam=params;
    return vc;
}
- (UIViewController *)JuAction_nativeWebVC:(NSDictionary *)params{
    JuWebViewController *vc=[[JuWebViewController alloc]init];
    return vc;
}
@end
