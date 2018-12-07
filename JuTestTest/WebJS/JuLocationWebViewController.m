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
@interface JuLocationWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *ju_webView;

@end

@implementation JuLocationWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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
    [[JuHTTPRequest sharedInstance]juDownURL:@"https://cms.pifubao.com.cn/cms/resource/static/comment/2018/10/30/2101.html" success:^(NSString *location) {

        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:location]];
        [request setTimeoutInterval:30];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *htmlString = [NSString stringWithContentsOfFile:location encoding:NSUTF8StringEncoding error:nil];
            NSURL *locationUrl = [[NSURL alloc] initWithString:location];
            [self.ju_webView loadHTMLString:htmlString baseURL:locationUrl];
        });

    } failblock:^(NSError *error) {

    }];

    // Do any additional setup after loading the view from its nib.
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
