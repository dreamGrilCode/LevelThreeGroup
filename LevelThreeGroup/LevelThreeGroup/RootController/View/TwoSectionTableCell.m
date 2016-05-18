//
//  TwoSectionTableCell.m
//  LevelThreeGroup
//
//  Created by mydical on 16/5/17.
//  Copyright © 2016年 yan. All rights reserved.
//

#import "TwoSectionTableCell.h"
#import "MyModel.h"

@interface TwoSectionTableCell ()

@property(nonatomic,weak)UIView  *bottonView;
@end

@implementation TwoSectionTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor yellowColor];
        btn.frame = CGRectMake(0, 0, screenW, viewH - 1);
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        self.title_Btn = btn;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void)setMyModel:(MyModel *)myModel{
    
    _myModel = myModel;
    [self.title_Btn setTitle:myModel.titles forState:UIControlStateNormal];
}
- (void)setBtnTag:(NSInteger)btnTag{

    _btnTag = btnTag;
    self.title_Btn.tag = btnTag;
}
- (void)onClick:(UIButton *)btn{
    
    if ([self.delegate_ respondsToSelector:@selector(twoSectionTableCellAddView:model:seletedBtn:)]) {
        [self.delegate_ twoSectionTableCellAddView:self model:self.myModel seletedBtn:btn];
    }
    
}
@end
