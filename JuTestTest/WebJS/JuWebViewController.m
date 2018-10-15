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
@interface JuWebViewController ()<WKScriptMessageHandler>{
    JuWebJSBridge *bridge;
}

@end

@implementation JuWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self webConfiguration];
    [self LoadRequest];
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
-(void)webConfiguration{

    _sh_WebView=[WKWebView configWithFrame:self.view.bounds];

    _sh_WebView.navigationDelegate = self;
    _sh_WebView.UIDelegate=self;
    [self.view addSubview:_sh_WebView];

    bridge =[JuWebJSBridge bridgeForWebView:_sh_WebView];
//    NSString *javaScriptSource = @"alert(\"WKUserScript注入js\");";
//    [bridge juAddUserSeript:javaScriptSource];
    __weak typeof(self)  weakSelf = self;
    [bridge juAddScriptMessageName:@"Share" callBackHandler:^(id name, NSDictionary *paramter) {
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];

    UIButton *btn =[[UIButton alloc]init];
    [self.view addSubview:btn];
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(juTouchFont) forControlEvents:UIControlEventTouchUpInside];
    btn.frame=CGRectMake(100, 400, 40, 40);

}
-(void)juTouchFont{
      [bridge juSetFont:4.8];
}
-(void)webLoadJs{
    NSString *javaScriptSource = @"alert(\"WKUserScript注入js\");";
    // 根据JS字符串初始化WKUserScript对象
    WKUserScript *script = [[WKUserScript alloc] initWithSource:javaScriptSource injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    // 根据生成的WKUserScript对象，初始化WKWebViewConfiguration
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    [config.userContentController addUserScript:script];

}
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{

    [bridge juEvaluateJavaScript:@"test" parameter:@[@"提示",@"加载完毕"] completionHandler:^(id name, NSError *error) {
        ;
    }];
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
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.8.6/test/openApp.php?_ijt=rqruearu905o3nj8bjq5nf4l0g"]];
    [request setTimeoutInterval:30];
    [self.sh_WebView loadRequest:request];

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
