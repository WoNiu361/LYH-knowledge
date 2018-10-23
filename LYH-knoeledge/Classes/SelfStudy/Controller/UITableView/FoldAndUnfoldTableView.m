//
//  FoldAndUnfoldTableView.m
//  LYH-knoeledge
//
//  Created by 吕颜辉 on 17/1/8.
//  Copyright © 2017年 LYH-1140663172. All rights reserved.
//

#import "FoldAndUnfoldTableView.h"
#import "SelectOrUnselectTableViewCell.h"
#import "SelectOrUselectModel.h"

@interface FoldAndUnfoldTableView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *foldTableView;
@property (nonatomic, strong) NSMutableArray *headModelArray;
@end

@implementation FoldAndUnfoldTableView

-(NSMutableArray *)headModelArray{
    if (_headModelArray == nil) {
        self.headModelArray = [NSMutableArray array];
    }
    return _headModelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"折合表";
    self.view.backgroundColor = GlobalBackgroundColor;
    [self setupTableView];

    for (int i = 0; i < 6; i ++) {
        SelectOrUselectModel *model = [[SelectOrUselectModel alloc]init];
        model.titleString = [NSString stringWithFormat:@"这是第%ld行",(long)i];
        model.headTitle   = [NSString stringWithFormat:@"这是第%ld个区头",(long)i + 1];
//        model.isUnfold = NO;
        [self.headModelArray addObject:model];
    }
}

- (void)setupTableView{
    self.foldTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kUIScreenWidth, kUIScreenHeight - kNavigationBarHeight) style:UITableViewStyleGrouped];
    self.foldTableView.rowHeight = 50;
    self.foldTableView.delegate = self;
    self.foldTableView.dataSource = self;
    self.foldTableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.foldTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.headModelArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{//[self.titleArray[section] count];
    SelectOrUselectModel *model = self.headModelArray[section];
//    if (model.isUnfold) {
//        return 4;
//    }
//    else{
//        return 0;
//    }
    
    return model.isUnfold ? 4 : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectOrUnselectTableViewCell *cell = [SelectOrUnselectTableViewCell setupCellWithTableView:tableView];
    SelectOrUselectModel *model = self.headModelArray[indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIControl *headControl = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, kUIScreenWidth, 40)];
    headControl.backgroundColor = RandomColor;
    [headControl addTarget:self action:@selector(whetherUnflod:) forControlEvents:UIControlEventTouchUpInside];
    headControl.tag = 10 + section;
    
    SelectOrUselectModel *model = self.headModelArray[section];
    UILabel *headLabel = [UILabel createLabelWithText:model.headTitle withTexrtFont:15 withTextColor:[UIColor whiteColor] withFrame:headControl.bounds withTextAlignment:NSTextAlignmentCenter fontWeight:UIFontWeightMedium];
    [headControl addSubview:headLabel];
    
    return headControl;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (void)whetherUnflod:(UIControl *)sender{
    MyLog(@"whetherUnflod---%ld",sender.tag);
    SelectOrUselectModel *model = self.headModelArray[sender.tag - 10];
    if (model.isUnfold) {
        model.isUnfold = NO;
    }
    else{
        model.isUnfold = YES;
        for (SelectOrUselectModel *mod in self.headModelArray) {
            if (![model isEqual:mod]) {
                mod.isUnfold = NO;
            }
        }
    }
    
    [self.foldTableView reloadData];
    MyLog(@"0-0-0-0------%u",arc4random()%10);

}

@end
