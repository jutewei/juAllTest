//
//  JuTestEncrypt.m
//  JuTestTest
//
//  Created by Juvid on 2018/10/10.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuTestEncrypt.h"
#import "JuRSAEncrypt.h"
#define PublicKey   @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDXSv0AkXt90o3bBmBrB3nDYPpH4cvDU0XmXT8klzrm5YD/Tqsrotiw+0r3Bf9TeZQ5XjJHwQUIxi2gjSE/8l9+5v2RV6Fk8zWTjwm+6/xw/Lft8RxN9GmetZOsX+5dbWBhE0wUnzIqV21XL0Zg64FPsriR+n+EaMjVUCl/MF3scQIDAQAB"
#define PrivateKey  @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBANdK/QCRe33SjdsGYGsHecNg+kfhy8NTReZdPySXOublgP9Oqyui2LD7SvcF/1N5lDleMkfBBQjGLaCNIT/yX37m/ZFXoWTzNZOPCb7r/HD8t+3xHE30aZ61k6xf7l1tYGETTBSfMipXbVcvRmDrgU+yuJH6f4RoyNVQKX8wXexxAgMBAAECgYAVqIyVPw1+Ve1BaH3QpprgReRH0PZPuxPgHedZRgF98v6sMHzV0fccrtsWyLqr6iI4Nzq1rzxTaqRyb2A176sdiOD8OBOYVG6HjTtWMbhqT7a6cwVLCIH2uFmOP/ezySVjMi6tC9Y5zfMqGlL/YNMj5QCGqdhsuxc2YuGczVE2AQJBAOvJuG/XlwNTKjD6sJ2ofnnEOSYuebTuxCwHN3IQ+2HiHZvXl/UVLM2B6KktKV3uCKAOo4kS8rMQUeJ1MSTm8RECQQDpv4L5bIVxMM7gN9lDZK5wbdE5rfQEk4pD9M5VCRNEQSwRxEWVwZnHsqlepO9+Qat6tZfW/1wHL7M5NRz3s0VhAkEAltR0Qj80H/FcRPaockHtnfES6cTDICW4ob2AD1yjoirl6+IPF70S6udWMJpuIuL464JRxIa1cCxZZTa4WDXPMQJAH23swnThDHMvnd5kjDdBbUSW2VaWdPcRpEmKZMyvloHc1xa49IXvk3ZmZ59txGA4GmvIWtRDH4Q+aPbHSlcEgQJBAJIfY5up/cjwriF88JdfoSyvavvhEwE2U6HUGG3XNPHDdqRkJrd26nYK2A1v/pR2NLI76rCVn+NKXLy2OncRO7g="

@implementation JuTestEncrypt
+(void)juTest{

    NSString *originalString = @"这是一段将要使用'.der'文件加密的字符串!";
    //使用.der和.p12中的公钥私钥加密解密
    NSString *public_key_path = [[NSBundle mainBundle] pathForResource:@"public_key.der" ofType:nil];
    NSString *private_key_path = [[NSBundle mainBundle] pathForResource:@"private_key.p12" ofType:nil];

    NSString *encryptStr = [JuRSAEncrypt encryptString:originalString publicKeyWithContentsOfFile:public_key_path];
    NSLog(@"加密前#### %@", originalString);
    NSLog(@"加密后#### %@", encryptStr);
    NSLog(@"解密后#### %@", [JuRSAEncrypt decryptString:encryptStr privateKeyWithContentsOfFile:private_key_path password:@"jute"]);


    originalString = @"通常我们使用iOS的RSA加密或者解密时候,有如下几种情况(这里只讨论使用公钥加密的情况):带公钥的证书PEM的格式public key(base64编码的PEM格式的公钥)DER格式的二进制字符串公钥只有公钥的模n和公开幂e(通常是给的16进制Data数据)带公钥证书,PEM格式publickey,DER格式的二进制字符串加密方法iOS能够支持的带公钥的证书只能支持 --- 二进制编码格式的DER的X.509格式的证书.因此如果给予的证书格式是PEM格式,请参考本博客其他的RSA相关的文章,将PEM格式转化成DER格式.通常我们使用iOS的RSA加密或者解密时候,有如下几种情况(这里只讨论使用公钥加密的情况):带公钥的证书PEM的格式public key(base64编码的PEM格式的公钥)DER格式的二进制字符串公钥只有公钥的模n和公开幂e(通常是给的16进制Data数据)带公钥证书,PEM格式publickey,DER格式的二进制字符串加密方法iOS能够支持的带公钥的证书只能支持 --- 二进制编码格式的DER的X.509格式的证书.因此如果给予的证书格式是PEM格式,请参考本博客其他的RSA相关的文章,将PEM格式转化成DER格式.通常我们使用iOS的RSA加密或者解密时候,有如下几种情况(这里只讨论使用公钥加密的情况):带公钥的证书PEM的格式public key(base64编码的PEM格式的公钥)DER格式的二进制字符串公钥只有公钥的模n和公开幂e(通常是给的16进制Data数据)带公钥证书,PEM格式publickey,DER格式的二进制字符串加密方法iOS能够支持的带公钥的证书只能支持 --- 二进制编码格式的DER的X.509格式的证书.因此如果给予的证书格式是PEM格式,请参考本博客其他的RSA相关的文章,将PEM格式转化成DER格式.通常我们使用iOS的RSA加密或者解密时候,有如下几种情况(这里只讨论使用公钥加密的情况):带公钥的证书PEM的格式public key(base64编码的PEM格式的公钥)DER格式的二进制字符串公钥只有公钥的模n和公开幂e(通常是给的16进制Data数据)带公钥证书,PEM格式publickey,DER格式的二进制字符串加密方法iOS能够支持的带公钥的证书只能支持 --- 二进制编码格式的DER的X.509格式的证书.因此如果给予的证书格式是PEM格式,请参考本博客其他的RSA相关的文章,将PEM格式转化成DER格式.通常我们使用iOS的RSA加密或者解密时候,有如下几种情况(这里只讨论使用公钥加密的情况):带公钥的证书PEM的格式public key(base64编码的PEM格式的公钥)DER格式的二进制字符串公钥只有公钥的模n和公开幂e(通常是给的16进制Data数据)带公钥证书,PEM格式publickey,DER格式的二进制字符串加密方法iOS能够支持的带公钥的证书只能支持 --- 二进制编码格式的DER的X.509格式的证书.因此如果给予的证书格式是PEM格式,请参考本博客其他的RSA相关的文章,将PEM格式转化成DER格式.通常我们使用iOS的RSA加密或者解密时候,有如下几种情况(这里只讨论使用公钥加密的情况):带公钥的证书PEM的格式public key(base64编码的PEM格式的公钥)DER格式的二进制字符串公钥只有公钥的模n和公开幂e(通常是给的16进制Data数据)带公钥证书,PEM格式publickey,DER格式的二进制字符串加密方法iOS能够支持的带公钥的证书只能支持 --- 二进制编码格式的DER的X.509格式的证书.因此如果给予的证书格式是PEM格式,请参考本博客其他的RSA相关的文章,将PEM格式转化成DER格式.通常我们使用iOS的RSA加密或者解密时候,有如下几种情况(这里只讨论使用公钥加密的情况):带公钥的证书PEM的格式public key(base64编码的PEM格式的公钥)DER格式的二进制字符串公钥只有公钥的模n和公开幂e(通常是给的16进制Data数据)带公钥证书,PEM格式publickey,DER格式的二进制字符串加密方法iOS能够支持的带公钥的证书只能支持 --- 二进制编码格式的DER的X.509格式的证书.因此如果给予的证书格式是PEM格式,请参考本博客其他的RSA相关的文章,将PEM格式转化成DER格式.通常我们使用iOS的RSA加密或者解密时候,有如下几种情况(这里只讨论使用公钥加密的情况):带公钥的证书PEM的格式public key(base64编码的PEM格式的公钥)DER格式的二进制字符串公钥只有公钥的模n和公开幂e(通常是给的16进制Data数据)带公钥证书,PEM格式publickey,DER格式的二进制字符串加密方法iOS能够支持的带公钥的证书只能支持 --- 二进制编码格式的DER的X.509格式的证书.因此如果给予的证书格式是PEM格式,请参考本博客其他的RSA相关的文章,将PEM格式转化成DER格式.通常我们使用iOS的RSA加密或者解密时候,有如下几种情况(这里只讨论使用公钥加密的情况):带公钥的证书PEM的格式public key(base64编码的PEM格式的公钥)DER格式的二进制字符串公钥只有公钥的模n和公开幂e(通常是给的16进制Data数据)带公钥证书,PEM格式publickey,DER格式的二进制字符串加密方法iOS能够支持的带公钥的证书只能支持 --- 二进制编码格式的DER的X.509格式的证书.因此如果给予的证书格式是PEM格式,请参考本博客其他的RSA相关的文章,将PEM格式转化成DER格式.通常我们使用iOS的RSA加密或者解密时候,有如下几种情况(这里只讨论使用公钥加密的情况):带公钥的证书PEM的格式public key(base64编码的PEM格式的公钥)DER格式的二进制字符串公钥只有公钥的模n和公开幂e(通常是给的16进制Data数据)带公钥证书,PEM格式publickey,DER格式的二进制字符串加密方法iOS能够支持的带公钥的证书只能支持 --- 二进制编码格式的DER的X.509格式的证书.因此如果给予的证书格式是PEM格式,请参考本博客其他的RSA相关的文章,将PEM格式转化成DER格式.通常我们使用iOS的RSA加密或者解密时候,有如下几种情况(这里只讨论使用公钥加密的情况):带公钥的证书PEM的格式public key(base64编码的PEM格式的公钥)DER格式的二进制字符串公钥只有公钥的模n和公开幂e(通常是给的16进制Data数据)带公钥证书,PEM格式publickey,DER格式的二进制字符串加密方法iOS能够支持的带公钥的证书只能支持 --- 二进制编码格式的DER的X.509格式的证书.因此如果给予的证书格式是PEM格式,请参考本博客其他的RSA相关的文章,将PEM格式转化成DER格式.通常我们使用iOS的RSA加密或者解密时候,有如下几种情况(这里只讨论使用公钥加密的情况):带公钥的证书PEM的格式public key(base64编码的PEM格式的公钥)DER格式的二进制字符串公钥只有公钥的模n和公开幂e(通常是给的16进制Data数据)带公钥证书,PEM格式publickey,DER格式的二进制字符串加密方法iOS能够支持的带公钥的证书只能支持 --- 二进制编码格式的DER的X.509格式的证书.因此如果给予的证书格式是PEM格式,请参考本博客其他的RSA相关的文章,将PEM格式转化成DER格式.";
    NSLog(@"加密前1#### %@", originalString);
    NSString *encryptStr1 = [JuRSAEncrypt encryptString:originalString publicKey:PublicKey];
    NSLog(@"加密后1#### %@", encryptStr1);
    NSString *decryptString= [JuRSAEncrypt decryptString:encryptStr1 privateKey:PrivateKey];
    NSLog(@"解密后1#### %@", decryptString);
}
@end
