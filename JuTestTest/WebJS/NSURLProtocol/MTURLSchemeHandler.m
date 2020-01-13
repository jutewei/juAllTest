//
//  MTURLSchemeHandler.m
//  libwebp
//
//  Created by Juvid on 2019/12/27.
//

#import "MTURLSchemeHandler.h"
#import "MTSKWebDataManage.h"

@interface MTURLSchemeHandler ()
@property (nonatomic,strong) NSMutableDictionary *mutableTask;
@property (nonatomic,strong)dispatch_queue_t schemeTaskQueue;
@end

@implementation MTURLSchemeHandler

-(instancetype)init{
    self=[super init];
    if (self) {
     _mutableTask=[NSMutableDictionary dictionary];
     _schemeTaskQueue= dispatch_queue_create("com.meitu.skin", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

//这里拦截到URLScheme为customScheme的请求后，读取本地图片test.jpg，并返回给WKWebView显示
- (void)webView:(WKWebView *)webView startURLSchemeTask:(id <WKURLSchemeTask>)urlSchemeTask API_AVAILABLE(ios(11.0)){
    dispatch_sync(_schemeTaskQueue, ^{
        [self.mutableTask setObject:@(YES) forKey:urlSchemeTask.description];
    });
    NSString *schemeUrl = urlSchemeTask.request.URL.absoluteString;
    if ([schemeUrl hasPrefix:MTURLSkinScheme]) {
        schemeUrl = [schemeUrl stringByReplacingOccurrencesOfString:MTURLSkinScheme withString:MTOriginalScheme];
    }
    NSURL *url=[NSURL URLWithString:schemeUrl];
    [self loadLocalFile:url urlSchemeTask:urlSchemeTask];
}

- (void)webView:(WKWebView *)webView stopURLSchemeTask:(id <WKURLSchemeTask>)urlSchemeTask API_AVAILABLE(ios(11.0)){
    dispatch_sync(_schemeTaskQueue, ^{
        [self.mutableTask setObject:@(NO) forKey:urlSchemeTask.description];
        NSLog(@"停止了：%@",urlSchemeTask);
    });
//    MTSKWebDataManage *manage=[self sessionData:urlSchemeTask.request.URL];
//    manage.isStopTask=YES;
}

- (void)resendRequestWithUrlSchemeTask:(id <WKURLSchemeTask>)urlSchemeTask
                           requestData:(NSData *)requestData  API_AVAILABLE(ios(11.0)) {
    if (!urlSchemeTask || !urlSchemeTask.request || !urlSchemeTask.request.URL) {
        return;
    }
    NSURL *url=urlSchemeTask.request.URL;
    NSURLResponse *response = [[NSURLResponse alloc] initWithURL:url
                                                        MIMEType:[MTSKWebDataManage MIMETypes:url]
                                           expectedContentLength:requestData.length
                                                textEncodingName:nil];
    [urlSchemeTask didReceiveResponse:response];
    [urlSchemeTask didReceiveData:requestData];
    [urlSchemeTask didFinish];

    [self.mutableTask removeObjectForKey:urlSchemeTask.description];

}
- (void)loadLocalFile:(NSURL *)url urlSchemeTask:(id <WKURLSchemeTask>)urlSchemeTask API_AVAILABLE(ios(11.0)){
    if (url.absoluteString.length == 0 || !urlSchemeTask) {
        return;
    }
    NSData *data=[MTSKWebDataManage getWebKitCache:url];
    if (data) {
        [self resendRequestWithUrlSchemeTask:urlSchemeTask  requestData:data];
        return;
    }

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //        访问有些网页会被循环调用，设置HTTPHeaderFields User-Agent  可避免
    request.allHTTPHeaderFields=urlSchemeTask.request.allHTTPHeaderFields;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([self.mutableTask[urlSchemeTask.description] boolValue]) {
                [urlSchemeTask didReceiveResponse:response];
                [urlSchemeTask didReceiveData:data];
                if (error) {
                    [urlSchemeTask didFailWithError:error];
                } else {
                    [urlSchemeTask didFinish];
                    NSString *acept=urlSchemeTask.request.allHTTPHeaderFields[@"Accept"]; // 过滤请求
                    [MTSKWebDataManage saveContainsResourceUrl:url acept:acept data:data];
                }
            }

            [self.mutableTask removeObjectForKey:urlSchemeTask.description];

        });
    }];
    [dataTask resume];
    [session finishTasksAndInvalidate];
    //代理方法
    //        NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];
    //        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request];
    //        [dataTask resume];
    //        [self.mutableTask setValue:[MTSKWebDataManage mtInitSchemeTask:urlSchemeTask withRequest:request] forKey:schemeUrl];
}
//-(BOOL)isJSOrCSSFile:(NSString *)str{
//    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\.(js|css)" options:NSRegularExpressionCaseInsensitive error:nil];
//    NSArray *result = [regex matchesInString:str options:NSMatchingReportProgress range:NSMakeRange(0, str.length)];
//    return result.count;
//}
//#pragma mark- NSURLSessionDelegate
//- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
//  [[self sessionData:dataTask.response.URL] appendData:data];
//}
//
//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
//    MTSKWebDataManage *manage=[self sessionData:task.response.URL];
//    if (!manage.isStopTask) {
//        [manage.urlSchemeTask didReceiveResponse:task.response];
//        [manage.urlSchemeTask didReceiveData:manage.mutableData];
//        if (error) {
//            [manage.urlSchemeTask didFailWithError:error];
//        }else{
//            if (manage.isResource){
//                [manage completeData];
//            }
//            [manage.urlSchemeTask didFinish];
//        }
//    }
//}
//-(MTSKWebDataManage *)sessionData:(NSURL *)url{
//    return self.mutableTask[url.absoluteString];
//}

+(NSString *)getCustomScheme:(NSString *)strUrl{
    if (@available(iOS 11.0, *)) {
        if ([strUrl hasPrefix:MTOriginalScheme]&&![WKWebView handlesURLScheme:MTURLSkinScheme]) {
            return [strUrl stringByReplacingOccurrencesOfString:MTOriginalScheme withString:MTURLSkinScheme];
        }
    }
    return strUrl;
}

+(WKWebViewConfiguration *)configuration{
    WKWebViewConfiguration *configuration = [WKWebViewConfiguration new];
    if (@available(iOS 11.0, *)) {
        if (![WKWebView handlesURLScheme:MTURLSkinScheme]) {
            [configuration setURLSchemeHandler:[MTURLSchemeHandler new] forURLScheme:MTURLSkinScheme];
        }
    }
    return configuration;
}
-(void)dealloc{
    ;
}
@end
