//
//  JuChangMethod.m
//  JuTestTest
//
//  Created by Juvid on 2018/9/21.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuChangMethod.h"
#import <objc/runtime.h>
@implementation JuChangMethod
+(void)initialize{
    Method method1 = class_getInstanceMethod(self, @selector(method1:));
    Method method2 = class_getInstanceMethod(self, @selector(method2:));
    method_exchangeImplementations(method1, method2);
}
-(void)method1:(id)content{
//    [self method1:content];
     NSLog(@"1 %@",content);
}
-(void)method2:(id)content{
    NSLog(@"2 %@",content);
    [self method2:content];
}
@end
