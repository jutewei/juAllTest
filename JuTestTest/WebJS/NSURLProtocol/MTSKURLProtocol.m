//
//  JUWebCache.m
//  JuTestTest
//
//  Created by Juvid on 2018/12/12.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "MTSKURLProtocol.h"
#import "MTSKWebDataManage.h"

static NSString* const JMTProtocol = @"JMTProtocol";
@interface MTSKURLProtocol()
@property (nonnull,strong) NSURLSessionDataTask *task;
@property (nonnull,strong) NSMutableDictionary *mutableTask;
@end

@implementation MTSKURLProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)request{
    NSLog(@"加载的资源 %@",request.URL.absoluteString);
    //此处防止重复拦截（与后面的三（3）呼应）
    if ([NSURLProtocol propertyForKey:JMTProtocol inRequest:request]) {
        return NO;
    }
    if ([request.URL.scheme hasPrefix:@"http"]) {
        if ([MTSKWebDataManage containsResource:request.URL acept:request.allHTTPHeaderFields[@"Accept"]]){
            return YES;
        }
    }
    return NO;
}

- (void)startLoading{
    NSMutableURLRequest *mutableReqeust = [[self request] mutableCopy];
    [NSURLProtocol setProperty:@(YES) forKey:JMTProtocol inRequest:mutableReqeust];
    NSData *data=[MTSKWebDataManage getWebKitCache:mutableReqeust.URL.absoluteString];
    if (data) {
        //标示该request已经处理过了，防止无限循环
        NSURLResponse *response = [[NSURLResponse alloc] initWithURL:self.request.URL
                                                                MIMEType:[MTSKWebDataManage MIMETypes:self.request.URL]
                                                   expectedContentLength:data.length
                                                        textEncodingName:nil];
        //硬编码 开始嵌入本地资源到web中
        [[self client] URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageNotAllowed];
        [[self client] URLProtocol:self didLoadData:data];
        [[self client] URLProtocolDidFinishLoading:self];
    }else{
        //获取本地图片失败
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];
        self.task = [session dataTaskWithRequest:self.request];
        [self.task resume];
        [self.mutableTask setValue:[MTSKWebDataManage mtInitRequest:self.request] forKey:self.request.URL.absoluteString];
    }
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    NSMutableURLRequest *mutableReqeust = [request mutableCopy];
    return mutableReqeust;
}

- (void)stopLoading{
    if (self.task != nil){
        [self.task  cancel];
    }
}

-(NSMutableDictionary *)mutableTask{
    if (!_mutableTask) {
        _mutableTask=[NSMutableDictionary dictionary];
    }
    return _mutableTask;
}

#pragma mark- NSURLSessionDelegate
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageAllowed];
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    [self.client URLProtocol:self didLoadData:data];
    [[self sessionData:dataTask] appendData:data];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
    [self.client URLProtocolDidFinishLoading:self];
    [[self sessionData:task] completeData];
    [self.mutableTask removeObjectForKey:task.currentRequest.URL.absoluteString];
}

-(MTSKWebDataManage *)sessionData:(NSURLSessionTask *)task{
    return self.mutableTask[task.currentRequest.URL.absoluteString];
}

@end
