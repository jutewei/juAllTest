//
//  FFactoryYoutiao.m
//  JuTestTest
//
//  Created by Juvid on 2018/10/19.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "FFactoryYoutiao.h"
#import "FFOperationYoutiao.h"
@implementation FFactoryYoutiao

+ (FFOperation *)createOperation{
    return [[FFOperationYoutiao alloc] init];
}
@end
