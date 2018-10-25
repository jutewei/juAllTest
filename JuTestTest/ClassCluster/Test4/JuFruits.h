//
//  JuFruits.h
//  JuTestTest
//
//  Created by Juvid on 2018/10/19.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JuFruitsDelegate <NSObject>
-(void)toHome:(Class)class;
@end

@interface JuFruits : NSObject
@property(nonatomic,weak)id<JuFruitsDelegate>delegate;
+(JuFruits*)buyTool:(NSInteger)tool;
-(int)shouldPayMoney;
-(void)run;
@end


