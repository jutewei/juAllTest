//
//  FFactory.m
//  JuTestTest
//
//  Created by Juvid on 2018/10/19.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "FFactory.h"

@implementation FFactory
+ (FFOperation *)createOperation{
    FFOperation *operation = [[FFOperation alloc] init];
    return operation;
}
@end
