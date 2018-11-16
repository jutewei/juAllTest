//
//  JuLineViewController.m
//  JuTestTest
//
//  Created by Juvid on 2018/11/16.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuLineViewController.h"
#import "JuImageCell.h"
#import "JuLineLayout.h"
@interface JuLineViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, weak)   UICollectionView *collectionView;

@end

@implementation JuLineViewController

static NSString *const ID = @"image";

- (NSMutableArray *)images
{
    if (!_images) {
        self.images = [[NSMutableArray alloc] init];
        NSArray *arrImage=@[@"img6.jpg",@"img7.jpg",@"img8.jpg"];
        for (int i = 1; i<=20; i++) {
            [self.images addObject:[NSString stringWithFormat:@"%@", arrImage[i%3]]];
        }
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    CGFloat w = self.view.frame.size.width;
    CGRect rect = CGRectMake(0, 100, w, 200);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:[[JuLineLayout alloc] init]];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"JuImageCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    // collectionViewLayout :
    // UICollectionViewLayout
    // UICollectionViewFlowLayout
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.collectionView.collectionViewLayout isKindOfClass:[JuLineLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init] animated:YES];
    } else {
        [self.collectionView setCollectionViewLayout:[[JuLineLayout alloc] init] animated:YES];
    }
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JuImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.image = self.images[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 删除模型数据
    [self.images removeObjectAtIndex:indexPath.item];

    // 删UI(刷新UI)
    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
