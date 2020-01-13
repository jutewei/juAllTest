//
//  MTSKProtocolData.h
//  libwebp
//
//  Created by Juvid on 2019/12/26.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

#define MTMIMEExtensions @[@"js",@"css"]
NS_ASSUME_NONNULL_BEGIN

@interface MTSKWebDataManage : NSObject

@property (nonatomic, strong) NSMutableData *mutableData;
@property (nonatomic, weak) NSURLRequest *request;
//@property (nonatomic, weak) id <WKURLSchemeTask> urlSchemeTask;
@property (nonatomic, copy) NSURL *urlKey;
//@property (nonatomic, assign) BOOL isResource;
//@property (nonatomic, assign) BOOL isStopTask;

//@property (nonatomic,strong)WKWebView *mt_WebView;

-(void)reSetWebView;
//- (NSData *)dataForKey:(NSString *)key;
//
//- (void)setData:(NSData *)obj forKey:(NSString *)key;

+(MTSKWebDataManage *)mtInitRequest:(NSURLRequest *)request;

//+(MTSKWebDataManage *)mtInitSchemeTask:(id <WKURLSchemeTask> )urlSchemeTask withRequest:(NSURLRequest *)request;
/// UIWebView使用
/// @param data 数据
-(void)appendData:(NSData *)data;

/// 数据加载完成后保存
-(void)completeData;

/// 检测资源文件并存储网页资源
/// @param urlKey 资源网络路径
/// @param acept 头部acept内容
/// @param data 数据
+(void)saveContainsResourceUrl:(NSURL *)urlKey acept:(NSString *)acept data:(NSData *)data;
+(void)saveWithData:(NSData *)data urlKey:(NSURL *)urlKey;
/// 检测是否包含资源文件
/// @param url 地址
/// @param acept 头部acept内容
+(BOOL)containsResource:(NSURL *)url acept:(NSString *)acept;

/// 获取本地缓存资源路径
/// @param key 资源网络路径
+ (NSString *)resourceCachePath:(NSURL *)key;


/// 获取网页资源缓存
/// @param key 资源网络路径
+ (NSData *)getWebKitCache:(NSURL *)key;

/**检测缓存是否过期（超过7天），过期自动删除缓存**/
+(void)checkCacheDate;

/// 获取网页数据的MIMEType
/// @param url 资源网络路径
+(NSString *)MIMETypes:(NSURL *)url;

/// 存储的资源类型
//+(NSArray *)MIMEExtensions;

@end

NS_ASSUME_NONNULL_END
