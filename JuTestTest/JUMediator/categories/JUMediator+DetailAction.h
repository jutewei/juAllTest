//
//  JUMediator+DetailAction.h
//  JuTestTest
//
//  Created by Juvid on 2018/10/12.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JUMediator.h"

@interface JUMediator (DetailAction)
- (UIViewController *)JUMediator_Detail:(void(^)(void))complete;
@end
