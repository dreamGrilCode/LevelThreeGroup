//
//  MyModel.h
//  LevelThreeGroup
//
//  Created by mydical on 16/5/16.
//  Copyright © 2016年 yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject
@property(nonatomic,strong)NSString *titles;
@property(nonatomic,strong)NSArray *infos;

- (NSArray *)modelWithArr:(NSArray *)titlesArr;

@end
