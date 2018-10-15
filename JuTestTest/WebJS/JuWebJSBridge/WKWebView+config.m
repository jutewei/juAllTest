//
//  WKWebView+config.m
//  JuTestTest
//
//  Created by Juvid on 2018/10/15.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "WKWebView+config.h"

@implementation WKWebView (config)
+(instancetype)configWithFrame:(CGRect)frame{
   WKWebView *webView=[[WKWebView alloc]initWithFrame:frame configuration:[self juWebComfiguration]];
    webView.allowsBackForwardNavigationGestures=YES;
    webView.backgroundColor=[UIColor whiteColor];
    webView.opaque = NO;
    return webView;
}
+(id)juWebComfiguration{
    /*
     创建并配置WKWebView的相关参数
     1.WKWebViewConfiguration:是WKWebView初始化时的配置类，里面存放着初始化WK的一系列属性；
     2.WKUserContentController:为JS提供了一个发送消息的通道并且可以向页面注入JS的类，WKUserContentController对象可以添加多个scriptMessageHandler；
     3.addScriptMessageHandler:name:有两个参数，第一个参数是userContentController的代理对象，第二个参数是JS里发送postMessage的对象。添加一个脚本消息的处理器,同时需要在JS中添加，window.webkit.messageHandlers.<name>.postMessage(<messageBody>)才能起作用。
     */
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    WKUserContentController *userContentController = [[WKUserContentController alloc] init];
    configuration.userContentController = userContentController;

    WKPreferences *preferences = [WKPreferences new];
    preferences.javaScriptCanOpenWindowsAutomatically = YES;
    preferences.minimumFontSize = 40.0;
    configuration.preferences = preferences;
    return configuration;
}
@end
