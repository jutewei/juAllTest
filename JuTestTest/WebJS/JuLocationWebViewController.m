//
//  JuLocationWebViewController.m
//  JuTestTest
//
//  Created by Juvid on 2018/12/6.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuLocationWebViewController.h"
#import "JuHTTPRequest.h"
#import <WebKit/WebKit.h>
#import <WebKit/WKPreferences.h>
#import "JUWebCache.h"
@interface JuLocationWebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *ju_webView;
@property (weak, nonatomic) IBOutlet WKWebView *sh_wkWebView;

@end

@implementation JuLocationWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSURLProtocol registerClass:[JUWebCache class]];
    [self readCache];
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"CFNetworkDownload_OslwI3" ofType:@"tmp"];
//    NSString *htmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//    NSURL *url = [[NSURL alloc] initWithString:filePath];
//    [self.ju_webView loadHTMLString:htmlString baseURL:url];
//    NSURL *filePath = [[NSBundle mainBundle] URLForResource:@"CFNetworkDownload_OslwI3.tmp" withExtension:nil];
////    NSString *path = [[NSBundle mainBundle]pathForResource:@"CFNetworkDownload_OslwI3" ofType:@"tmp"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:filePath];
////    [request setTimeoutInterval:30];
//    [self.ju_webView loadRequest:request];

//    [self.ju_webView loadHTMLString:[NSURL URLWithString:path] baseURL:[NSURL URLWithString:path]];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self.ju_webView loadRequest:request];
//    });
    self.sh_wkWebView.hidden=YES;
//    [[JuHTTPRequest sharedInstance]juDownURL:@"https://cms.pifubao.com.cn/cms/resource/static/comment/2018/10/30/2101.html" success:^(NSString *location) {
//
////        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:location]];
////        [request setTimeoutInterval:30];
//        dispatch_async(dispatch_get_main_queue(), ^{
////            NSString *htmlString = [NSString stringWithContentsOfFile:location encoding:NSUTF8StringEncoding error:nil];
//            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL fileURLWithPath:location]];
//            [self.ju_webView loadRequest:request];
////            [self.ju_webView loadHTMLString:htmlString baseURL:locationUrl];
//            NSLog(@"%@",self.ju_webView.request.URL);
//        });
//
//    } failblock:^(NSError *error) {
//
//    }];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://cms.pifubao.com.cn/cms/resource/static/comment/2018/10/30/2101.html"]];
//    [self.ju_webView loadRequest:request];
//    //            [self.ju_webView loadHTMLString:htmlString baseURL:locationUrl];
//    NSLog(@"%@",self.ju_webView.request.URL);
    // Do any additional setup after loading the view from its nib.
}
- (void)readCache
{
//    https://cms.pifubao.com.cn/cms/resource/static/comment/2018/10/30/2101.html
    self.url=[NSURL URLWithString:@"http://localhost/test/tokenTest.html"];
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) objectAtIndex:0];
    NSString * path = [cachesPath stringByAppendingString:[NSString stringWithFormat:@"/Caches/%lu.html",(unsigned long)[[self.url absoluteString] hash]]];
    NSString *htmlString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];

//    if (!(htmlString ==nil || [htmlString isEqualToString:@""])) {
//        [self.ju_webView loadHTMLString:htmlString baseURL:self.url];
//    }else{

        NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
        [self.ju_webView loadRequest:request];
//    }
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *string= [webView stringByEvaluatingJavaScriptFromString:@"msg_title+'#'+msg_desc+'#'+msg_cdn_url;"];
    NSString *string1= [webView stringByEvaluatingJavaScriptFromString:@"str"];

    [self writeToCache];
}
- (void)writeToCache
{
    NSString * htmlResponseStr = [NSString stringWithContentsOfURL:self.ju_webView.request.URL encoding:NSUTF8StringEncoding error:Nil];
    //创建文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //获取document路径
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    [fileManager createDirectoryAtPath:[cachesPath stringByAppendingString:@"/Caches"] withIntermediateDirectories:YES attributes:nil error:nil];
    //写入路径
    NSString * path = [cachesPath stringByAppendingString:[NSString stringWithFormat:@"/Caches/%lu.html",(unsigned long)[[self.ju_webView.request.URL absoluteString] hash]]];

    [htmlResponseStr writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];

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
