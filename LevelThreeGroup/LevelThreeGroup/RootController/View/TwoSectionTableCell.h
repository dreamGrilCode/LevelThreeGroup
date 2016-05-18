//
//  TwoSectionTableCell.h
//  LevelThreeGroup
//
//  Created by mydical on 16/5/17.
//  Copyright © 2016年 yan. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MyModel,TwoSectionTableCell;

@protocol TwoSectionTableCellDelegate <NSObject>

- (void)twoSectionTableCellAddView:(TwoSectionTableCell *)cell model:(MyModel *)myModel seletedBtn:(UIButton *)selectBtn;

@end

@interface TwoSectionTableCell : UITableViewCell
@property(nonatomic,strong) MyModel *myModel;
@property(nonatomic,weak)id<TwoSectionTableCellDelegate> delegate_;
@property(nonatomic,assign)NSInteger btnTag;
@property(nonatomic,strong) NSArray *someModelArr;
@property(nonatomic,weak)UIButton *title_Btn;
@end
