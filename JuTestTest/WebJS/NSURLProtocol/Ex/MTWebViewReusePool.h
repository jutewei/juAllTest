//
//  MTWebViewReusePool.h
//  libwebp
//
//  Created by Juvid on 2019/12/30.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface MTWebViewReusePool : NSObject
+ (instancetype) sharedInstance;
@property (nonatomic,strong)WKWebView *mt_WebView;
- (void)recycleReusedWebView:(WKWebView *)webView;
- (WKWebView *)getReusedWebViewForHolder:(id)holder;
@end

NS_ASSUME_NONNULL_END
