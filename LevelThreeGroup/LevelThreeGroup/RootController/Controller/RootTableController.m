//
//  RootTableController.m
//  LevelThreeGroup
//
//  Created by mydical on 16/5/16.
//  Copyright © 2016年 yan. All rights reserved.
//

#import "RootTableController.h"
#import "MyModel.h"
#import "SectionHeaderView.h"
#import "TwoSectionTableCell.h"
#import "LastSectionView.h"



@interface RootTableController ()<SectionHeaderViewDelegate,TwoSectionTableCellDelegate>

@property(nonatomic, strong)NSMutableArray *titleArr;
@property(nonatomic,assign)NSInteger selectedIndex;
@property(nonatomic,assign)NSInteger selectedToIndex;
@property(nonatomic,weak)LastSectionView *lastView;
@property(nonatomic,weak)TwoSectionTableCell *selectTwoView;
@property(nonatomic,assign)CGFloat cellH;
@end

@implementation RootTableController
- (NSMutableArray *)titleArr{

    if (!_titleArr) {
        NSArray *titleArr = @[@{
                                @"titles":@"oneSection1",
                                @"infos":@[
                                        @{
                                            @"titles":@"twoSection1",
                                            @"infos":@[@"threeSection1",
                                                       @"threeSection2",
                                                       @"threeSection3"
                                                       ]
                                            },
                                        @{
                                            @"titles":@"twoSection2",
                                            @"infos":@[@"threeSection1",
                                                       @"threeSection2",
                                                       @"threeSection3"
                                                       ]
                                            }
                                        ]
                                },
                              @{
                                  @"titles":@"oneSection2",
                                  @"infos":@[
                                          @{
                                              @"titles":@"twoSection1",
                                              @"infos":@[@"threeSection1",
                                                         @"threeSection2",
                                                         @"threeSection3"
                                                         ]
                                              },
                                          @{
                                              @"titles":@"twoSection2",
                                              @"infos":@[@"threeSection1",
                                                         @"threeSection2",
                                                         @"threeSection3"
                                                         ]
                                              },
                                          @{
                                              @"titles":@"twoSection3",
                                              @"infos":@[@"threeSection1",
                                                         @"threeSection2",
                                                         @"threeSection3",
                                                         @"threeSection4"
                                                         ]
                                              }
                                          ]
                                  }
                              ];
        MyModel *myModel = [[MyModel alloc] init];
        NSMutableArray *titles = [[NSMutableArray alloc] initWithArray:[myModel modelWithArr:titleArr]];
        _titleArr = titles;
    }
    return _titleArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"三级分组";
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.rowHeight = viewH;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 64, 0);
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(64, 0, 0, 0);
    
    self.selectedIndex = -1;
    self.selectedToIndex = -1;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.titleArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (self.selectedIndex == section) {
        
        MyModel *myModel = self.titleArr[self.selectedIndex];
        return myModel.infos.count;
    }else{
    
        return 0;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    MyModel *myModel = self.titleArr[section];
    SectionHeaderView *sectionView = [[SectionHeaderView alloc] initWithFrame:CGRectMake(0, 0,screenW, viewH)];
    sectionView.myModel = myModel;
    sectionView.delegate_ = self;
    sectionView.btnTag = section;
    return sectionView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return viewH;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (self.selectedToIndex == indexPath.row) {
        
        MyModel *myModel = self.titleArr[indexPath.section];
        MyModel *nextModel = myModel.infos[indexPath.row];
        self.cellH = viewH * nextModel.infos.count + viewH;
        
        return self.cellH;
        
    }else{
    
        return viewH;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *ID = @"twoCell";
    TwoSectionTableCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[TwoSectionTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }

    MyModel *myModel = self.titleArr[self.selectedIndex];
    MyModel *nextModel = myModel.infos[indexPath.row];
    cell.myModel = nextModel;
    cell.delegate_ = self;
    cell.tag = indexPath.row;
    if (self.selectedToIndex == indexPath.row && self.selectedIndex == indexPath.section && self.cellH > viewH) {
        
        LastSectionView *lastView = [[LastSectionView alloc] initWithFrame:CGRectMake(0, viewH, screenW, viewH * nextModel.infos.count)];
        lastView.someArr = nextModel.infos;
        [cell addSubview:lastView];
        self.lastView = lastView;
    }
    return cell;
    
}

#pragma mark - SectionHeaderViewDelegate
- (void)sectionHeaderViewClickShowCell:(SectionHeaderView *)view model:(MyModel *)myModel selectedBtn:(UIButton *)btn{

    if (btn.tag != self.selectedIndex) {
        
        self.selectedIndex = btn.tag;
        self.selectedToIndex = -1;
        [self.lastView removeFromSuperview];
    }else{
    
        self.selectedIndex = -1;
        self.selectedToIndex = -1;
        [self.lastView removeFromSuperview];
    }
    [self.tableView reloadData];
    
}
#pragma  mark - TwoSectionTableCellDelegate
- (void)twoSectionTableCellAddView:(TwoSectionTableCell *)cell model:(MyModel *)myModel seletedBtn:(UIButton *)selectBtn{

    if (cell.tag == self.selectedToIndex) {
        
        [self.lastView removeFromSuperview];
        self.selectedToIndex = - 1;
        
    }else{
    
        self.selectTwoView = cell;
        self.selectedToIndex = cell.tag;
        [self.lastView removeFromSuperview];
        
    }
    [self.tableView reloadData];
}
@end
