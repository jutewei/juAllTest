//
//  JuNextViewController.m
//  JuTestTest
//
//  Created by Juvid on 2018/9/25.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuNextViewController.h"
#import "JuNextViewCell.h"
#import "JuThread.h"
#import "ObjcMsgResolve.h"
static  NSString *cellReuseIdentifier =@"JuNextViewCell";

@interface JuNextViewController ()
@property (nonatomic,strong)JuThread *subThread;
@end

@implementation JuNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ObjcMsgResolve *object=[[ObjcMsgResolve alloc]init];
    [object addObject:@"123456"];

    [object juFirstMethod];

//    JuThread *tmpThread = [[JuThread alloc] initWithTarget:self selector:@selector(subThreadTodo) object:nil];
//    //subThread用weak声明，用weak声明，用weak声明
//    self.subThread = tmpThread;
//    self.subThread.name = @"subThread";
//    [self.subThread start];
    [self.sh_tableView registerNib:[UINib nibWithNibName:cellReuseIdentifier bundle:nil] forCellReuseIdentifier:cellReuseIdentifier];
    self.sh_tableView.rowHeight=100;
    // Do any additional setup after loading the view.
}
- (void)subThreadTodo
{
    NSLog(@"%@----开始执行子线程任务",[NSThread currentThread]);

    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"RunLoop进入");
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"RunLoop要处理Timers了");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"RunLoop要处理Sources了");
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"RunLoop要休息了");
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"RunLoop醒来了");
                break;
            case kCFRunLoopExit:
                NSLog(@"RunLoop退出了");
                break;

            default:
                break;
        }
    });
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
    CFRunLoopAddObserver([runLoop getCFRunLoop], observer, kCFRunLoopDefaultMode);

    [runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    NSLog(@"%@----执行子线程任务结束",[NSThread currentThread]);
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event{
    NSRunLoop *mainRunLoop = [NSRunLoop mainRunLoop];

    //2.获得当前线程对应的runLoop
    NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];

    NSLog(@"%p---%p",mainRunLoop,currentRunLoop);
//    [self performSelector:@selector(wantTodo) onThread:self.subThread withObject:nil waitUntilDone:NO];

}

- (void)wantTodo{
    //断点1
    //1.这个方法是作用于当前线程，现在在子线程中调用这个函数，所以会作用于子线程的RunLoop
    //self这个位置只要是继承自NSObject的对象都能填，但是他要有后面SEL的方法，否则会崩溃。（直白的说这个方法就是在当前线程中延迟调用某个对象的某个方法。）
    [self performSelector:@selector(afterDelayTodo) withObject:nil afterDelay:0];

}

- (void)afterDelayTodo{
    //断点2
    NSLog(@"当前线程:%@执行任务处理数据", [NSThread currentThread]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    NSLog(@"控制器结束了");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    JuNextViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
    [cell shSetView];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1000;

}



@end
