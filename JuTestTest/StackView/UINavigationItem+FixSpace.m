//
//  UIBarButtonItem+FixSpace.m
//  PFBPublic
//
//  Created by Juvid on 2018/11/27.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "UINavigationItem+FixSpace.h"
#import <objc/runtime.h>

@implementation UINavigationItem (FixSpace)

void juReplaceInstanceMethods(Class cls, SEL original, SEL replacement)
{
    Method originalMethod = class_getInstanceMethod(cls, original);
    const char *originalArgTypes = method_getTypeEncoding(originalMethod);

    Method replacementMethod = class_getInstanceMethod(cls, replacement);
    const char *replacementArgTypes = method_getTypeEncoding(replacementMethod);

    if (class_addMethod(cls, original, method_getImplementation(replacementMethod), replacementArgTypes)) {
        class_replaceMethod(cls, replacement, method_getImplementation(originalMethod), originalArgTypes);
    } else {
        method_exchangeImplementations(originalMethod, replacementMethod);
    }
}
+(void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        juReplaceInstanceMethods(self, @selector(setLeftBarButtonItem:), @selector(ju_setLeftBarButtonItem:));
        juReplaceInstanceMethods(self, @selector(setRightBarButtonItem:), @selector(ju_setRightBarButtonItem:));
    });
}

-(void)ju_setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem{
    if (leftBarButtonItem.customView) {
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11) {
            UIView *customView = leftBarButtonItem.customView;
            [self setLeftBarButtonItems:nil];
            [self ju_setLeftBarButtonItem:[[UIBarButtonItem alloc]initWithCustomView:customView]];
        }else {
            [self ju_setLeftBarButtonItem:nil];
            [self setLeftBarButtonItems:@[[self fixedSpaceWithWidth:-20], leftBarButtonItem]];
        }
    }else {
        [self setLeftBarButtonItems:nil];
        [self ju_setLeftBarButtonItem:leftBarButtonItem];
    }
}

-(void)ju_setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem{
    if (rightBarButtonItem.customView) {
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11) {
            UIView *customView = rightBarButtonItem.customView;
            [self setRightBarButtonItems:nil];
            [self ju_setRightBarButtonItem:[[UIBarButtonItem alloc]initWithCustomView:customView]];
        } else {
            [self ju_setRightBarButtonItem:nil];
            [self setRightBarButtonItems:@[[self fixedSpaceWithWidth:-20], rightBarButtonItem]];
        }
    }else {
        [self setRightBarButtonItems:nil];
        [self ju_setRightBarButtonItem:rightBarButtonItem];
    }
}

-(UIBarButtonItem *)fixedSpaceWithWidth:(CGFloat)width {
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                               target:nil
                                                                               action:nil];
    fixedSpace.width = width;
    return fixedSpace;
}

@end
