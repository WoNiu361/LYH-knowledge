//
//  SelectOneViewController.m
//  LYH-knoeledge
//
//  Created by LYH on 23/1/17.
//  Copyright © 2017年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//

#import "SelectOneViewController.h"
#import "SingleSelectTableViewCell.h"
#import "SelectOrUselectModel.h"

@interface SelectOneViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView     *selectOneTableView;
@property (nonatomic, strong) NSMutableArray *modelArray;
@end

@implementation SelectOneViewController

-(NSMutableArray *)modelArray{
    if (!_modelArray) {
        self.modelArray = [NSMutableArray array];
    }
    return _modelArray;
}
/*
 该功能，进入该界面，默认显示第一行被选中，点击其他的行，该行选中，上个选中的行取消。重复点击一个行，则会在选中和未选中之间切换。
 */
- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"单选";
    self.view.backgroundColor = GlobalTextLabelColor;
    
    self.selectOneTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.selectOneTableView.rowHeight = 60;
    self.selectOneTableView.delegate = self;
    self.selectOneTableView.dataSource = self;
    self.selectOneTableView.tableFooterView = [[UIView alloc]init];
    self.selectOneTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.selectOneTableView];
    
    for (int i = 0; i < 30; i ++) {
        SelectOrUselectModel *model = [[SelectOrUselectModel alloc]init];
        model.titleString = [NSString stringWithFormat:@"这是第%d行",i + 1];
        [self.modelArray addObject:model];
        if (i == 0) {
            model.isSelect = YES;
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SingleSelectTableViewCell *cell = [SingleSelectTableViewCell setupCellWithTableView:tableView];
    SelectOrUselectModel *model = self.modelArray[indexPath.row];
    cell.model = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    for (int j = 0; j < self.modelArray.count; j ++) {
        SelectOrUselectModel *model = self.modelArray[j];
//        if (j == indexPath.row) {
//            continue;//跳出本次循环，进入下次循环
//        }
//        model.isSelect = NO;
        if (j == indexPath.row) {
            
        }
        else{
            model.isSelect = NO;
        }
    }
    
    SelectOrUselectModel *model = self.modelArray[indexPath.row];
    model.isSelect = !model.isSelect;
    [self.selectOneTableView reloadData];
}

@end
