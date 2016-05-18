//
//  MyModel.m
//  LevelThreeGroup
//
//  Created by mydical on 16/5/16.
//  Copyright © 2016年 yan. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel

- (NSArray *)modelWithArr:(NSArray *)titlesArr{

    // 具体数据 需要 具体分析
 
    
    NSMutableArray *allArr = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in titlesArr) {
        MyModel *myModel = [[MyModel alloc] init];
        myModel.titles = dict[@"titles"];
        
        NSArray *infos = dict[@"infos"];
        NSMutableArray *nextArr = [[NSMutableArray alloc] init];
        for (NSDictionary *nextDict in infos) {
            MyModel *nextModel = [[MyModel alloc] init];
            [nextModel setValuesForKeysWithDictionary:nextDict];
            [nextArr addObject:nextModel];
        }
        myModel.infos = nextArr;
        [allArr addObject:myModel];
    }
    return allArr;
}

@end
