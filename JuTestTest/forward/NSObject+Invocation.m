//
//  NSObject+Invocation.m
//  JuTestTest
//
//  Created by Juvid on 2019/1/18.
//  Copyright © 2019 Juvid. All rights reserved.
//

#import "NSObject+Invocation.h"
#import <UIKit/UIKit.h>
@implementation NSObject (Invocation)

-(id)juInvocationSelector:(SEL)aSelector withObjects:(NSArray *)objects{
    NSMethodSignature *signature = [self methodSignatureForSelector:aSelector];
    if (signature) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:aSelector];
        for (int i=0; i<objects.count; i++) {
            id argument = [objects objectAtIndex:i];
            [invocation setArgument:&argument atIndex:i+2];
        }
        [invocation invoke];
        if (signature.methodReturnLength)
        {
            const char *returnType = signature.methodReturnType;
            id anObject = nil;
            if(!strcmp(returnType, @encode(id)) ){
                [invocation getReturnValue:&anObject];
            }
            return anObject;
        }
    }
    return nil;
}

/*
NSMethodSignature *signature = aspect_blockMethodSignature(block1);
NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
[invocation setTarget:block1];
int a=2;
[invocation setArgument:&a atIndex:1];
[invocation invoke];
*/
/*
static NSMethodSignature *aspect_blockMethodSignature(id block, NSError **error) {
    AspectBlockRef layout = (__bridge void *)block;
    if (!(layout->flags & AspectBlockFlagsHasSignature)) {
        NSString *description = [NSString stringWithFormat:@"The block %@ doesn't contain a type signature.", block];
        AspectError(AspectErrorMissingBlockSignature, description);
        return nil;
    }
    void *desc = layout->descriptor;
    desc += 2 * sizeof(unsigned long int);
    if (layout->flags & AspectBlockFlagsHasCopyDisposeHelpers) {
        desc += 2 * sizeof(void *);
    }
    if (!desc) {
        NSString *description = [NSString stringWithFormat:@"The block %@ doesn't has a type signature.", block];
        AspectError(AspectErrorMissingBlockSignature, description);
        return nil;
    }
    const char *signature = (*(const char **)desc);
    return [NSMethodSignature signatureWithObjCTypes:signature];
}
*/

@end
