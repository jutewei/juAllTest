//
//  JuCircleProgressView.h
//  JuCircleProgress
//
//  Created by Juvid on 2017/11/20.
//  Copyright © 2017年 Juvid. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SELF_WIDTH CGRectGetWidth(self.bounds)
#define SELF_HEIGHT CGRectGetHeight(self.bounds)
@interface JuCircleProgressView : UIView
@property (strong, nonatomic) CAShapeLayer *colorMaskLayer; // 渐变色遮罩
@property (strong, nonatomic) CAShapeLayer *colorLayer; // 渐变色
@property (strong, nonatomic) CAShapeLayer *blueMaskLayer; // 蓝色背景遮罩

@property (nonatomic,assign)CGFloat ju_Progress;
/**
 *  进度边宽
 */
@property(nonatomic,assign) CGFloat ju_progressWidth;

@property(nonatomic,strong) NSArray *ju_progressColors;

-(void)shSetView;

@end
