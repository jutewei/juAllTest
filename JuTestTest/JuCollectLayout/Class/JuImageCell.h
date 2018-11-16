//
//  JuImageCell.h
//  JuTestTest
//
//  Created by Juvid on 2018/11/16.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JuImageCell : UICollectionViewCell
@property (nonatomic, copy) NSString *image;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

NS_ASSUME_NONNULL_END
