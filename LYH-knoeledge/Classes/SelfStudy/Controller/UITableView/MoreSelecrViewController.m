//
//  MoreSelecrViewController.m
//  LYH-knoeledge
//
//  Created by 吕颜辉 on 17/1/8.
//  Copyright © 2017年 LYH-1140663172. All rights reserved.
//

#import "MoreSelecrViewController.h"
#import "SelectOrUnselectTableViewCell.h"
#import "SelectOrUselectModel.h"

@interface MoreSelecrViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *moreSelectTableView;
@property (nonatomic, strong) NSMutableArray *modelArray;
@property (nonatomic, weak)   UIButton *btn;
@property (nonatomic, weak)   UIView *bgView;
@property (nonatomic, assign) NSInteger index;
/** 用于标识选中第一行 */
@property (nonatomic,assign)  BOOL flag;
@end

@implementation MoreSelecrViewController

-(NSMutableArray *)modelArray{
    if (_modelArray == nil) {
        self.modelArray = [NSMutableArray array];
    }
    return _modelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"多选";
    self.view.backgroundColor = GlobalBackgroundColor;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self createBottomView];
    [self setupTableView];
    
    for (int i = 0; i < 25; i ++) {
        SelectOrUselectModel *model = [[SelectOrUselectModel alloc]init];
        model.titleString = [NSString stringWithFormat:@"这是第%d行",i + 1];
        [self.modelArray addObject:model];
//        if (i == 0) {
//            model.isSelect = YES;
//            NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0 ];
//            [self.moreSelectTableView selectRowAtIndexPath:index animated:YES scrollPosition:UITableViewScrollPositionTop];
//            self.btn.enabled = YES;
//        }
    }
    self.index = 0;
    
}

- (void)setupTableView{
    self.moreSelectTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kUIScreenWidth, kUIScreenHeight - kNavigationBarHeight - self.bgView.height) style:UITableViewStylePlain];
    self.moreSelectTableView.rowHeight = 50;
    self.moreSelectTableView.delegate = self;
    self.moreSelectTableView.dataSource = self;
    self.moreSelectTableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.moreSelectTableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectOrUnselectTableViewCell *cell = [SelectOrUnselectTableViewCell setupCellWithTableView:tableView];
    cell.model = self.modelArray[indexPath.row];
#pragma mark----默认选中第一行
    if (indexPath.row == 0) {
        if (self.flag) {
            [self.btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            self.btn.enabled = NO;
        }
        else{
            cell.model.isSelect = YES;
            [self.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            self.btn.enabled = YES;
            self.index = 1;
        }
    }
    cell.isChangePicture = cell.model.isSelect;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SelectOrUselectModel *model = self.modelArray[indexPath.row];
#pragma mark----这个判断用来控制底部button的字体颜色和是否可以点击
    if (model.isSelect) {
        self.index --;
        if (self.index != 0) {
            [self.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            self.btn.enabled = YES;
        }
        else{
            [self.btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            self.btn.enabled = NO;
        }
    }
    else{
       [self.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.index ++;
        self.btn.enabled = YES;
    }
    model.isSelect = !model.isSelect;
    
//    [self.moreSelectTableView reloadData];
    
    NSIndexPath *tmpIndexpath=[NSIndexPath indexPathForRow:indexPath.row inSection:0];
    if (indexPath.row == 0) {
        self.flag = YES;
    }
    [self.moreSelectTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:tmpIndexpath, nil] withRowAnimation:UITableViewRowAnimationFade];

    
}
#pragma mark-----底部的确定按钮
- (void)createBottomView{
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, kUIScreenHeight - 50 - kNavigationBarHeight, kUIScreenWidth, 50)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    self.bgView = bgView;
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kUIScreenWidth, 1)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [bgView addSubview:lineView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(kUIScreenWidth - bgView.height, CGRectGetMaxY(lineView.frame), bgView.height - lineView.height, bgView.height - 1);
    [btn setTitle:@"确定" forState:UIControlStateNormal];
    btn.enabled = NO;
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBottom:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:btn];
    self.btn = btn;
}

- (void)clickBottom:(UIButton *)sender{
    MyLog(@"%s",__func__);
}
@end
