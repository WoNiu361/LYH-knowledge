//
//  SelfStudyViewController.m
//  LYH-knoeledge
//
//  Created by LYH on 23/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import "SelfStudyViewController.h"
#import "TextFieldViewController.h"
#import "StringViewController.h"
#import "TableViewController.h"
#import "DrawUIViewController.h"
#import "TableViewController.h"
#import "PopUpViewController.h"
#import "CollectionViewController.h"
#import "BezierPathViewController.h"

@interface SelfStudyViewController ()

@end

@implementation SelfStudyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"自学";这样子设置导航条标题，会影响tabbar上的标题
//    self.navigationItem.title = @"自学";这样子设置导航条标题，不会影响tabbar上的标题，如果想导航条标题和tabbar上的标题一致，那么tabbar设置好标题，就不要在设置标题就好了
    self.view.backgroundColor = GlobalBackgroundColor;
    self.allArray = [NSMutableArray arrayWithObjects:@"TextField",@"1",@"2",@"3",@"4",@"5",@"6",@"7", nil];
    self.titleArray = @[@"TextField",@"字符串属性",@"UI特别属性",@"collection知识",@"tableView",@"弹框提醒",@"贝塞尔曲线",@"7"];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TextFieldViewController *textFieldVC   = [[TextFieldViewController alloc]init];
    StringViewController *stringVC         = [[StringViewController alloc]init];
    DrawUIViewController *drawVC           = [[DrawUIViewController alloc]init];
    CollectionViewController *collectionVC =  [[CollectionViewController alloc]init];
    TableViewController *tableVC           = [[TableViewController alloc]init];
    PopUpViewController *popUpVC           = [[PopUpViewController alloc]init];
    BezierPathViewController *bezierPathVC = [[BezierPathViewController alloc] init];
    NSArray *VCArray = @[textFieldVC,stringVC,drawVC,collectionVC,tableVC,popUpVC,bezierPathVC];
    [self.navigationController pushViewController:VCArray[indexPath.row] animated:YES];
}

@end
