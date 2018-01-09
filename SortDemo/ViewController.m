//
//  ViewController.m
//  SortDemo
//
//  Created by LDH on 2017/9/6.
//  Copyright © 2017年 LDH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *arr = @[@7,@3,@1,@2].mutableCopy;
    NSLog(@"beforeSort ---- %@", arr);
    [self quick_sort:arr first:0 last:arr.count - 1];
    NSLog(@"afterSort ---- %@", arr);
    
}

/**
 冒泡排序
 * 最优时间复杂度 O(n)
 * 最坏时间复杂度 O(n²)
 */
- (void)bubble_sort:(NSMutableArray *)arr{
    NSLog(@"%s", __func__);
    int count = 0;
    for (int i = 0; i < arr.count - 1; i++) {
        for (int j = 0; j < arr.count - 1 - i; j++) {
            if (arr[j] > arr[j+1]) {
                NSNumber *temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
                count++;
            }
        }
        if (count == 0) {
            return;
        }
    }
}


/**
 选择排序
 * 最优时间复杂度 O(n²)
 * 最坏时间复杂度 O(n²)
 * 稳定性：不稳定（考虑升序每次选择最大的情况）
 */
- (void)select_sort:(NSMutableArray *)arr {
    
    for (int i = 0; i < arr.count - 1; i++) { // 比较的次数 [0,count-1) [0,1,2,3]
        int min_index = i;
        for (int j = i; j < arr.count; j++) { // 比较的元素
            if (arr[min_index] > arr[j]) {
                min_index = j;
            }
        }
        NSNumber *temp = arr[i];
        arr[i] = arr[min_index];
        arr[min_index] = temp;
    }
}



/**
 插入排序
 最优时间复杂度：O(n) （升序排列，序列已经处于升序状态）
 最坏时间复杂度：O(n²)
 稳定
 */
- (void)insert_sort:(NSMutableArray *)arr {
    for (int i = 1; i < arr.count; i++) {
        int j = i;
        while (j > 0) {
            if (arr[j] < arr[j-1]) {
                NSNumber *temp = arr[j];
                arr[j] = arr[j - 1];
                arr[j - 1] = temp;
                j -= 1;
            } else {
                break;
            }
        }
    }
}


/**
 希尔算法
 */
- (void)shell_sort:(NSMutableArray *)arr {
    
    NSInteger gap = arr.count / 2;
    
    while (gap >= 1) {
        for (NSInteger i = gap; i < arr.count; i++) {
            NSInteger j = i;
            while (j > 0) {
                if (j >= gap && arr[j] < arr[j - gap]) {
                    NSNumber *temp = arr[j];
                    arr[j] = arr[j - gap];
                    arr[j - gap] = temp;
                    j -= gap;
                } else {
                    break;
                }
            }
        }
        // 缩短步长
        gap = gap / 2;
    }
}


/**
 快速排序
 */
- (void)quick_sort:(NSMutableArray *)arr first:(NSInteger)first last:(NSInteger)last
{
    if (first > last) {
        return;
    }
    NSInteger low = first;
    NSInteger high = last;
    NSNumber *mid_value = arr[first];
    
    while (high > low) {
        while (high > low && arr[high] >= mid_value) {
            high--;
        }
        arr[low] = arr[high];
        
        while (high > low && arr[low] < mid_value) {
            low++;
        }
        arr[high] = arr[low];
    }
    arr[high] = mid_value;
    
    [self quick_sort:arr first:first last:high - 1];
    
    [self quick_sort:arr first:high + 1 last:last];
}




@end
