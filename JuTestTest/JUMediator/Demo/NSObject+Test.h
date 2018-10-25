//
//  NSObject+Test.h
//  JuTestTest
//
//  Created by Juvid on 2018/10/18.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JuTestObject.h"
#import "JuNumber.h"

@interface NSObject (Test)
@property(nonatomic,strong)  JuNumber* ju_number;
@property(nonatomic,assign)  NSInteger ju_integer;
@property(nonatomic,strong)  JuTestObject *testObject;
@end
