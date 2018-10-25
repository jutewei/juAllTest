//
//  AFFactory.m
//  JuTestTest
//
//  Created by Juvid on 2018/10/19.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "AFFactory.h"
#import "AFFactoryMantou.h"
#import "AFFactoryYoutiao.h"

@implementation AFFactory
+ (instancetype)factoryWithType:(AFFactoryProductType)type
{
    AFFactory *factory;
    switch (type) {
        case AFFactoryProductTypeMantou:
            factory = [[AFFactoryMantou alloc] init];
            break;
        case AFFactoryProductTypeYoutiao:
            factory = [[AFFactoryYoutiao alloc] init];
            break;
        default:
            break;
    }
    return factory;
}
- (AFOperation *)createProduct
{
    return nil;
}

@end
