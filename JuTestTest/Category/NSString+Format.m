//
//  NSString+Format.m
//  PFBPublic
//
//  Created by Juvid on 2018/4/26.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "NSString+Format.h"

@implementation NSString (Format)

-(NSString *)juSetEncoding{
//    [self.sh_Url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]", NULL,kCFStringEncodingUTF8));
}
-(NSString *)juSetCharacterEncoding{
//    不过滤任何特殊字符 文本自动编码
   return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@""].invertedSet];
}
-(NSString *)juSetEncodingNew{
    NSString *url = @"https://www.jianshu.com/notebooks/352195?location=%&23!&userid=8957";
    NSString *encodeUrl = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    NSLog(@"%@",encodeUrl);
    NSString *testStr = @"2#&!@测试";
    NSString *testEncodeUrl = [testStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    NSLog(@"%@",testEncodeUrl);


     return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#^{}\"[]|\\<> "].invertedSet];

}
@end
