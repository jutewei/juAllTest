//
//  AFFactoryMantou.m
//  JuTestTest
//
//  Created by Juvid on 2018/10/19.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "AFFactoryMantou.h"
#import "AFOperationMantou.h"
@implementation AFFactoryMantou
- (AFOperation *)createProduct{
    return [[AFOperationMantou alloc] init];
}
@end
