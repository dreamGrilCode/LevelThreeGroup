//
//  SectionHeaderView.m
//  LevelThreeGroup
//
//  Created by mydical on 16/5/17.
//  Copyright © 2016年 yan. All rights reserved.
//

#import "SectionHeaderView.h"
#import "MyModel.h"

@interface SectionHeaderView ()

@property(nonatomic,weak)UIButton *title_Btn;

@end
@implementation SectionHeaderView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor whiteColor];
        btn.frame = CGRectMake(0, 0, screenW   , viewH - 1);
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        self.title_Btn = btn;
        self.backgroundColor = [UIColor grayColor];
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

    if ([self.delegate_ respondsToSelector:@selector(sectionHeaderViewClickShowCell:model:selectedBtn:)]) {
        [self.delegate_ sectionHeaderViewClickShowCell:self model:self.myModel selectedBtn:btn];
    }
}
@end
