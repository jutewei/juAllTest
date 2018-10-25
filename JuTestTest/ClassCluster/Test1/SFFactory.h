//
//  SFFactory.h
//  JuTestTest
//
//  Created by Juvid on 2018/10/19.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SFOperation.h"
typedef NS_ENUM(NSInteger, SFFactoryProductType){
    SFFactoryProductTypeMantou,
    SFFactoryProductTypeYoutiao,
};
@interface SFFactory : NSObject
+ (SFOperation *)operationBreakfast:(SFFactoryProductType )breakfastType;
@end
