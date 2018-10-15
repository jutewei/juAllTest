//
//  JuWebJSBridge.m
//  JuTestTest
//
//  Created by Juvid on 2018/10/15.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuWebJSBridge.h"
#import "WeakScriptMessageDelegate.h"
#import <WebKit/WKPreferences.h>
@interface JuWebJSBridge ()<WKScriptMessageHandler>{
    __weak WKWebView *_webView;
    NSMutableDictionary *ju_callBacks;
    JuCompletionHandler ju_completionHandler;
}

@end

@implementation JuWebJSBridge

+ (instancetype)bridgeForWebView:(WKWebView*)webView {
    JuWebJSBridge * bridge=[[JuWebJSBridge alloc]init];
    [bridge setupInstance:webView];
    return bridge;
}

- (void)setupInstance:(WKWebView*)webView {
    _webView = webView;
}

-(void)juSetFont:(CGFloat)scale{

    NSString *jsString=[NSString stringWithFormat:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '%d%%'",(int)(scale*100)];
    [_webView evaluateJavaScript:jsString completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        ;
    }];

//    [self juSetContentWidth];
}
-(void)juSetContentWidth{
    NSString *javascript = @"var meta = document.createElement('meta');meta.setAttribute('name', 'viewport');meta.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no');document.getElementsByTagName('head')[0].appendChild(meta);";
    [_webView evaluateJavaScript:javascript completionHandler:^(id _Nullable results, NSError * _Nullable error) {
        ;
    }];
}
-(void)juAddUserSeript:(NSString *)javaScriptSource{
    WKUserScript *script = [[WKUserScript alloc] initWithSource:javaScriptSource injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    [_webView.configuration.userContentController addUserScript:script];
}

-(void)juAddScriptMessageName:(NSString *)name callBackHandler:(JuCallBackHandler)handler{
    [_webView.configuration.userContentController addScriptMessageHandler:[[WeakScriptMessageDelegate alloc]initWithDelegate:self] name:name];
    self.ju_callBacks[name]=[handler copy];
}

-(void)juEvaluateJavaScript:(NSString *)name parameter:(NSArray *)parameter completionHandler:(JuCompletionHandler)handler{
    NSMutableString *paraString=[NSMutableString string];
    for (NSString *string in parameter) {
        [paraString appendFormat:@"'%@',",string];
    }
    [_webView evaluateJavaScript:[NSString stringWithFormat:@"%@(%@)",name,paraString] completionHandler:handler];
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    if (self.ju_callBacks[message.name]) {
        JuCallBackHandler handler=self.ju_callBacks[message.name];
        handler(message.name,message.body);
    }

}

-(NSMutableDictionary *)ju_callBacks{
    if (!ju_callBacks) {
        ju_callBacks=[NSMutableDictionary dictionary];
    }
    return ju_callBacks;
}
-(void)dealloc{
    for (NSString *name in self.ju_callBacks.allKeys) {
        [_webView.configuration.userContentController removeScriptMessageHandlerForName:name];
    }
}
@end
