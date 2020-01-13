//
//  JuCookieManage.m
//  JuTestTest
//
//  Created by Juvid on 2020/1/10.
//  Copyright © 2020 Juvid. All rights reserved.
//

#import "JuCookieManage.h"

@implementation JuCookieManage
#pragma mark - WKWebview

+ (instancetype)shareInstance {
    static JuCookieManage *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[JuCookieManage alloc] init];
    });
    return manager;
}


/// <#Description#>
/// @param wkWebview <#wkWebview description#>
/// @param comple <#comple description#>
- (void)setWkCookie:(WKWebView *)wkWebview completionHandler:(nullable void (^)(void))comple {

    if (!wkWebview.URL.host)  return;

    NSURL *cookieHost =wkWebview.URL;
    NSString *path=[cookieHost.path stringByDeletingLastPathComponent];
    // 设定 cookie
    NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:
                            [NSDictionary dictionaryWithObjectsAndKeys:
                             [cookieHost host], NSHTTPCookieDomain,
                             path, NSHTTPCookiePath,
                             self.cookieKey,  NSHTTPCookieName,
                             self.cookieValue, NSHTTPCookieValue,
                             [NSDate dateWithTimeIntervalSinceNow:30*60*60],NSHTTPCookieExpires,
                             nil]];

    // 加入cookie
    //发送请求前插入cookie；
    if (@available(iOS 11.0, *)) {
        WKHTTPCookieStore *cookieStore = wkWebview.configuration.websiteDataStore.httpCookieStore;
        [cookieStore setCookie:cookie completionHandler:^{
            comple?comple():nil;
        }];
    }
//        else {
           // 加入cookie
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
//    }
}

//在初始化 WKWebView 的时候，通过 WKUserScript 设置，使用Javascript 注入 Cookie。
+(void)setCookieWithUserCC:(WKUserContentController *)userContentController{
    WKUserScript * cookieScript = [[WKUserScript alloc] initWithSource: @"document.cookie ='CookieKey=CookieValue';"injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
    [userContentController addUserScript:cookieScript];
}

+(void)setCookieWithRequest:(NSMutableURLRequest *)request{
    [request setValue:[NSString stringWithFormat:@"%@=%@",@"CookieKey", @"CookieValue"] forHTTPHeaderField:@"Cookie"];
}
/**iOS11之后**/
-(void)juGetCookie:(WKWebView *)webView{
    //WKHTTPCookieStore的使用
    if (@available(iOS 11.0, *)) {
        WKHTTPCookieStore *cookieStore = webView.configuration.websiteDataStore.httpCookieStore;
        //get cookies
        [cookieStore getAllCookies:^(NSArray<NSHTTPCookie *> * _Nonnull cookies) {
            NSLog(@"All WKHTTPCookies %@",cookies);
        }];
    }
//        else {
        NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        NSArray *cookies=[cookieJar cookies];
        NSLog(@"All NSHTTPCookies %@",cookies);
        // Fallback on earlier versions
//    }
}

+(void)juDeleteCookieWithDomain:(NSString *)domain{
    [self juDeleteCookieWithDomain:domain withName:nil];
}

+(void)juDeleteCookieWithName:(NSString *)name {
    [self juDeleteCookieWithDomain:nil withName:name];
}

+(void)juDeleteCookieWithDomain:(NSString *)domain withName:(NSString *)name{
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in [cookieJar cookies]) {
        if (domain&&[cookie.domain isEqual:domain]) {
            [cookieJar deleteCookie:cookie];
        }
        if (name&&[cookie.name isEqual:name]) {
            [cookieJar deleteCookie:cookie];
        }
    }
    if (@available(iOS 9.0, *)) {//iOS9及以上
        [[WKWebsiteDataStore defaultDataStore] fetchDataRecordsOfTypes:[WKWebsiteDataStore allWebsiteDataTypes]
                         completionHandler:^(NSArray<WKWebsiteDataRecord *> * __nonnull records) {
            for (WKWebsiteDataRecord *record in records){
                if ( [record.displayName containsString:domain]){ //取消备注，可以针对某域名做专门的清除，否则是全部清除
                    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:record.dataTypes
                                                              forDataRecords:@[record]
                                                           completionHandler:^{
                                                               NSLog(@"Cookies for %@ deleted successfully",record.displayName);
                                                           }];
                }
            }
        }];
//        按时间删除
//        NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
//            [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:[NSDate date] completionHandler:^{
//                NSLog(@"clear webView cache");
//            }];
    }else { //iOS9以下
        NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *cookiesFolderPath = [libraryPath stringByAppendingString:@"/Cookies"];
        NSError *errors;
        [[NSFileManager defaultManager] removeItemAtPath:cookiesFolderPath error:&errors];
    }
}

@end
