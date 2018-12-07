//
//  JuBasePickView.m
//  JuBasePickView
//
//  Created by Juvid on 15/12/15.
//  Copyright © 2015年 Juvid(zhutianwei). All rights reserved.
//

#import "JuBasePickView.h"

@interface JuBasePickView()

@property (nonatomic,copy)JuHandleWithData ju_handleData;
@property BOOL juIsHide;///< 是否已隐藏
@property (nonatomic,strong)UIView *ju_supView;

@end

@implementation JuBasePickView
-(id)init{
    self=[super init];
    if (self) {
        self.frame=CGRectMake(0, Screen_Height, Screen_Width, self.juPickHeight);
        [self juSetPickBar];
        [self juSetPickView];
        ju_outputModel=[[JuOutputDataModel alloc]init];
//        self.leIsHide=YES;
    }
    return self;
}
-(void)juSetPickView{

}
-(void)setJuCanNoCancel:(BOOL)juCanNoCancel{
    _juCanNoCancel=juCanNoCancel;
    if (_juCanNoCancel) {
        ju_navigationItem.leftBarButtonItem=nil;
    }
}
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *view=[super hitTest:point withEvent:event];
    if (!view) {
        [self juHidePick];
    }
    return view;
}
+(instancetype)initWitBackHandle:(JuHandleWithData)handleData{
    JuBasePickView *pick=[[[self class] alloc]init];
    pick.ju_handleData = handleData;
    return pick;
}
+(instancetype)initWithView:(UIView *)view backHandle:(JuHandleWithData)handleData{
    JuBasePickView *pick=[[[self class] alloc]init];
    pick.ju_handleData=handleData;
    if (view) {
        pick.ju_supView=view;
    }
    return pick;
}

-(void)setJu_navTitle:(NSString *)ju_navTitle{
    [ju_navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                       [UIFont systemFontOfSize:15], NSFontAttributeName, [UIColor darkGrayColor],NSForegroundColorAttributeName,nil]];
    ju_navigationItem.title=ju_navTitle;
    _ju_navTitle=ju_navTitle;
}

-(CGFloat)juPickHeight{
    return 0;
}
-(void)juWillFinishData{

}
-(void)juSetPickBar{
    CGFloat navbarH=44;
    ju_navigationBar=[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, navbarH)];
    ju_navigationBar.barStyle=UIBarStyleBlackTranslucent;
    ju_navigationBar.barTintColor=[UIColor colorWithWhite:0.5 alpha:1];
    [self addSubview:ju_navigationBar];
    ju_navigationItem=[[UINavigationItem alloc]init];
    ju_navigationBar.titleTextAttributes= @{NSForegroundColorAttributeName: [UIColor colorWithWhite:.2 alpha:1], NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
    [ju_navigationBar pushNavigationItem:ju_navigationItem animated:NO];

    UIBarButtonItem *itemLeft = ^UIBarButtonItem *{
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 22)];
        button.backgroundColor = [UIColor clearColor];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];

        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [button setTitle:@"取消" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(juPressCancle:) forControlEvents:UIControlEventTouchUpInside];
        
        return item;
    }();

    UIBarButtonItem *itemRight = ^UIBarButtonItem *{
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 22)];
        button.backgroundColor = [UIColor clearColor];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
        [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [button setTitle:@"完成" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(juPressTure:) forControlEvents:UIControlEventTouchUpInside];
        return item;
    }();
    
    ju_navigationItem.rightBarButtonItem=itemRight;
    ju_navigationItem.leftBarButtonItem=itemLeft;
    
}
-(void)juShowPick{
    if(self.juIsHide)return;
    _juIsHide=YES;
    if (self.ju_supView) {
        [self.ju_supView addSubview:self];
    }
    [self.superview endEditing:YES];
    [UIView animateWithDuration:0.2
                     animations:^(void) {
                         self.alpha = 1.0;
                         self.frame = CGRectMake(0, self.superview.frame.size.height-self.juPickHeight, self.superview.frame.size.width, self.juPickHeight);
                     }
     ];
}
-(void)juHidePick{
    if (self.ju_supView) {
        if(!self.juIsHide)return;
        _juIsHide=NO;
        [UIView animateWithDuration:0.2
                         animations:^(void) {
                             self.alpha = 0.0;
                             self.frame = CGRectMake(0, self.superview.frame.size.height, self.superview.frame.size.width, self.juPickHeight);
                         } completion:^(BOOL finished) {
                             [self removeFromSuperview];
                         }];
    }
    else{
        [self.window endEditing:YES];
    }
//    [self juHidePick:self.juPickHeight];
}
//-(void)juShowPick:(CGFloat)pickH{
//
//
//}
//-(void)juHidePick:(CGFloat)pickH{
//
//}
-(void)juPressCancle:(UIBarButtonItem *)sender{
    [self juHidePick];
}

-(void)juPressTure:(UIBarButtonItem *)sender{
    [self juDidFinishData];
    [self juHidePick];
}

-(void)juDidFinishData{
    [self juWillFinishData];
    if (self.ju_handleData) {
        self.ju_handleData(ju_outputModel);
    }
}
@end
