//
//  TestURLCache.m
//  JuTestTest
//
//  Created by Juvid on 2020/1/2.
//  Copyright © 2020 Juvid. All rights reserved.
//

#import "TestURLCache.h"

/**
 只对 GET 请求生效
 defaultSessionConfiguration，默认值的是sharedURLCache。
 backgroundSessionConfiguration，默认值是nil
 ephemeralSessionConfiguration，默认一个私有的cache于内存，session失效，cache自动清除。

 缓存策略
    NSURLRequestUseProtocolCachePolicy = 0, //默认的缓存策略（取决于协议）
    NSURLRequestReloadIgnoringLocalCacheData = 1, // 忽略缓存，重新请求
    NSURLRequestReloadIgnoringLocalAndRemoteCacheData = 4, // Unimplemented
    NSURLRequestReloadIgnoringCacheData = NSURLRequestReloadIgnoringLocalCacheData,
    NSURLRequestReturnCacheDataElseLoad = 2, // 有缓存就用缓存，没有缓存就重新请求
    NSURLRequestReturnCacheDataDontLoad = 3, // 有缓存就用缓存，没有缓存就不发请求，当做请求出错处理（用于离线模式）
    NSURLRequestReloadRevalidatingCacheData = 5, // Unimplemented
*/

@implementation TestURLCache
-(void)test{

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSString *cachesDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *cachePath = [cachesDirectory stringByAppendingPathComponent:@"MyCache"];
    NSLog(@"cachePath:%@",cachePath);

    NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:16384 diskCapacity:268435456 diskPath:cachePath];
    configuration.URLCache = cache;
    configuration.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
    NSURL *url = [NSURL URLWithString:@"http://==xxx===xx=="];
    NSMutableURLRequest *requset = [NSMutableURLRequest requestWithURL:url];
    requset.HTTPMethod = @"GET";
    //设置缓存策略
    requset.cachePolicy = NSURLRequestReturnCacheDataElseLoad;

    //获得缓存
    NSCachedURLResponse *cachedURLResponse = [cache cachedResponseForRequest:requset];
    NSData *cacheData = cachedURLResponse.data;
    if(cacheData){//如果有缓存
        NSDictionary *dicJson=[NSJSONSerialization JSONObjectWithData:cacheData options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dicJson: %@",dicJson);
    }

    NSOperationQueue *operationQueue = [NSOperationQueue mainQueue];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:operationQueue];

    [[defaultSession dataTaskWithRequest:requset completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dicJson=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dicJson: %@",dicJson);
    }] resume];

}
@end
