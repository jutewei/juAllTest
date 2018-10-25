//
//  AFFactory.h
//  JuTestTest
//
//  Created by Juvid on 2018/10/19.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFOperation.h"
@interface AFFactory : NSObject
typedef NS_ENUM(NSInteger, AFFactoryProductType){
    AFFactoryProductTypeMantou,
    AFFactoryProductTypeYoutiao,
};
+ (instancetype)factoryWithType:(AFFactoryProductType)type;
- (AFOperation *)createProduct;
@end
