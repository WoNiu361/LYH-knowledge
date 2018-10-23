//
//  SingleSelectViewController.m
//  LYH-knoeledge
//
//  Created by LYH on 20/1/17.
//  Copyright © 2017年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//

#import "SingleSelectViewController.h"
#import "SingleSelectTableViewCell.h"
#import "SelectOrUselectModel.h"

@interface SingleSelectViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *singleTableView;
@property (nonatomic, strong) NSMutableArray *modelArray;
@end

@implementation SingleSelectViewController

-(NSMutableArray *)modelArray{
    if (_modelArray == nil) {
        self.modelArray = [NSMutableArray array];
    }
    return _modelArray;
}
/*
 该功能：进入该界面，默认选中第一行，再点击其他的行，选中该行，上一行选中的消失，并且把你选中的哪一行保存起来，当你再次进入该界面，则显示你上次点击的行
 */
- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"单选";
    self.view.backgroundColor = GlobalBackgroundColor;
    
    self.singleTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.singleTableView.rowHeight = 60;
    self.singleTableView.delegate = self;
    self.singleTableView.dataSource = self;
    self.singleTableView.tableFooterView = [[UIView alloc]init];
    self.singleTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.singleTableView];
    
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
    if ([kUserDefaults integerForKey:@"indexPath.row"]  == indexPath.row) {
        model.isSelect = YES;
    }
    else{
        model.isSelect = NO;
    }
    cell.model = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SelectOrUselectModel *selectedModel = self.modelArray[indexPath.row];
    selectedModel.isSelect = NO;
    for (SelectOrUselectModel *model in self.modelArray) {
        if ([selectedModel isEqual:model]) {
            model.isSelect = YES;
        }
        else{
            model.isSelect = NO;
        }
    }
    
    [kUserDefaults setInteger:indexPath.row forKey:@"indexPath.row"];
    [kUserDefaults synchronize];
    /* 
     这种单选保存的功能，要保存你点击的哪一行，比较简单易行
     @(selectedModel.isSelect) 是对象类型，当isSelect = YES时，@(selectedModel.isSelect)为 1，否则为0.  @(selectedModel.isSelect)是NSNumber类型
     */
    
    [self.singleTableView reloadData];
}

@end
