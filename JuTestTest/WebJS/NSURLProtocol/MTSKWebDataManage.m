//
//  MTSKProtocolData.m
//  libwebp
//
//  Created by Juvid on 2019/12/26.
//http://www.iana.org/assignments/media-types/media-types.xhtml 对应

#import "MTSKWebDataManage.h"
#import <CommonCrypto/CommonDigest.h>
#import "MTURLSchemeHandler.h"

#define JuDate @"date"
#define JuMinRefresh  @"minRefresh"
#define MTDefaultPath   @"com.meitu.WebKit.skinCache"
@interface MTSKWebDataManage ()
@property (nonatomic, strong) NSCache *mt_webCache;
@end

@implementation MTSKWebDataManage
-(instancetype)init{
    self=[super init];
    if (self) {
        self.mutableData=[NSMutableData data];
    }
    return self;
}

//- (NSData *)dataForKey:(NSString *)key{
//    return [self.mt_webCache objectForKey:key];
//}
//- (void)setData:(NSData *)obj forKey:(NSString *)key{
//    if (obj) {
//        [self.mt_webCache setObject:obj forKey:key];
//    }
//}

//-(void)reSetWebView{
//    WKWebViewConfiguration *configuration = [WKWebViewConfiguration new];
//    if (@available(iOS 11.0, *)) {
//        [configuration setURLSchemeHandler:[MTURLSchemeHandler new] forURLScheme:@"customScheme"];
//    }
//    _mt_WebView=[[WKWebView alloc]initWithFrame:CGRectZero configuration:configuration];
//}
//-(WKWebView *)mt_WebView{
//    if (!_mt_WebView) {
//        [self reSetWebView];
//    }
//    return _mt_WebView;
//}
+(MTSKWebDataManage *)mtInitRequest:(NSURLRequest *)request{
    MTSKWebDataManage *dataSession=[[MTSKWebDataManage alloc] init];
    dataSession.request=request;

    return dataSession;
}

//+(MTSKWebDataManage *)mtInitSchemeTask:(id <WKURLSchemeTask> )urlSchemeTask withRequest:(NSURLRequest *)request{
//    MTSKWebDataManage *dataSession=[self mtInitRequest:request];
//    dataSession.urlSchemeTask=urlSchemeTask;
//    return dataSession;
//}
//
//-(void)setUrlSchemeTask:(id<WKURLSchemeTask>)urlSchemeTask{
//    _urlSchemeTask=urlSchemeTask;
//    if (_urlSchemeTask) {
//        NSString *acept=_urlSchemeTask.request.allHTTPHeaderFields[@"Accept"];
//       _isResource=[MTSKWebDataManage.MIMEExtensions containsObject:[_urlKey pathExtension]]||[acept containsString:@"image"];
//    }
//}

-(void)setRequest:(NSURLRequest *)request{
    _request=request;
    self.urlKey=request.URL;
}

-(void)appendData:(NSData *)data{
    [self.mutableData appendData:data];
}

-(void)completeData{
    [MTSKWebDataManage saveWithData:self.mutableData urlKey:_urlKey];
    self.mutableData=nil;
}

+(BOOL)containsResource:(NSURL *)url acept:(NSString *)acept{
    BOOL isResource=[self isJSOrCSSFile:url]||[acept containsString:@"image"];
    return isResource;
}

+(void)saveContainsResourceUrl:(NSURL *)urlKey acept:(NSString *)acept data:(NSData *)data{
    if ([self containsResource:urlKey acept:acept]) {
        [self saveWithData:data urlKey:urlKey];
    }
}

+(BOOL)isJSOrCSSFile:(NSURL *)url{
    if ([MTMIMEExtensions containsObject:url.pathExtension]) {
        return YES;
    }
    NSString *str=url.absoluteString;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\.(js|css)" options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray *result = [regex matchesInString:str options:NSMatchingReportProgress range:NSMakeRange(0, str.length)];
    return result.count;
}

+(void)saveWithData:(NSData *)data urlKey:(NSURL *)urlKey{

    if ([urlKey.pathExtension isEqual:@"json"]||data.length==0) return;///< 不保存json数据

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        NSString *fullPath=[MTSKWebDataManage resourceCachePath:urlKey];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSError *error=nil;
        [data writeToFile:fullPath options:NSAtomicWrite error:&error];
        if ([self isJSOrCSSFile:urlKey]) {
            NSString *headPath=[NSString stringWithFormat:@"%@ heads",[fullPath stringByDeletingPathExtension]];
            NSMutableDictionary *dicCacheHead=[NSMutableDictionary dictionary];
            [dicCacheHead setObject:@([[NSDate date] timeIntervalSince1970]) forKey:JuDate];
            [dicCacheHead setObject:[NSNumber numberWithDouble:24*60*60] forKey:JuMinRefresh];
            [dicCacheHead writeToFile:headPath atomically:YES];
        }
    });

}

//文件内容
+ (NSData *)getWebKitCache:(NSURL *)key{
    NSString *filePath =[MTSKWebDataManage resourceCachePath:key];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath])  return nil;
    if ([self isJSOrCSSFile:key]) {
        NSString *headPath=[NSString stringWithFormat:@"%@ heads",[filePath stringByDeletingPathExtension]];
        NSDictionary *headDic= [NSDictionary dictionaryWithContentsOfFile:headPath];
        if (!headDic) return nil;
        NSTimeInterval timecurret=[[NSDate date] timeIntervalSince1970]-[headDic[JuDate] floatValue];
        if (timecurret>[headDic[JuMinRefresh] integerValue]) {
            return nil;
        }
    }
    return  [NSData dataWithContentsOfFile:filePath];
}

/// 获取本地缓存资源路径
/// @param key 资源网络路径
+ (NSString *)resourceCachePath:(NSURL *)key {
    NSString *path=nil;
    if ([self isJSOrCSSFile:key]) {
        path=@"JSOrCSS";
    }else{
        path=@"Media";
    }
    NSString *fileName=[self setMD5:key.absoluteString];
//    if ([self.MIMEExtensions containsObject:key.pathExtension]) {///不可识别的不加拓展名
    if (key.pathExtension.length) {
        fileName=[fileName stringByAppendingPathExtension:key.pathExtension];
    }
//    }
    return [self defaultCachePath:fileName withPath:path];
}

//文件路径
+ (NSString *)defaultCachePath:(NSString *)fileName withPath:(NSString *)filePath{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    static NSString *cachePath=nil;
    if (cachePath==nil) {
        cachePath=[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:MTDefaultPath];
        NSLog(@"缓存路径:%@",cachePath);
    }
    NSString *path=cachePath;
    if (filePath.length) {
        path=[path stringByAppendingPathComponent:filePath];
    }
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path  withIntermediateDirectories:YES  attributes:nil error:NULL];
    }

    if (fileName.length) {//< 返回完整的文件名路径
        path=[path stringByAppendingPathComponent:fileName];
    }
    return path;
}

+(NSString *)MIMETypes:(NSURL *)urlStr{
    NSString *pathExtension=[urlStr pathExtension];
    if ([pathExtension isEqual:@"js"]||[urlStr.absoluteString hasSuffix:@".js"]) {
        return @"application/javascript";
    }else if ([pathExtension isEqual:@"css"]||[urlStr.absoluteString hasSuffix:@".css"]) {
        return @"text/css";
    }else if ([pathExtension isEqual:@"png"]){
        return @"image/png";
    }
    else if ([pathExtension isEqual:@"gif"]){
        return @"image/gif";
    }else{
        return @"image/ipeg";
    }
}

/**检测缓存是否过期（超过7天）**/
+(void)checkCacheDate{
    NSString *pathConfig=[self defaultCachePath:@"resourceConfig" withPath:nil];
    NSDictionary *headDic=[NSDictionary dictionaryWithContentsOfFile:pathConfig];
    if (headDic) {
        NSTimeInterval timecurret=[[NSDate date] timeIntervalSince1970]-[headDic[JuDate] floatValue];
        if (timecurret>7*24*60*60) {
            [[NSFileManager defaultManager] removeItemAtPath:[self defaultCachePath:nil withPath:@"Resource"] error:nil];
            [@{JuDate:@([[NSDate date] timeIntervalSince1970])} writeToFile:pathConfig atomically:YES];
        }
        return;
    }
    [@{JuDate:@([[NSDate date] timeIntervalSince1970])} writeToFile:pathConfig atomically:YES];
}

+ (NSString *)setMD5:(NSString *)str{
    if (!str)   return nil;
    const char *cStr = [str UTF8String];
    unsigned char r[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), r);
    NSString *strFileName=[NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], r[8], r[9], r[10], r[11], r[12], r[13], r[14], r[15]];
    return strFileName;
}

@end
