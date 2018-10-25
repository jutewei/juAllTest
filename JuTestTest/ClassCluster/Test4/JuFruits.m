//
//  JuFruits.m
//  JuTestTest
//
//  Created by Juvid on 2018/10/19.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuFruits.h"




@interface Apple : JuFruits

@end
@implementation Apple
-(int)shouldPayMoney{
    return 50;
}
-(void)run{
    [super run];
    NSLog(@"this is apple");
}
@end

@interface Banana : JuFruits

@end

@implementation Banana
-(int)shouldPayMoney{
    return 1000;
}
-(void)run{
    [super run];
    NSLog(@"this is Banana");
}
@end


@interface Orange : JuFruits

@end

@implementation Orange
-(int)shouldPayMoney{
    return 300;
}
-(void)run{
    [super run];
    NSLog(@"this is Orange");
}
@end


@interface Peach : JuFruits

@end


@implementation Peach
-(int)shouldPayMoney{
    return 10;
}
-(void)run{
    [super run];
    NSLog(@"this is Peach");
}
@end

@implementation JuFruits
+(JuFruits*)buyTool:(NSInteger)tool{
    
    switch (tool) {
        case 1:
            return [[Apple alloc]init];
            break;
        case 2:
            return [[Banana alloc]init];
            break;
        case 3:
            return [[Orange alloc]init];
            break;
        case 4:
            return [[Orange alloc]init];
            break;
        default:
            return [[JuFruits alloc]init];
            break;

    }
}

-(int)shouldPayMoney{
    return 0;
}
-(void)run{
    [self.delegate toHome:[self class]];
}
@end

