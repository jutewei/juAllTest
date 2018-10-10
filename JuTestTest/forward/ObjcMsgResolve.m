//
//  ObjcMsgResolve.m
//  JuRunTime
//
//  Created by Juvid on 2018/10/9.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "ObjcMsgResolve.h"
#import "JuResloveOjc.h"
#import <objc/runtime.h>

@implementation ObjcMsgResolve

//第一步
void juDynamicAddMethod(id self, SEL _cmd, id string) {

    NSLog(@"juDynamic");
}

+ (BOOL)resolveInstanceMethod:(SEL)name {
    NSLog(@"juDynamic: %@", NSStringFromSelector(name));
    if (name == @selector(appendString:)) {
        class_addMethod([self class], name, (IMP)juDynamicAddMethod, "v@:");
        NSLog(@"第一步转发成功");
        return YES;
    }
    NSLog(@"第一步转发失败");
    return [super resolveInstanceMethod:name];
}

//第二步
- (id)forwardingTargetForSelector:(SEL)aSelector{
    if (aSelector == @selector(appendString:)) {
        NSLog(@"第二步转发成功");
        return [NSMutableString string];
    }
    NSLog(@"第二步转发失败");
    return [super forwardingTargetForSelector:aSelector];
}

////第三步 签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSString *method = NSStringFromSelector(aSelector);
    if ([@"addObject:" isEqualToString:method]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    NSLog(@"第三步转发失败");
    return [super methodSignatureForSelector:aSelector];
}

///**转发到自己的其他方法*/
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    SEL sel = @selector(travel:);
    NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    anInvocation = [NSInvocation invocationWithMethodSignature:signature];
    [anInvocation setTarget:self];
    [anInvocation setSelector:@selector(travel:)];
    NSString *city = @"北京";
    // 消息的第一个参数是self，第二个参数是选择子(selector)，所以"北京"是第三个参数
    [anInvocation setArgument:&city atIndex:2];

    if ([self respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:self];
        return;
    } else {
        NSLog(@"第三步转发失败");
        [self doesNotRecognizeSelector:sel];
    }

    // 从继承树中查找
    [super forwardInvocation:anInvocation];
}
/**转发到其他对象的方法*/
//- (void)forwardInvocation:(NSInvocation *)anInvocation
//{
//    [anInvocation invokeWithTarget:[JuResloveOjc new]];
//    return;
//}

-(void)travel:(NSString *)string{
    NSLog(@"第三步转发成功");
}

-(void)juFirstMethod{
    NSLog(@"调用了方法");
}
//-(void)addObject{
//    
//}
@end
