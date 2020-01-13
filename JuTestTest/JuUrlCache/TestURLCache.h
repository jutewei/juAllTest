//
//  TestURLCache.h
//  JuTestTest
//
//  Created by Juvid on 2020/1/2.
//  Copyright © 2020 Juvid. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestURLCache : NSObject
/*NSURLSession会拷贝configuration。所以session一旦初始化结束就不会再更改configuration。除非初始化一个session。

重要：如果NSURLRequest中也做了一些指定。session也会遵循NSURLRequest的限定，但是如果configuration有更加严格的限定，仍以configuration为主。

一、NSURLSessionConfiguration的描述
NSURLSessionConfiguration为NSURLSession配置一些请求所需要的策略。如：超时、缓存策略、链接需求的。
NSURLSession会拷贝configuration。所以session一旦初始化结束就不会再更改configuration。除非初始化一个session。
重要：如果NSURLRequest中也做了一些指定。session也会遵循NSURLRequest的限定，但是如果configuration有更加严格的限定，仍以configuration为主。

1.defaultSessionConfiguration
默认配置使用的是持久化的硬盘缓存，存储证书到用户钥匙链。存储cookie到shareCookie。

2.ephemeralSessionConfiguration
返回一个不适用永久持存cookie、证书、缓存的配置，最佳优化数据传输。
标注：当程序作废session时，所有的ephemeral session 数据会立即清除。此外，如果你的程序处于暂停状态，内存数据可能不会立即清除，但是会在程序终止或者收到内存警告或者内存压力时立即清除。

3.backgroundSessionConfigurationWithIdentifier
生成一个可以上传下载HTTP和HTTPS的后台任务(程序在后台运行)。在后台时，将网络传输交给系统的单独的一个进程。
重要：identifier 是configuration的唯一标示，不能为空或nil.

如果程序是被系统正常终止的和重新启动，可以使用同一个identifier创建configuration和session，并且能恢复终止时的传输状态。
如果程序是被用户在手动退出的，session会取消所有的后台任务，届时不能再唤醒application，如果想要再次开始传输，必须用户手动开启application。
*/
@end

NS_ASSUME_NONNULL_END
