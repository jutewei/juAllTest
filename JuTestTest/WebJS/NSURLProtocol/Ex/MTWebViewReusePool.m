//
//  MTWebViewReusePool.m
//  libwebp
//
//  Created by Juvid on 2019/12/30.
//

#import "MTWebViewReusePool.h"
#import "MTURLSchemeHandler.h"

@interface MTWebViewReusePool (){

}
@property (nonatomic,strong)NSMutableSet<WKWebView *> *visiableWebViewSet;
@property (nonatomic,strong)NSMutableSet<WKWebView *> *reusableWebViewSet;
@property (nonatomic,strong)dispatch_semaphore_t lock;
@end

@implementation MTWebViewReusePool

+(void)load{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFinishLaunchingNotification) name:UIApplicationDidFinishLaunchingNotification object:nil];
}
+(void)didFinishLaunchingNotification{
    [[MTWebViewReusePool sharedInstance] setFirstWebview];
}
-(void)setFirstWebview{
    self.reusableWebViewSet=[NSMutableSet set];
    self.visiableWebViewSet=[NSMutableSet set];
    [self.reusableWebViewSet addObject:[self getWebView]];
}
+ (instancetype) sharedInstance{
    static MTWebViewReusePool *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.lock=dispatch_semaphore_create(1);

    });
    return sharedInstance;
}
-(WKWebView *)getWebView{
    WKWebViewConfiguration *configuration = [WKWebViewConfiguration new];
    WKWebView *webView= [[WKWebView alloc]initWithFrame:CGRectZero configuration:[MTURLSchemeHandler configuration]];
    return webView;
}
- (WKWebView *)getReusedWebViewForHolder:(id)holder {
    if (!holder) {
#if DEBUG
        NSLog(@"WKWebViewPool must have a holder");
#endif
        return nil;
    }

    WKWebView *webView;

    dispatch_semaphore_wait(_lock, DISPATCH_TIME_FOREVER);

    if (_reusableWebViewSet.count > 0) {
        webView = [_reusableWebViewSet anyObject];
        [_reusableWebViewSet removeObject:webView];
        [_visiableWebViewSet addObject:webView];

    } else {
        [_visiableWebViewSet removeAllObjects];
        webView=[self getWebView];
        [_visiableWebViewSet addObject:webView];
    }
//    webView.holderObject = holder;

    dispatch_semaphore_signal(_lock);

    return webView;
}

- (void)recycleReusedWebView:(WKWebView *)webView {
    if (!webView) {
        return;
    }

    dispatch_semaphore_wait(_lock, DISPATCH_TIME_FOREVER);
    if ([_visiableWebViewSet containsObject:webView]) {
        //将webView重置为初始状态
        [_visiableWebViewSet removeObject:webView];
        [self webViewEndReuse:webView];
        [_reusableWebViewSet addObject:[self getWebView]];
//        [_reusableWebViewSet addObject:webView];

    } else {
        if (![_reusableWebViewSet containsObject:webView]) {
#if DEBUG
            NSLog(@"Don't use the webView");
#endif
        }
    }
    dispatch_semaphore_signal(_lock);
}
- (void)webViewEndReuse:(WKWebView *)webView{
//    self.holderObject = nil;
    if ([webView isKindOfClass:[WKWebView class]]) {
        webView.UIDelegate = nil;
        webView.navigationDelegate=nil;
        webView.scrollView.delegate = nil;
        [webView stopLoading];
        [webView setUIDelegate:nil];

//        [_reusableWebViewSet removeObject:webView];
        webView=nil;
//        [webView evaluateJavaScript:@"document.body.innerHTML='';" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
//
//        }];
//        [webView loadHTMLString:@"" baseURL:nil];
    }
}

@end
