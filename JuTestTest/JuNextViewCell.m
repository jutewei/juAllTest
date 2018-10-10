//
//  JuNextViewCell.m
//  JuTestTest
//
//  Created by Juvid on 2018/9/25.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuNextViewCell.h"
#import "UIImage+HWCorner.h"
@implementation JuNextViewCell

- (void)awakeFromNib {
    [super awakeFromNib];



    [sh_imgeView1 setImage:[[UIImage imageNamed:@"img6.jpg"] drawCornerInRect:sh_imgeView1.bounds cornerRadius:sh_imgeView1.bounds.size.width * 0.5]];
//    [sh_imageView2 setImage:[[UIImage imageNamed:@"img7.jpg"] drawCornerInRect:sh_imageView2.bounds cornerRadius:sh_imageView2.bounds.size.width * 0.5]];
//    [sh_imageView3 setImage:[[UIImage imageNamed:@"img8.jpg"] drawCornerInRect:sh_imageView3.bounds cornerRadius:sh_imageView3.bounds.size.width * 0.5]];
    // Initialization code
}
-(void)shSetView{

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
@implementation JuImageView

- (void)awakeFromNib {
    [super awakeFromNib];
//    [self.layer setCornerRadius:15];
//    [self.layer setMasksToBounds:YES];
//    self.layer.shouldRasterize = YES;
//    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    //    [sh_imgeView1 setImage:[[UIImage imageNamed:@"img6.jpg"] drawCornerInRect:sh_imgeView1.bounds cornerRadius:sh_imgeView1.bounds.size.width * 0.5]];
    //    [sh_imageView2 setImage:[[UIImage imageNamed:@"img7.jpg"] drawCornerInRect:sh_imageView2.bounds cornerRadius:sh_imageView2.bounds.size.width * 0.5]];
    //    [sh_imageView3 setImage:[[UIImage imageNamed:@"img8.jpg"] drawCornerInRect:sh_imageView3.bounds cornerRadius:sh_imageView3.bounds.size.width * 0.5]];
    // Initialization code
}
//-(void)layoutSubviews{
//    [super layoutSubviews];
//    if (!self.layer.mask) {
//        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(CGRectGetWidth(self.frame)/2,CGRectGetHeight(self.frame)/2)];
//        //创建 layer
//        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//        maskLayer.frame = self.bounds;
//        //赋值
//        maskLayer.path = maskPath.CGPath;
//        self.layer.mask=maskLayer;
//    }
//}
@end
