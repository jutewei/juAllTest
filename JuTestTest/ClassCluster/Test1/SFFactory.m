//
//  SFFactory.m
//  JuTestTest
//
//  Created by Juvid on 2018/10/19.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "SFFactory.h"
#import "SFOperationMantou.h"
#import "SFOperationYoutiao.h"
@implementation SFFactory
+ (SFOperation *)operationBreakfast:(SFFactoryProductType)breakfastType
{
    //通过枚举返回不同的产品
    SFOperation *operation;
    switch (breakfastType) {
        case SFFactoryProductTypeMantou:
            operation = [[SFOperationMantou alloc] init];
            break;
        case SFFactoryProductTypeYoutiao:
            operation = [[SFOperationYoutiao alloc] init];
            break;
        default:
            return nil;
            break;
    }
    return operation;
}

@end
