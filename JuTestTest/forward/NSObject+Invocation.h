//
//  NSObject+Invocation.h
//  JuTestTest
//
//  Created by Juvid on 2019/1/18.
//  Copyright © 2019 Juvid. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Invocation)
-(id)juInvocationSelector:(SEL)selector withObjects:(NSArray *)objects;
@end

NS_ASSUME_NONNULL_END
