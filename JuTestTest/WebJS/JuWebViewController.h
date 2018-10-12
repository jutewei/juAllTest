//
//  JuWebViewController.h
//  JuTestTest
//
//  Created by Juvid on 2018/10/12.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import <WebKit/WKPreferences.h>
@interface JuWebViewController : UIViewController<WKNavigationDelegate,UINavigationControllerDelegate,WKUIDelegate>
@property (strong, nonatomic) WKWebView *sh_WebView;
@end
