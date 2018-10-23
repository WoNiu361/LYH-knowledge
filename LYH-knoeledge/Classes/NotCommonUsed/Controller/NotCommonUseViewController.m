//
//  NotCommonUseViewController.m
//  LYH-knoeledge
//
//  Created by LYH on 23/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import "NotCommonUseViewController.h"
#import "PictureZoomView.h"
#import "NotCommonUseTableViewCell.h"
#import "NotCommonUseModel.h"

#import "SelectOrUnselectViewController.h"
#import "SmallKnowledgeViewController.h"
#import "ZoomPictureViewController.h"
#import "GCDViewController.h"
#import "MyUIAlertController.h"

@interface NotCommonUseViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 下拉放大图片的view */
@property (nonatomic, strong) PictureZoomView *zoomView;
@property (nonatomic, strong) UITableView     *notCommonUseTableView;
/** cell中的小图片数组 */
@property (nonatomic, strong) NSArray         *pictureArray;
/** cell中的标题数组 */
@property (nonatomic, strong) NSArray         *titleArray;
/** model 数组 */
@property (nonatomic, strong) NSMutableArray  *modelArray;
@end

@implementation NotCommonUseViewController

-(NSArray *)pictureArray{
    if (_pictureArray == nil) {
        self.pictureArray = @[@"destoryList",@"memberCustomer",@"payBackList",@"paySelfList",@"underLineList"];
    }
    return _pictureArray;
}

-(NSArray *)titleArray{
    if (_titleArray == nil) {
        self.titleArray = @[@"button和tableView反选",@"小知识点",@"隐藏导航栏下面的线",@"GCD",@"系统弹框提示"];
    }
    return _titleArray;
}

-(NSMutableArray *)modelArray{
    if (_modelArray == nil) {
        self.modelArray = [NSMutableArray array];
    }
    return _modelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"不常用";
    self.view.backgroundColor = GlobalBackgroundColor;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setupModelWithData];
    //此方法的下拉放大图片，下面俩句代码的顺序不能反了
    [self.view addSubview:self.notCommonUseTableView];
    [self.view addSubview:self.zoomView];
}
#pragma mark------model 里面添加数据
- (void)setupModelWithData{
    for (int i = 0; i < self.pictureArray.count; i ++) {
        NotCommonUseModel *model = [[NotCommonUseModel alloc]init];
        model.pictureString = self.pictureArray[i];
        model.titleString = self.titleArray[i];
        [self.modelArray addObject:model];
    }
}
#pragma mark----下拉图片放大的view
-(PictureZoomView *)zoomView{
    if (_zoomView == nil) {
        self.zoomView = [[PictureZoomView alloc]initWithFrame:CGRectMake(0, 0, kUIScreenWidth, 150)];
    }
    return _zoomView;
}

-(UITableView *)notCommonUseTableView{
    if (_notCommonUseTableView == nil) {
        self.notCommonUseTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kUIScreenWidth, kUIScreenHeight) style:UITableViewStylePlain];
        self.notCommonUseTableView.backgroundColor = GlobalBackgroundColor;
        self.notCommonUseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.notCommonUseTableView.delegate = self;
        self.notCommonUseTableView.dataSource = self;
        self.notCommonUseTableView.rowHeight = 50;
        self.notCommonUseTableView.tableFooterView = [[UIView alloc]init];
        //设置表格的内容偏移量，让内容偏移量的高度和图片的高度保持一致。给人的一种感觉就是图片加在了表格上
        self.notCommonUseTableView.contentInset = UIEdgeInsetsMake(150, 0, 0, 0);
    }
    return _notCommonUseTableView;
}

#pragma mark----UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NotCommonUseTableViewCell *cell = [NotCommonUseTableViewCell setupCellWithTableView:tableView];
    cell.model = self.modelArray[indexPath.row];
    return cell;
}

#pragma mark----UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SelectOrUnselectViewController *selectOrUnselectVC = [[SelectOrUnselectViewController alloc]init];
    SmallKnowledgeViewController *smallVC = [[SmallKnowledgeViewController alloc]init];
    ZoomPictureViewController *zoomVC = [[ZoomPictureViewController alloc]init];
    GCDViewController *gcdVC = [[GCDViewController alloc]init];
    MyUIAlertController *alertVC = [[MyUIAlertController alloc]init];
    NSArray *vcArray = @[selectOrUnselectVC,smallVC,zoomVC,gcdVC,alertVC];
    [self.navigationController pushViewController:vcArray[indexPath.row] animated:YES];
}

#pragma mark----下拉图片放大
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat y  = scrollView.contentOffset.y + 150;//y == 0
    CGRect rect = self.zoomView.frame;
    if (y <= 0) {
        rect.size.height = 150 + fabs(y);//fabs 取绝对值
    }
    rect.origin.y = y <= 0 ? 0 : - fabs(y);
    self.zoomView.frame = rect;
    
}
@end
