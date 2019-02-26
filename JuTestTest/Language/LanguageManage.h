//
//  LanguageManage.h
//  JuTestTest
//
//  Created by Juvid on 2019/2/26.
//  Copyright © 2019 Juvid. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const AppLanguage = @"AppLanguageKey";
#define JULocalized(key, comment)  [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:AppLanguage]] ofType:@"lproj"]] localizedStringForKey:(key) value:@"" table:nil]

#define JULocalizedString(key)  JULocalized(key, nil)

NS_ASSUME_NONNULL_BEGIN

@interface LanguageManage : NSObject

//+ (LanguageManage *)sharedInstance;

+ (void)initLanguage;

+ (NSString *)currentLanguage;

+ (void)systemLanguage;

/**手动切换语言需要去更新第一级页面的语言，可以用在每个页面加相同的通知**/
+ (void)setLanguage:(NSString *)language;

@end

NS_ASSUME_NONNULL_END
