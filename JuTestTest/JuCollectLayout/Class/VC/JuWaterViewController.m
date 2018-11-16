//
//  JuWaterViewController.m
//  JuTestTest
//
//  Created by Juvid on 2018/11/16.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuWaterViewController.h"
#import "JuWaterflowLayout.h"
#import "JuShopCell.h"
#import "HMShop.h"
@interface JuWaterViewController () <UICollectionViewDataSource, UICollectionViewDelegate, HMWaterflowLayoutDelegate>
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *shops;

@end

@implementation JuWaterViewController

- (NSMutableArray *)shops
{
    if (_shops == nil) {
        self.shops = [NSMutableArray array];
    }
    return _shops;
}

static NSString *const ID = @"shop";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // 1.初始化数据
//    NSArray *shopArray = [HMShop objectArrayWithFilename:@"1.plist"];
//    [self.shops addObjectsFromArray:shopArray];
    for (int i=0; i<100; i++) {
        HMShop *shop=[[HMShop alloc]init];
        shop.w=100;
        shop.h=i%3/30.*100+80;
        shop.img=@"img6.jpg";
        shop.price=[NSString stringWithFormat:@"%f",i*1.3];
        [self.shops addObject:shop];
    }

    JuWaterflowLayout *layout = [[JuWaterflowLayout alloc] init];
    layout.delegate = self;
    //    layout.sectionInset = UIEdgeInsetsMake(100, 20, 40, 30);
    //    layout.columnMargin = 20;
    //    layout.rowMargin = 30;
    //    layout.columnsCount = 4;

    // 2.创建UICollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"JuShopCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;

    // 3.增加刷新控件
//    [self.collectionView addFooterWithTarget:self action:@selector(loadMoreShops)];
}

- (void)loadMoreShops
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSArray *shopArray = [HMShop objectArrayWithFilename:@"1.plist"];
//        [self.shops addObjectsFromArray:shopArray];
//        [self.collectionView reloadData];
//        [self.collectionView footerEndRefreshing];
    });
}

#pragma mark - <HMWaterflowLayoutDelegate>
- (CGFloat)waterflowLayout:(JuWaterflowLayout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath
{
    HMShop *shop = self.shops[indexPath.item];
    return shop.h / shop.w * width;
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.shops.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JuShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.shop = self.shops[indexPath.item];
    return cell;
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
