//
//  JuCookieManage.h
//  JuTestTest
//
//  Created by Juvid on 2020/1/10.
//  Copyright © 2020 Juvid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN


@interface JuCookieManage : NSObject
//@property (nonatomic, strong) NSString *domain;
@property (nonatomic, strong) NSString *cookieKey;
@property (nonatomic, strong) NSString *cookieValue;

+ (instancetype)shareInstance;

#pragma mark - WKWebview

//在初始化 WKWebView 的时候，通过 WKUserScript 设置，使用Javascript 注入 Cookie。
+(void)setCookieWithUserCC:(WKUserContentController *)userContentController;

/// 请求t提加cookie
/// @param request 网络请求
+(void)setCookieWithRequest:(NSMutableURLRequest *)request;

/// 设置cookie
/// @param cookieHost 网页地址
/// @param comple 回调
- (void)setWkCookie:(NSURL *)cookieHost completionHandler:(nullable void (^)(void))comple;

/// 获取所有cookie
/// @param completionHandler 回调
-(void)juGetCookies:(void (^)(NSArray<NSHTTPCookie *> *))completionHandler;

/// 删除指定域名cookie
/// @param domain 域名
+(void)juDeleteCookiesWithDomain:(NSString *)domain;

/// 删除指定名字域名
/// @param name cookie名字
+(void)juDeleteCookiesWithName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
