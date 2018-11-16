//
//  JuImageCell.m
//  JuTestTest
//
//  Created by Juvid on 2018/11/16.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuImageCell.h"

@implementation JuImageCell
- (void)awakeFromNib {
    self.imageView.layer.borderWidth = 3;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.cornerRadius = 3;
    self.imageView.clipsToBounds = YES;
}

- (void)setImage:(NSString *)image
{
    _image = [image copy];

    self.imageView.image = [UIImage imageNamed:image];
}

@end
