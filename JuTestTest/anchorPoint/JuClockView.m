//
//  JuClockView.m
//  JuTestTest
//
//  Created by Juvid on 2018/11/15.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuClockView.h"
#import "UIView+JuLayout.h"

@implementation JuClockView{
    UIImageView *imageSecond;
    UIImageView *imgSecondPoint;
    UIImageView *imgMinute;
    UIImageView *imgHour;
    CGFloat angle;
    CGPoint secondCenter;
    CGFloat minuteCircle;
    CGFloat hourCircle;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    CGFloat secondHeight=112;

    UIView *vieCenter=[[UIView alloc]init];
    vieCenter.backgroundColor=[UIColor blackColor];
    [self addSubview:vieCenter];
    vieCenter.juSize(CGSizeMake(10, 10));
    vieCenter.juOrigin(CGPointMake(0, 0));
    [vieCenter.layer setCornerRadius:5];
    [vieCenter.layer setMasksToBounds:YES];

    for (int i=0; i<4; i++) {
        UIView *view=[[UIView alloc]init];
        view.backgroundColor=[UIColor blackColor];
        [self addSubview:view];
        if (i%2==1) {///< 横
            view.juSize(CGSizeMake(10, 4));
            view.juCenterY.equal(0);
            if (i==1) {
                view.juTrail.equal(0);
            }else{
                view.juLead.equal(0);
            }
        }else{
            view.juSize(CGSizeMake(4, 10));
            view.juCenterX.equal(0);
            if (i==0) {
                view.juTop.equal(0);
            }else{
                view.juBottom.equal(0);
            }
        }
    }
    imgHour=[[UIImageView alloc]init];
    imgHour.backgroundColor=[UIColor blackColor];
    [self addSubview:imgHour];
    imgHour.juSize(CGSizeMake(6, 62));
    imgHour.juCenterX.equal(0);
    imgHour.juTop.equal(52);

    imgMinute=[[UIImageView alloc]init];
    imgMinute.backgroundColor=[UIColor purpleColor];
    [self addSubview:imgMinute];
    imgMinute.juSize(CGSizeMake(3, 92));
    imgMinute.juCenterX.equal(0);
    imgMinute.juTop.equal(22);

    imageSecond=[[UIImageView alloc]init];
    imageSecond.backgroundColor=[UIColor redColor];
    [self addSubview:imageSecond];
    imageSecond.juSize(CGSizeMake(1, secondHeight));
    imageSecond.juCenterX.equal(0);
    imageSecond.juTop.equal(2);


    imgSecondPoint=[[UIImageView alloc]init];
    imgSecondPoint.backgroundColor=[UIColor redColor];
    [self addSubview:imgSecondPoint];
    [imgSecondPoint.layer setCornerRadius:4];
    [imgSecondPoint.layer setMasksToBounds:YES];
    imgSecondPoint.juSize(CGSizeMake(8, 8));
    imgSecondPoint.juCenterX.equal(0);
    imgSecondPoint.juTop.equal(10);


    [self layoutIfNeeded];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self->imageSecond.layer.anchorPoint=CGPointMake(0.5, 0.9);
        self->imageSecond.layer.position = CGPointMake(self->imageSecond.frame.origin.x+0.5, 0.9*112+2);

        self->imgMinute.layer.anchorPoint=CGPointMake(0.5, 0.88);
        self->imgMinute.layer.position = CGPointMake(self->imgMinute.frame.origin.x+1.5, 0.88*92+22);

        self->imgHour.layer.anchorPoint=CGPointMake(0.5, 0.82);
        self->imgHour.layer.position = CGPointMake(self->imgHour.frame.origin.x+3, 0.82*62+52);
        [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(shSetAnimation) userInfo:nil repeats:YES];
    });

}
-(void)shSetAnimation{

    if (angle>=2*M_PI) {
        angle=0;
    }
    if (minuteCircle>=60) {
        minuteCircle=0;
    }
    if (hourCircle>=12) {
        hourCircle=0;
    }
    angle+=M_PI/300;///一秒转 2M_PI/60 一毫米 2M_PI/60/10

    minuteCircle+=(M_PI/300)/(2*M_PI);///时针每毫米加的圈数，一毫秒转M_PI/300 每次转的圈数(M_PI/300)/(2*M_PI)

    hourCircle+=((M_PI/300)/(2*M_PI))/60.0;

    secondCenter=CGPointMake(sin(angle)*90+103, -cos(angle)*90+103);
    imgSecondPoint.center=secondCenter;

    imageSecond.transform = CGAffineTransformMakeRotation(angle);

    imgMinute.transform = CGAffineTransformMakeRotation((minuteCircle/60.0)*2*M_PI);

    imgHour.transform = CGAffineTransformMakeRotation((hourCircle/12.0)*2*M_PI);
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.layer setCornerRadius:self.frame.size.width/2.0];
    [self.layer setMasksToBounds:YES];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
