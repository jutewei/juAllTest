//
//  JuMultiPickView.h
//  PFBPublic
//
//  Created by Juvid on 2018/12/5.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuBasePickView.h"
#import "JuInputDataAdapter.h"
NS_ASSUME_NONNULL_BEGIN

@interface JuMultiPickView : JuBasePickView<UIPickerViewDataSource,UIPickerViewDelegate>
@property (readonly, nonatomic) UIPickerView *ju_PickView;
@property (readonly,nonatomic) NSMutableArray *ju_MArrlist;

/**单行数据显示*/
-(void)juSetSingleDataList:(NSArray *)dataList;
/**多行数据显示**/
-(void)juSetDataList:(NSArray *)dataList component:(NSInteger)compoents adapterCls:(Class)adapter;

@end

NS_ASSUME_NONNULL_END
