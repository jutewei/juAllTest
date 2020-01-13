//
//  JuWebViewController.m
//  JuTestTest
//
//  Created by Juvid on 2018/10/12.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuWebViewController.h"
#import "WeakScriptMessageDelegate.h"
#import "JuWebJSBridge.h"
#import "WKWebView+JuCookie.h"
#import "MTURLSchemeHandler.h"

@interface JuWebViewController ()<WKScriptMessageHandler>{
    JuWebJSBridge *bridge;
    CGFloat scale;
}

@end

@implementation JuWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self webConfiguration];
    [self LoadRequest];
    scale=1;
    [[NSNotificationCenter defaultCenter]   addObserver:self
                                               selector:@selector(testNoti2)
                                                   name:@"test"
                                                 object:nil];
    [[NSNotificationCenter defaultCenter]   postNotificationName:@"test" object:nil];
//    void (^Test)(int a)=^(int a){
//
//    };
//    void(^JuCallBackHandler)(id name, NSDictionary *paramter);
//    
//    JuCallBackHandler=^(id name, NSDictionary *paramter){
//
//    };
//    JuCallBackHandler(@"",nil);
//    Test(1);

    // Do any additional setup after loading the view.
}
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    [_sh_WebView.configuration.userContentController addScriptMessageHandler:self name:@"Share"];
//}
//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//     [_sh_WebView.configuration.userContentController removeScriptMessageHandlerForName:@"Share"];
//}
-(void)testNoti2{
    NSLog(@"testNoti2");
}
-(void)webConfiguration{

    _sh_WebView=[WKWebView configWithFrame:self.view.bounds];

    _sh_WebView.navigationDelegate = self;
    _sh_WebView.UIDelegate=self;
    [self.view addSubview:_sh_WebView];

    bridge =[JuWebJSBridge bridgeForWebView:_sh_WebView];
//    NSString *javaScriptSource = @"alert(\"WKUserScript注入js\");";
//    [bridge juAddUserSeript:javaScriptSource];
    __weak typeof(self)  weakSelf = self;
    [bridge juAddScriptMessageName:@"callNative" callBackHandler:^(id name, NSDictionary *paramter) {
        [weakSelf juCallBack];
    }];

    UIButton *btn =[[UIButton alloc]init];
    [self.view addSubview:btn];
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(juTouchFont) forControlEvents:UIControlEventTouchUpInside];
    btn.frame=CGRectMake(100, 400, 40, 40);
    [self.sh_WebView evaluateJavaScript:@"navigator.userAgent" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
        NSLog(@"%@",result);
    }];

//    [_sh_WebView setUserContentController:@"222222222222"];
//    [_sh_WebView setJavaScriptCookie:@"111111111111"];

}
-(void)juCallBack{
    [bridge juEvaluateJavaScript:@"test" parameter:@[@"提示",@"加载完毕"] completionHandler:^(id name, NSError *error) {
        ;
    }];
}
-(void)juTouchFont{
    scale++;
    [bridge juSetFont:scale];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{

    NSString *allHtml = @"[msg_title,msg_desc,msg_cdn_url]";
    [webView evaluateJavaScript:allHtml completionHandler:^(id result, NSError * _Nullable error) {
        NSLog(@"网页内容 %@",result);
    }];

    NSMutableDictionary *dicShare = [NSMutableDictionary dictionary];
    NSArray *arr=@[@"msg_title",@"msg_desc",@"msg_cdn_url",@"msg_mid"];
    __block  NSInteger current=0;
    for (NSString *string in arr) {
        [webView evaluateJavaScript:string completionHandler:^(NSString *result, NSError * _Nullable error) {
            if (!error) {
                [dicShare setValue:result forKey:string];
            }
             current++;
            if (current==arr.count) {
                NSLog(@"finish");
            }
        }];

    }

    [bridge juEvaluateJavaScript:@"isCanShare" completionHandler:^(id name, NSError *error) {
        ;
    }];
    NSLog(@"next");
}
/**
 *  JS 调用 OC 时 webview 会调用此方法
 *
 *  @param userContentController  webview中配置的userContentController 信息
 *  @param message                JS执行传递的消息
 */
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    NSLog(@"JS 调用了 %@ 方法，传回参数 %@",message.name,message.body);
//    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    NSLog(@"%s",__FUNCTION__);
    // 确定按钮
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();

    }];
    // alert弹出框
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:message message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:alertAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

-(void)dealloc{
    ;
}
-(void)LoadRequest{
//    http://localhost/test/openApp.php
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://localhost/test/tokenTest.html"]];
    [request setTimeoutInterval:30];
//    [_sh_WebView setRequest:request withCookies:@"33333333333333"];
    [self.sh_WebView loadRequest:request];
    [_sh_WebView setCookieValue:@"44444444"  expires:@"3600"];
//    [_sh_WebView setJsCookie];
    [_sh_WebView juGetCookie];
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"WKWebViewMessageHandler" ofType:@"html"];
//    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//    NSURL *url = [[NSURL alloc] initWithString:filePath];
//    [self.sh_WebView loadHTMLString:htmlString baseURL:url];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
