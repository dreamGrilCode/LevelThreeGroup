//
//  SectionHeaderView.h
//  LevelThreeGroup
//
//  Created by mydical on 16/5/17.
//  Copyright © 2016年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  MyModel,SectionHeaderView;

@protocol SectionHeaderViewDelegate <NSObject>

- (void)sectionHeaderViewClickShowCell:(SectionHeaderView *)view model:(MyModel *)myModel selectedBtn:(UIButton *)btn;

@end

@interface SectionHeaderView : UIView
@property(nonatomic,weak) MyModel *myModel;
@property(nonatomic,weak)id<SectionHeaderViewDelegate> delegate_;
@property(nonatomic,assign)NSInteger btnTag;

@end
