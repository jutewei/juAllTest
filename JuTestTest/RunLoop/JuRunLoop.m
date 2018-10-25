//
//  JuRunLoop.m
//  JuTestTest
//
//  Created by Juvid on 2018/9/25.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuRunLoop.h"
#import "JuThread.h"

@interface JuRunLoop ()
@property (nonatomic,strong)JuThread *subThread;
@end

@implementation JuRunLoop{

}

-(void)juStatrThread{

//    self.subThread = [[JuThread alloc] initWithTarget:self selector:@selector(subThreadTodo) object:nil];
//    self.subThread.name = @"subThread";
//    [self.subThread start];

//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.subThread start];
//    });
    JuThread *tmpThread = [[JuThread alloc] initWithTarget:self selector:@selector(subThreadTodo) object:nil];
    //subThread用weak声明，用weak声明，用weak声明
    self.subThread = tmpThread;
    self.subThread.name = @"subThread";
    [self.subThread start];
    [self performSelector:@selector(juTest) onThread:self.subThread withObject:nil waitUntilDone:NO];
}
-(void)juTest{
//  NSLog(@"%@----执行子线程任务",[NSThread currentThread]);
}
/*
 子线程执行的内容
 */
- (void)subThreadTodo
{
    NSLog(@"%@----开始执行子线程任务",[NSThread currentThread]);

    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];

    [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    NSLog(@"%@----执行子线程任务结束",[NSThread currentThread]);
}
//我们希望放在子线程中执行的任务
- (void)wantTodo{
    //断点2
    NSLog(@"当前线程:%@执行任务处理数据", [NSThread currentThread]);

}
-(void)juStopThread{

}
-(void)dealloc{
    NSLog(@"释放了");
}
@end
