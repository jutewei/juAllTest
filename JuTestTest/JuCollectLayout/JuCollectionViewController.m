//
//  JuCollectionViewController.m
//  JuTestTest
//
//  Created by Juvid on 2018/11/13.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuCollectionViewController.h"
#import "JuCollectionViewLayout.h"
#import "JuWaterFolwLayout.h"
@interface JuCollectionViewController ()

@end

@implementation JuCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static NSString * const cellReuseIdentifier = @"head";
- (instancetype)init
{
    //创建流水布局对象
    JuWaterFolwLayout *layout = [[JuWaterFolwLayout alloc] init];
    layout.itemSize =  CGSizeMake(402/3.0, 100);
    //设置水平滚动
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //    // 设置cell之间间距
    layout.minimumInteritemSpacing = 5;
    //    // 设置行距
    layout.minimumLineSpacing = 5;
    layout.sectionInset=UIEdgeInsetsMake(5, 5, 5, 5);
//    layout.headerReferenceSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, 40);
    return [super initWithCollectionViewLayout:layout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
     [self.collectionView registerClass:[UICollectionReusableView class]  forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:cellReuseIdentifier];
    self.collectionView.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor=[UIColor redColor];
    // Configure the cell

    return cell;
}

#pragma mark <UICollectionViewDelegate>
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    if ([kind isEqual:UICollectionElementKindSectionHeader]) {
//        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:cellReuseIdentifier forIndexPath:indexPath];
//        headerView.backgroundColor=[UIColor greenColor];
//        return headerView;
//    }
//    return nil;
//}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(([UIScreen mainScreen].bounds.size.width-22)/3.0, indexPath.row%2==1?110:150);
}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
