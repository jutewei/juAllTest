//
//  JuCityDataAdapter.m
//  PFBPublic
//
//  Created by Juvid on 2018/12/5.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuCityDataAdapter.h"

@implementation JuCityDataAdapter

- (NSString *)juTitle{
    return self.juData[@"name"];
}
- (NSString *)juId{
    return self.juData[@"code"];
}
- (NSArray <JuInputDataAdapter *>*)juArrList{
    return self.juData[@"areas"];
}

@end
