//
//  JuCollectionViewLayout.h
//  JuTestTest
//
//  Created by Juvid on 2018/11/13.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DWScreenH = [UIScreen mainScreen].bounds.size.height
#define DWScreenW = [UIScreen mainScreen].bounds.size.width

NS_ASSUME_NONNULL_BEGIN


@interface JuCollectionViewLayout : UICollectionViewFlowLayout{
    CGPoint ju_lowPoint;
}

@end

NS_ASSUME_NONNULL_END
