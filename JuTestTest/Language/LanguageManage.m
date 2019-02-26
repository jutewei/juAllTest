//
//  LanguageManage.m
//  JuTestTest
//
//  Created by Juvid on 2019/2/26.
//  Copyright © 2019 Juvid. All rights reserved.
//

#import "LanguageManage.h"

@implementation LanguageManage

//+ (LanguageManage *)sharedInstance{
//    static LanguageManage *language=nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        language = [[LanguageManage alloc] init];
//    });
//    return language;
//}

+ (void)initLanguage{
    NSString *language=[self currentLanguage];
    if (language.length>0) {
        NSLog(@"自设置语言:%@",language);
    }else{
        [self systemLanguage];
    }
}

+ (NSString *)currentLanguage{
    NSString *language=[[NSUserDefaults standardUserDefaults]objectForKey:AppLanguage];
    return language;
}

+ (void)setLanguage:(NSString *)language{
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:AppLanguage];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)systemLanguage{
    NSString *languageCode = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"][0];
    if([languageCode hasPrefix:@"zh-Hant"]){
        languageCode = @"zh-Hants";//繁体中文
    }else if([languageCode hasPrefix:@"zh-Hans"]){
        languageCode = @"zh-Hans";//简体中文
    }else{
        languageCode = @"en";//英语
    }
    //languageCode = @"zh-Hans";//简体中文
    [self setLanguage:languageCode];
    [LanguageManage setLanguage:@"en"];
}

@end
