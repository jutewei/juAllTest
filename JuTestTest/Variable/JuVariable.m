//
//  JuVariable.m
//  JuTestTest
//
//  Created by Juvid on 2019/2/14.
//  Copyright © 2019 Juvid. All rights reserved.
//

#import "JuVariable.h"

@implementation JuVariable
-(void)juStart{
    //这两种写法是一样的，const只修饰右边的基本变量 b
//    const int b = 5; // b:只读变量
//    int const c = 5; // b:只读变量
    // 由于b是只读的，b无法被修改，入下代码会报错
//    b = 4;
//    c = 3 // 报错，b无法修改

//    int  a = 12;
//    int *p = &a;
//    int c = 7;
//    p = &c;
//    NSLog(@"p=%d",*p);
////    打印结果：p=8
//
//    // 由于 p 没有被修饰，它访问 内存空间的值 和 指向的地址 都可以被修改允许修改
//    *p = 11;
//    NSLog(@"p=%d",p);
//    打印结果：p=11
    NSString * const base_url =  @"http://www.baodu.com/";
    NSString  const * base_url1 =  @"http://www.baodu.com/";
    int x=9;
    // 1、2、4 的效果一样 都是修饰 const右边的 *q，3修饰的是变量 q ,切记 const修饰的是右边的
    int  *zz = 7;   // 1
    int const *q = &x;   // 1
    const int *a = 7;   // 2
    int * const b = 8;  // 3
    const int *c = &x;   // 4

    // 首先下面的 q 都被修饰，也就是q不能被赋值，然后 * const q 又被 const 修饰
    int const * const d = &x;  // 5
    const int * const e = &x;  // 6
    const int * const f = &x;  // 7
    const int * const g = &x;  // 8

}
@end
