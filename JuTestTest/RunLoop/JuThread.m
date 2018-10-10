//
//  JuThread.m
//  JuTestTest
//
//  Created by Juvid on 2018/9/25.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuThread.h"

@implementation JuThread
-(void)dealloc{
    NSLog(@"%@线程被释放了", self.name);
}
@end
