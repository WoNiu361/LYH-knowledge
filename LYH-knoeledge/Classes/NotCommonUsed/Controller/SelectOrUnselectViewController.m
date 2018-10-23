//
//  SelectOrUnselectViewController.m
//  LYH-knoeledge
//
//  Created by 吕颜辉 on 16/12/25.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import "SelectOrUnselectViewController.h"
#import "TwoButtonView.h"

@interface SelectOrUnselectViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UIButton  *button;
@property (nonatomic, strong) UIView    *lineView;
@property (nonatomic, weak)   UIView    *backgroundView;

@property (nonatomic, strong) TwoButtonView *buttonView;


@property (nonatomic, weak) UITableView *tableView;
/** 记录上次点击的那一行 */
@property (nonatomic,assign) NSInteger selectIndexPathRow;

@end

@implementation SelectOrUnselectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"单元格反选";
    self.view.backgroundColor = GlobalBackgroundColor;
    
    [self crerateButton];
    [self.view addSubview:self.buttonView];
    [self createTableView];
    
}

/**
 *  创建button
 *  懒加载创建多个button，是不行的，因为懒加载每次创建button，就会把前面的已经创建好的button给覆盖掉，此时self.view 还没有创建出来，而且创建出来的额button内存地址是一样的，只创建一次，return出来最后的button，
 */
- (void)crerateButton{
    NSArray *titleArray = @[@"香蕉",@"苹果",@"栗子",@"桃子"];
    
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kUIScreenWidth, 64)];
    backgroundView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:backgroundView];
    self.backgroundView = backgroundView;
    
    for (int i = 0; i < titleArray.count; i ++) {
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.frame = CGRectMake(self.view.frame.size.width/titleArray.count * i, 0, self.view.frame.size.width/titleArray.count, 64);
        [self.button setTitle:titleArray[i] forState:UIControlStateNormal];
        [self.button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        self.button.tag  = 100 + i;
        [self.button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [backgroundView addSubview:self.button];
        if (i == 0) {
            self.button.selected = YES;
            self.lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.button.frame.size.height - 2, self.button.frame.size.width, 2)];
            self.lineView.backgroundColor = [UIColor blueColor];
            [self.button addSubview:self.lineView];
        }
    }
}

- (void)buttonClick:(UIButton *)sender{
    self.lineView.frame = CGRectMake((sender.tag - 100) * self.button.frame.size.width, self.button.frame.size.height - 2 , self.button.frame.size.width, 2);
    for (UIButton *btn in self.backgroundView.subviews) {
        btn.selected = NO;
    }
    if (sender.tag) {
        sender.selected = YES;
    }
}
#pragma mark-----下划线位于button中间位置
-(TwoButtonView *)buttonView{
    if (_buttonView == nil) {
        self.buttonView = [[TwoButtonView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.backgroundView.frame) + 10, self.view.frame.size.width, 50)];
        self.buttonView.clickBlock = ^(NSInteger integer){
            NSLog(@"-------%zd",integer);
        };
    }
    return _buttonView;
}


/**
 *  创建表格
 */
- (void)createTableView{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.buttonView.frame) + 10, kUIScreenWidth, kUIScreenHeight - 64) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const identify = @"identify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.selectIndexPathRow == indexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //选中的cell打上对勾
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    //取消上一次选中的cell
    UITableViewCell *lastSelectedCell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.selectIndexPathRow inSection:0]];
    lastSelectedCell.accessoryType = UITableViewCellAccessoryNone;
    
    self.selectIndexPathRow = indexPath.row;
}

@end
