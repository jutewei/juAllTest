//
//  JuVerifyCodeInputView.h
//  JuTestTest
//
//  Created by Juvid on 2020/1/15.
//  Copyright © 2020 Juvid. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JuVerifyCodeInputView : UIView

@property (nonatomic, readonly) UITextField *textField;

@property(nonatomic,assign) BOOL canNotEdit;

@property(nonatomic,strong) UIColor *ju_textColor;

@property(nonatomic,strong) UIFont *ju_textFont;

@property(nonatomic,strong) UIColor *ju_indicatorColor;

@property(nonatomic,strong) UIColor *ju_borderColor;

@property(nonatomic,assign) NSInteger ju_codeLenght;

@property(nonatomic,assign) NSInteger ju_isLineView;

@property (nonatomic, copy) void(^valueChanged) (NSString *code);

@end

NS_ASSUME_NONNULL_END
