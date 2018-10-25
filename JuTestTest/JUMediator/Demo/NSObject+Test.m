//
//  NSObject+Test.m
//  JuTestTest
//
//  Created by Juvid on 2018/10/18.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "NSObject+Test.h"
#import <objc/runtime.h>

@implementation NSObject (Test)
static const char* TestObject="nsobject.TestObject";
-(void)setJu_number:(JuNumber *)ju_number{
    objc_setAssociatedObject(self, @selector(ju_number), ju_number, OBJC_ASSOCIATION_ASSIGN);
}
-(JuNumber *)ju_number{
    return objc_getAssociatedObject(self, @selector(ju_number));
}
-(void)setJu_integer:(NSInteger)ju_integer{
    objc_setAssociatedObject(self, @selector(ju_number), @(ju_integer), OBJC_ASSOCIATION_ASSIGN);
}
-(NSInteger)ju_integer{
 return [objc_getAssociatedObject(self, @selector(ju_integer)) integerValue];
}
-(void)setTestObject:(JuTestObject *)testObject{
    objc_setAssociatedObject(self, TestObject, testObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(JuTestObject *)testObject{
    return objc_getAssociatedObject(self, TestObject);
}
@end
