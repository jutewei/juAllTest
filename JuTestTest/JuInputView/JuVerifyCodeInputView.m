//
//  JuVerifyCodeInputView.m
//  JuTestTest
//
//  Created by Juvid on 2020/1/15.
//  Copyright © 2020 Juvid. All rights reserved.
//

#import "JuVerifyCodeInputView.h"
#import "UIView+JuLayout.h"
#import "UIColor+Dark.h"

#define JU_ScreenWidth [UIScreen mainScreen].bounds.size.width
@interface JuVerifyCodeInputView()

@property (nonatomic, strong) NSMutableArray <UILabel *> *labels;
@property (nonatomic, strong) NSMutableArray <UIView *> *lines;
@property (nonatomic, copy) NSString *lastValue;
@property (nonatomic, strong) UIView *indicator;
@end

@implementation JuVerifyCodeInputView

- (instancetype)init {
    if (self = [super init]) {
        [self setView];
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self setView];
}
-(void)setView{
    _ju_isLineView=YES;
    _ju_codeLenght=6;
    _ju_indicatorColor=UIColorFromRGB(0xE25967);
    _ju_borderColor=UIColorFromRGB(0xEBEBEB);
    _ju_textFont=[UIFont systemFontOfSize:36 weight:UIFontWeightMedium];
    self.backgroundColor = [UIColor whiteColor];
    _textField = [[UITextField alloc] init];
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    [self.textField addTarget:self action:@selector(textValueChanged:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:self.textField];

    self.labels = [NSMutableArray array];
    self.lines=[NSMutableArray array];
    CGFloat edge=30;
    CGFloat sep=(JU_ScreenWidth - edge*2-self.ju_codeLenght*self.height)/5;

    for (int i=0; i<self.ju_codeLenght; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.textColor = _ju_textColor;
        label.tag=i;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = _ju_textFont;
        label.userInteractionEnabled = NO;

        [self addSubview:label];
//
        if (self.ju_isLineView) {
            UIView *viewLine=[[UIView alloc]init];
            viewLine.userInteractionEnabled = NO;
            if (i==0) {
                viewLine.backgroundColor=self.ju_indicatorColor;
            }else{
                viewLine.backgroundColor=self.ju_borderColor;
            }
            [self addSubview:viewLine];
            viewLine.juFrame(CGRectMake(edge+i*(sep+self.height), -0.01, self.height, 1));
            [self.lines addObject:viewLine];
        }else{
            label.layer.borderColor = self.ju_borderColor.CGColor;
            label.layer.borderWidth = 0.5;
        }
        label.juFrame(CGRectMake(edge+i*(sep+self.height), 0, self.height, self.height));
        [self.labels addObject:label];

    }
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSelf)];
    [self addGestureRecognizer:recognizer];
    if (!self.ju_isLineView){
        UIView *indicator = [UIView new];
        indicator.backgroundColor = self.ju_indicatorColor;
        indicator.layer.cornerRadius = 1;
        indicator.layer.masksToBounds = YES;
        [self addSubview:indicator];
        UILabel *lab=self.labels.firstObject;

        indicator.juCenterX.toView(lab).equal(0);
        indicator.juCenterY.equal(0);
        indicator.juSize(CGSizeMake(2, 24));
        self.indicator = indicator;
    }

    [self animateIndicator];
}
-(CGFloat)height{
    if (JU_ScreenWidth>375) {
        return 46.f;
    }
    return 40.f;
}
-(void)tapSelf{
    [_textField becomeFirstResponder];
}

-(void)setJu_textColor:(UIColor *)ju_textColor{
    _ju_textColor=ju_textColor;
    for (UILabel *lab in self.labels) {
        lab.textColor=_ju_textColor;
    }
}

-(void)setJu_borderColor:(UIColor *)ju_borderColor{
    _ju_borderColor=ju_borderColor;
     for (UILabel *lab in self.labels) {
         lab.layer.borderColor=_ju_borderColor.CGColor;
     }
}
-(void)setJu_textFont:(UIFont *)ju_textFont{
    _ju_textFont=ju_textFont;
    for (UILabel *lab in self.labels) {
        lab.font=_ju_textFont;
    }
}
-(void)textValueChanged:(UITextField *)textField{
    if (self.canNotEdit) {
        textField.text = _lastValue;
        return;
    }
    if (textField.text.length > self.ju_codeLenght) {
        textField.text = [textField.text substringToIndex:self.ju_codeLenght];
    }
    _lastValue = textField.text;

    for (UILabel *label in self.labels) {//先清空
        label.text = @"";
    }

    for (int i=0; i<textField.text.length; i++) {
        NSString *subStr = [textField.text substringWithRange:NSMakeRange(i, 1)];
        UILabel *label = [self.labels objectAtIndex:i];
        label.text = subStr;
    }
    [self setCurrentIndicator:textField.text.length];

    if (textField.text.length == _ju_codeLenght && !_canNotEdit) {
        if (_valueChanged) {
            _valueChanged(textField.text);
        }
    }
}

-(void)setCurrentIndicator:(NSInteger)index{

    for (int i=0; i<self.lines.count;i++) {
        UIView *vie=self.lines[i];
        if (i==index) {
            vie.backgroundColor=self.ju_indicatorColor;
        }else{
            vie.backgroundColor=self.ju_borderColor;
        }
    }
    if (!self.indicator) {
        return;
    }
    if (index >= 6) {
           self.indicator.hidden = YES;
       } else {
           self.indicator.hidden = NO;
           self.indicator.juCenterX.toView(self.labels[index]).equal(0);
       }
}

- (void)animateIndicator {
    if (self.indicator.alpha) {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.indicator.alpha = 0;
        } completion:^(BOOL finished) {
            if (!self.window) {
                return;
            }
            [self animateIndicator];
        }];
    } else {
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.indicator.alpha = 1;
        } completion:^(BOOL finished) {
            [self animateIndicator];
        }];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
