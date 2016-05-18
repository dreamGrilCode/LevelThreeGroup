//
//  LastSectionView.m
//  LevelThreeGroup
//
//  Created by mydical on 16/5/17.
//  Copyright © 2016年 yan. All rights reserved.
//

#import "LastSectionView.h"

@implementation LastSectionView

- (void)setSomeArr:(NSArray *)someArr{

    _someArr = someArr;
    for (int i = 0; i < someArr.count; i ++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor redColor];
        [btn setTitle:someArr[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickToNext:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(0, viewH * i, screenW, viewH - 1);
        btn.tag = i;
        [self addSubview:btn];
    }
}
- (void)clickToNext:(UIButton *)btn{
    
    NSLog(@"其他处理--最后一级");
}
@end
