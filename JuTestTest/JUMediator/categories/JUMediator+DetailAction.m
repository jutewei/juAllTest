//
//  JUMediator+DetailAction.m
//  JuTestTest
//
//  Created by Juvid on 2018/10/12.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JUMediator+DetailAction.h"
NSString * const kCTMediatorTargetA = @"Detail";
@implementation JUMediator (DetailAction)
- (UIViewController *)JUMediator_Detail:(void(^)(void))complete
{

    UIViewController *viewController = [self performActtionWithTarget:kCTMediatorTargetA action:@"nativeDetailVC" parameter:@{@"name":@"Juvid",@"complete":complete} cacheTarget:NO];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return viewController;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}
@end
