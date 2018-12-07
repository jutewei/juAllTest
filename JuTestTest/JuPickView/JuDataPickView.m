//
//  JuDataPickView.m
//  PFBPublic
//
//  Created by Juvid on 2018/12/5.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuDataPickView.h"
#import "UIView+JuLayGroup.h"

@implementation JuDataPickView

-(void)juSetPickView{
    [self setJu_navTitle:@"请选择时间"];
    UIDatePicker *datePick=[[UIDatePicker alloc]init];
    datePick.locale=[NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    datePick.datePickerMode=UIDatePickerModeDate;
    datePick.backgroundColor=[UIColor whiteColor];
    datePick.date=[NSDate date];
    [self addSubview:datePick];
    datePick.juFrame(CGRectMake(0.01, -0.01, 0, self.juPickHeight-44));
    _juPickDate=datePick;
}
-(CGFloat)juPickHeight{
    return 220;
}
-(void)setJuDatePickerMode:(UIDatePickerMode)juDatePickerMode{
    self.juPickDate.datePickerMode=juDatePickerMode;
}
-(void)juShowPick{
    [super juShowPick];
    if (self.juDataSelectType == JuDataSelectLater) {
        self.juPickDate.minimumDate = [NSDate date];
    }else if(self.juDataSelectType==JuDataSelectBefore){
        self.juPickDate.maximumDate=[NSDate date];
    }
}

-(void)juWillFinishData{
    NSDate *date=self.juPickDate.date;
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    dateformatter.locale=[NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    if (_ju_timeFormat) {
        [dateformatter setDateFormat:_ju_timeFormat];
    }
    else if (self.juPickDate.datePickerMode == UIDatePickerModeDate) {
        [dateformatter setDateFormat:@"yyyy-MM-dd"];
    }
    else if (self.juPickDate.datePickerMode == UIDatePickerModeDateAndTime) {
        [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    }

    ju_outputModel.juPostId=[NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    ju_outputModel.juShowName=[dateformatter stringFromDate:date];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
