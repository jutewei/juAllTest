//
//  WKWebView+JuCookie.h
//  PFBPublic
//
//  Created by Juvid on 2019/6/19.
//  Copyright © 2019 Juvid. All rights reserved.
//


/**WKWebView携带cookie方法
 *1、js携带
 *2.请求头携带
 **/
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKWebView (JuCookie)

//-(void)setUserContentController:(NSString *)token;

//- (void)setJavaScriptCookie:(NSString *)token;

//- (void)setRequest:(NSMutableURLRequest *)request withCookies:(NSString *)token;

-(void)juGetCookie;

//-(void)setJsCookie;

//+ (NSString *)juGetCookieString;

- (void)setCookieValue:(NSString *)value  expires:(NSString *)expires;

+ (void)deleteCookie;

@end

NS_ASSUME_NONNULL_END
