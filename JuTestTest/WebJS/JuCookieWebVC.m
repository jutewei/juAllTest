//
//  JuCookieWebVC.m
//  JuTestTest
//
//  Created by Juvid on 2020/1/10.
//  Copyright © 2020 Juvid. All rights reserved.
//

#import "JuCookieWebVC.h"
#import "MTURLSchemeHandler.h"
#import "UIView+JuLayGroup.h"
#import "JuCookieManage.h"
#import "MTSKWebDataManage.h"

@interface JuCookieWebVC ()
@property (strong, nonatomic) WKWebView *mt_WebView;
@end

@implementation JuCookieWebVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self juSetWebView];
     [self juSetCookie];
    // Do any additional setup after loading the view.
}
-(void)juSetWebView{
    _mt_WebView=[[WKWebView alloc]initWithFrame:CGRectZero configuration:[MTURLSchemeHandler configuration]];

    _mt_WebView.allowsBackForwardNavigationGestures=YES;
    _mt_WebView.backgroundColor=[UIColor whiteColor];
    self.mt_WebView.opaque = NO;
    _mt_WebView.navigationDelegate = self;
    _mt_WebView.UIDelegate=self;

    [self.view addSubview:_mt_WebView];
    _mt_WebView.juEdge(UIEdgeInsetsMake(0, 0, 0, 0));

//    NSString *accountPath=[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"MTAccountWebUI"];
//      accountPath=[accountPath stringByAppendingString:@"/index.html#/account"];
//
//      NSURL *url=[NSURL URLWithString:accountPath];

    NSURL *url=[NSURL URLWithString:@"http://192.168.8.2/test/tokenTest.html"];
//       NSURL *url=[NSURL URLWithString:@"http://192.168.8.2/test.html"];
    NSString *path=[MTSKWebDataManage resourceCachePath:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    //        if ([SHNetStatus sharedNet].sh_connectionRequired) {
//    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
//    //        }
    [request setTimeoutInterval:30];
    [self.mt_WebView loadRequest:request];
//    [self.mt_WebView loadHTMLString:<#(nonnull NSString *)#> baseURL:<#(nullable NSURL *)#>]
//    [self loadHtml];

}
-(void)loadHtml{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.mt_WebView.URL];
      //        访问有些网页会被循环调用，设置HTTPHeaderFields User-Agent  可避免

      NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
      NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          [MTSKWebDataManage saveWithData:data urlKey:response.URL];
      }];
      [dataTask resume];
      [session finishTasksAndInvalidate];
}
-(void)juSetCookie{
    [JuCookieManage shareInstance].cookieKey=@"zhu";
    [JuCookieManage shareInstance].cookieValue=@"jutewei1234567899";
    [[JuCookieManage shareInstance]setWkCookie:self.mt_WebView.URL completionHandler:nil];
    [[JuCookieManage shareInstance]juGetCookies:nil];
//    [JuCookieManage juDeleteCookiesWithDomain:self.mt_WebView.URL.host];
}
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    NSLog(@"弹框信息：%@",message);
    completionHandler();
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
