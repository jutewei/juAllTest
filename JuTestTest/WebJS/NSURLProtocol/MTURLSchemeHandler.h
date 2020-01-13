//
//  MTURLSchemeHandler.h
//  libwebp
//
//  Created by Juvid on 2019/12/27.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#define MTURLSkinScheme  @"mtskinmanage"
#define MTOriginalScheme @"https"
NS_ASSUME_NONNULL_BEGIN

@interface MTURLSchemeHandler : NSObject<WKURLSchemeHandler>

/// 设置自定义scheme URL
/// @param strUrl 地址
+(NSString *)getCustomScheme:(NSString *)strUrl;

/// 设置自定义schemeconfiguration
+(WKWebViewConfiguration *)configuration;

@end

NS_ASSUME_NONNULL_END
