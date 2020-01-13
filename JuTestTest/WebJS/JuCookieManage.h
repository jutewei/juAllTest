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

/// 设置cookie
/// @param wkWebview wkwebview
/// @param comple 回调
- (void)setWkCookie:(WKWebView *)wkWebview completionHandler:(nullable void (^)(void))comple;

/// 获取所有cookie
/// @param wkWebview wkwebview
- (void)juGetCookie:(WKWebView *)wkWebview;

/// 删除指定域名cookie
/// @param domain 域名
+(void)juDeleteCookieWithDomain:(NSString *)domain;

/// 删除指定名字域名
/// @param name cookie名字
+(void)juDeleteCookieWithName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
