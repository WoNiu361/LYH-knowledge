//
//  ZoomPictureViewController.m
//  LYH-knoeledge
//
//  Created by LYH on 27/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import "ZoomPictureViewController.h"
#import "PictureZoomView.h"
#import "CustomerNavigationBarView.h"

#define kHeaderViewHeight kUIScreenWidth * 420.0 / 720.0
@interface ZoomPictureViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 下拉放大图片的view */
@property (nonatomic, strong) PictureZoomView *zoomView;
@property (nonatomic, strong) UITableView     *zoomTableView;
/** cell中的小图片数组 */
@property (nonatomic, strong) NSArray         *pictureArray;
/** cell中的标题数组 */
@property (nonatomic, strong) NSArray         *titleArray;
/** 自定义导航栏 */
@property (nonatomic, strong) CustomerNavigationBarView *barView;
@end
static NSString *const zoomID = @"ZoomPictureViewController";
@implementation ZoomPictureViewController

-(NSArray *)pictureArray{
    if (_pictureArray == nil) {
        self.pictureArray = @[@"destoryList",@"memberCustomer",@"payBackList",@"paySelfList",@"underLineList"];
    }
    return _pictureArray;
}

-(NSArray *)titleArray{
    if (_titleArray == nil) {
        self.titleArray = @[@"1111",@"22222",@"666666",@"33",@"44"];
    }
    return _titleArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = GlobalBackgroundColor;
    self.fd_prefersNavigationBarHidden = YES;
    
    //下面这句代码，是从顶部0位置开始布局，而不是从状态栏下面开始布局
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.zoomTableView];
    [self.zoomTableView addSubview:self.zoomView];
    
    [self.view addSubview:self.barView];
    [self.view bringSubviewToFront:self.barView];

}
#pragma mark------自定义导航栏
-(CustomerNavigationBarView *)barView{
    if (_barView == nil) {
        self.barView = [[CustomerNavigationBarView alloc]initWithFrame:CGRectMake(0, 0, kUIScreenWidth, kNavigationBarHeight)];
    }
    return _barView;
}

#pragma mark----下拉图片放大的view
-(PictureZoomView *)zoomView{
    if (_zoomView == nil) {
        self.zoomView = [[PictureZoomView alloc]initWithFrame:CGRectMake(0, -150, kUIScreenWidth, 150)];
        self.zoomView.changeLocation = YES;
    }
    return _zoomView;
}

-(UITableView *)zoomTableView{
    if (_zoomTableView == nil) {
        self.zoomTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kUIScreenWidth, kUIScreenHeight) style:UITableViewStylePlain];
        self.zoomTableView.backgroundColor = GlobalBackgroundColor;
        self.zoomTableView.delegate = self;
        self.zoomTableView.dataSource = self;
        self.zoomTableView.rowHeight = 45;
        self.zoomTableView.tableFooterView = [[UIView alloc]init];
        /*
         设置表格的内容偏移量，让图片所在的view加在表格上，就是把图片也当成表格的内容，这是需要把图片所在的view的y值设置为负的view的高度。
         */
        self.zoomTableView.contentInset = UIEdgeInsetsMake(150, 0, 0, 0);
    }
    return _zoomTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:zoomID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:zoomID];
    }
    
    cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"enterInto"]];
    cell.imageView.image = [UIImage imageNamed:self.pictureArray[indexPath.row]];
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}

#pragma mark------UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//这个150数字，不能用self.zoomView.height代替，因为滑动时，self.zoomView.height已经改变了，必须用固定的数字
    CGFloat y = scrollView.contentOffset.y + 150;
    CGRect rect = self.zoomView.frame;
    if (y <= 0) {
        rect.origin.y = -150 + y;
        rect.size.height = 150 + fabs(y);
    }
    else{
        //透明度的变化是
        self.barView.backgroundColor = RGBAColor(76, 160, 252, y * 10 / kHeaderViewHeight);
        if (y > kHeaderViewHeight) {
            self.barView.backgroundColor = RGBColor(76, 160, 252);
        }
    }
    self.zoomView.frame = rect;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y == 0) {
        self.barView.backgroundColor = RGBAColor(0, 0, 0, 0);
    }
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
