//
//  URLCache.h
//  BGNetBase iOS Example
//
//  Created by Juvid on 14/11/11.
//  Copyright (c) 2014年 Juvid(zhutianwei). All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum _CacheStoragePolicy {
    CacheNotPolicy=0,//默认无缓存
    CacheRoutineCachePolicy = 1,//默认有缓存
//    CachePermanentlyCacheStoragePolicy = 1,//强制

} CacheStoragePolicy;
@protocol JuCacheAdapterProtocol;
@interface JuURLCache : NSObject{
    NSMutableString *urlPara;
    NSString *_urlPath;
}

+(id)initWithPath:(NSString *)paths parameter:(NSDictionary *)para Adapter:(id<JuCacheAdapterProtocol>)dapter;
//缓存磁盘路径
@property (nonatomic, strong) NSString *diskCachePath;

@property (nonatomic, strong) NSString *urlPath;//ulr路径用于MD5加密

@property (nonatomic,strong)NSDictionary *parameter;//ulr参数
//缓存文件名
- (NSString *)cacheKeyForURL;

//过期保留时间
//@property (nonatomic, assign) NSTimeInterval minCacheInterval;

//刷新时间
@property(nonatomic,assign) NSTimeInterval minRefresh;
//缓存策略
@property (nonatomic, assign)CacheStoragePolicy cachePolicy;

//是否刷新数据（并且读缓存）
-(BOOL)juGetCache:(BOOL)netConnection withResult:(void(^)(id result))cacheResult;

//存储文件（写缓存）
- (void)saveCacheInfo:(id)response;

//检测缓存是否存在
-(BOOL)isCached;

//读取缓存
-(id)getCached;

@end
