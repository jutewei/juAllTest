//
//  JuArithmetic.m
//  JuTestTest
//
//  Created by Juvid on 2018/10/9.
//  Copyright © 2018年 Juvid. All rights reserved.
//

#import "JuArithmetic.h"

@implementation JuArithmetic
+(void)juBubbling{
//    [self juShellSorting];
//    [self juInsertionSorting];
//    [self juSelectSorting];
//    [self juBubblingSorting];
    [self JuSelectSorting];
    [self juInsertionSorting];
    [self juBubblingSorting];
    [self juShellSorting];
}

//选择排序 从序列中查找最小的与arr[i]交换
+(void)JuSelectSorting{
    NSMutableArray *arr=[NSMutableArray arrayWithArray:@[@(49),@(38),@(65),@(97),@(76),@(13),@(27),@(49)]];
    NSInteger temp;
    NSInteger cout=0,max =0;
    for (int i=0; i<arr.count-1; i++) {
        cout++;
        max=i;
        for (int j=i+1; j<arr.count; j++) {
            cout++;
            if ([arr[j] integerValue]<[arr[i] integerValue]) {
                max=j;
                cout++;
                temp=[arr[i] integerValue];
                arr[i]=arr[j];///内部i位置不变，j在变
                arr[j]=@(temp);
            }
        }
    }
    int n=(int)arr.count;
    NSLog(@"循环次数 复杂度%f %f",n*n-n*((n-1)/2.0),n*n);
    NSLog(@"选择排序 %@",arr);
    //复杂度 n*n-n*((n-1)/2)
    /*if (i<arr.count-1&&[arr[i] integerValue]>[arr[i+1] integerValue]) {
     temp=[arr[i]integerValue];
     arr[i]=arr[i+1];
     arr[i+1]=@(temp);
     }*/
}

+(void)juInsertionSorting{
    NSMutableArray *arr=[NSMutableArray arrayWithArray:@[@(49),@(38),@(65),@(97),@(76),@(13),@(27),@(49)]];
    NSInteger temp;
    for (int i=1; i<arr.count; i++) {
        for (int j=i; j>0; j--) {
            if ([arr[j] integerValue]<[arr[j-1] integerValue]) {
                temp=[arr[j] integerValue];
                arr[j]=arr[j-1];
                arr[j-1]=@(temp);
            }
        }
    }
    NSLog(@"选择排序 %@",arr);
}

//泡排序 第一个与第二个比较大的排后。一趟后最大移到最后
+(void)juBubblingSorting{
    NSMutableArray *arr=[NSMutableArray arrayWithArray:@[@(49),@(38),@(65),@(97),@(76),@(13),@(27),@(49)]];
    NSInteger temp;
    for (int i=0; i<arr.count; i++) {
        for (int j=0; j<arr.count-1-i; j++) {///<最后一个不排
            if ([arr[j]integerValue]>[arr[j+1]integerValue]) {
                temp=[arr[j+1]integerValue];
                arr[j+1]=arr[j];
                arr[j]=@(temp);
            }
        }
    }
    NSLog(@"冒泡排序 %@",arr);
}

//希尔排序 确定间隔数跳跃式排序，逐渐缩小间隔数，当间隔数为1时完成排序。
+(void)juShellSorting{
    NSMutableArray *arr=[NSMutableArray arrayWithArray:@[@(49),@(38),@(65),@(97),@(76),@(13),@(27),@(49)]];
    NSInteger temp,gap=(NSInteger)arr.count;
    while (gap>1) {
        gap=gap/2;
        for (int i=0; i<arr.count-gap; i++) {
            if ([arr[i] integerValue]>[arr[i+gap] integerValue]) {
                temp=[arr[i] integerValue];
                arr[i]=arr[i+gap];
                arr[i+gap]=@(temp);
            }
        }
    }
    NSLog(@"希尔排序 %@",arr);
}



+(void)SelectSorting{
    NSMutableArray *arr=[NSMutableArray arrayWithArray:@[@(49),@(38),@(65),@(97),@(76),@(13),@(27),@(49)]];
    int d,j,temp;
    for (int i=0; i<arr.count-1; i++) {
        d=i;
        for ( j=i+1; j<arr.count; j++) {
            if ([arr[j] intValue]<[arr[d] intValue]) {
                d=j;
            }
            if (d!=i) {
                temp=[arr[d] intValue];
                arr[d]=arr[i];
                arr[i]=@(temp);
            }
        }
    }
    NSLog(@"选择排序 %@",arr);
}

//插入排序 将一个元素插入到一个已经排列好的子序列的合适位置。


+(void)InsertionSorting{
    NSMutableArray *arr=[NSMutableArray arrayWithArray:@[@(49),@(38),@(65),@(97),@(76),@(13),@(27),@(49)]];
    int j;
    int temp;
    for (int i=1; i<arr.count; i++) {
        int temp=[arr[i] intValue];
        j=i-1;
        while (j>=0&&temp<[arr[j] intValue]) {
            arr[j+1]=arr[j--];

        }
        arr[j+1]=@(temp);
    }
    NSLog(@"插入排序 %@",arr);
}


+(void)BubblingSorting{
    NSMutableArray *arr=[NSMutableArray arrayWithArray:@[@(49),@(38),@(65),@(97),@(76),@(13),@(27),@(49)]];
    int i,j,flag=1;
    int temp;
    i = (int)arr.count-1;
    while (i>0&&flag==1) {
        flag=0;
        for (j=0; j<i; j++) {
            if ([arr[j] intValue]>[arr[j+1] intValue]) {
                temp=[arr[j] intValue];
                arr[j]=arr[j+1];
                arr[j+1]=@(temp);
                flag=1;
            }
        }
        i--;
    }
    NSLog(@"泡排序 %@",arr);
}



+(void)ShellSorting{
    NSMutableArray *arr=[NSMutableArray arrayWithArray:@[@(49),@(38),@(65),@(97),@(76),@(13),@(27),@(49)]];
    int i,j,flag,gap=(int)arr.count;
    int temp;
    while (gap>1) {
        gap=gap/2;
        do {
            flag=0;
            for (i=0; i<arr.count-gap; i++) {
                j=i+gap;
                if ([arr[i] intValue]>[arr[j] intValue]) {
                    temp=[arr[i] intValue];
                    arr[i]=arr[j];
                    arr[j]=@(temp);
                    flag=1;
                }
            }
        }while (flag!=0);
    }
    NSLog(@"希尔排序 %@",arr);
}

/**
 5、快速排序
 找到一个分界值，小的往左移，大的往右移，确定分界值位置
 6、堆积排序
 将数组看成二叉树，分大顶堆积和小顶堆积。
 7、二路归并排序
 将两个或者多个有序队列合成一个有序队列。
 */
@end
