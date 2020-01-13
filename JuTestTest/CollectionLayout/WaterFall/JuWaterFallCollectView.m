//
//  JuWaterFallCollectView.m
//  JuTestTest
//
//  Created by Juvid on 2019/6/1.
//  Copyright © 2019 Juvid. All rights reserved.
//

#import "JuWaterFallCollectView.h"
#import "JuWaterFallCollectCell.h"
#import "JuTestWaterFallLayout.h"
#import "JuCollectionWaterFallLayout.h"
#define screenWidth [UIScreen mainScreen].bounds.size.width
@interface JuWaterFallCollectView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    JuTestWaterFallLayout *sh_flowLayout;
}

@end

@implementation JuWaterFallCollectView
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self=[super initWithFrame:frame collectionViewLayout:[self juLayout]];
    if (self) {
        [self shSetCollentView];

    }
    return self;
}
-(UICollectionViewFlowLayout *)juLayout{
    sh_flowLayout=[[JuTestWaterFallLayout alloc] init];
    sh_flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    sh_flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    sh_flowLayout.minimumInteritemSpacing = 5;
    sh_flowLayout.minimumLineSpacing = 5;
    return sh_flowLayout;
}
-(void)shSetCollentView{
    if (!self.collectionViewLayout) {
        [self juLayout];
    }else{
        sh_flowLayout=(id)self.collectionViewLayout;
    }
    self.delegate=self;
    self.dataSource=self;
    self.backgroundColor = [UIColor whiteColor];
    NSString *cellReuseIdentifier=@"JuWaterFallCollectCell";
    [self registerNib:[UINib nibWithNibName:cellReuseIdentifier bundle:nil] forCellWithReuseIdentifier:cellReuseIdentifier];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JuWaterFallCollectCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"JuWaterFallCollectCell" forIndexPath:indexPath];
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row%2==1) {
        return CGSizeMake((screenWidth-15)/2, 260);
    }
    return CGSizeMake((screenWidth-15)/2, 200);
}
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(10, 10, 10, 10);
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
