//
//  JUWebCache.m
//  JuTestTest
//
//  Created by Juvid on 2018/12/12.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JUWebCache.h"

@implementation JUWebCache
+ (BOOL)canInitWithRequest:(NSURLRequest *)request{

    NSString *urlString = request.URL.absoluteString;
    NSLog(@"加载的资源 %@",urlString);

    //此处防止重复拦截（与后面的三（3）呼应）
    if ([NSURLProtocol propertyForKey:@"JuProtocol" inRequest:request]) {
        return NO;
    }

    if ([urlString isEqualToString:@"https://cms.pifubao.com.cn/cms/resource/upload/2018/10/30/10-08-080666-773542366.jpg"]) {
        return YES;
    }
    return NO;
}
- (NSData*)imageDataWithUrl:(NSURL*)url{
    if ([url.absoluteString isEqualToString:@"https://cms.pifubao.com.cn/cms/resource/upload/2018/10/30/10-08-080666-773542366.jpg"]) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"img6" ofType:@"jpg"];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        return data;
    }
    return nil;
}
- (void)startLoading{

    NSData *imageData = [self imageDataWithUrl:self.request.URL];

    if (imageData) {
        //获取本地图片成功
        //构建请求头
        NSString *mimeType = @"image/jpeg";

        NSMutableDictionary *header = [NSMutableDictionary dictionary];

        NSString *contentType = [mimeType stringByAppendingString:@";chartset=UTF-8"];
        header[@"Content-type"] = contentType;
        header[@"Content-Length"] = [NSString stringWithFormat:@"%ld",imageData.length];

        NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] initWithURL:self.request.URL
                                                                  statusCode:200 HTTPVersion:@"1.1" headerFields:header];
        //回调
        [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageAllowed];
        [self.client URLProtocol:self didLoadData:imageData];
        [self.client URLProtocolDidFinishLoading:self];
    }else{
        //获取本地图片失败
        [NSURLProtocol setProperty:@(YES) forKey:@"JuProtocol" inRequest:(id)self.request];
        NSMutableURLRequest *newRequset = [self.request mutableCopy];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        NSURLSessionTask *task = [session dataTaskWithRequest:newRequset];
        [task resume];
    }
}
+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request {
    return request;
}

- (void)stopLoading{
}


#pragma mark- NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {

    [self.client URLProtocol:self didFailWithError:error];
}

#pragma mark - NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageNotAllowed];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.client URLProtocol:self didLoadData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [self.client URLProtocolDidFinishLoading:self];
}
@end
