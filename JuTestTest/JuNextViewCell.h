//
//  JuNextViewCell.h
//  JuTestTest
//
//  Created by Juvid on 2018/9/25.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JuNextViewCell : UITableViewCell{
    
    __weak IBOutlet UIImageView *sh_imgeView1;
    __weak IBOutlet UIImageView *sh_imageView2;
    __weak IBOutlet UIImageView *sh_imageView3;
}
-(void)shSetView;
@end

@interface JuImageView : UIImageView
@end
