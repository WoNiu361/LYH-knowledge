//
//  TableViewController.m
//  LYH-knoeledge
//
//  Created by 吕颜辉 on 17/1/8.
//  Copyright © 2017年 LYH-1140663172. All rights reserved.
//

#import "TableViewController.h"
#import "MoreSelecrViewController.h"
#import "FoldAndUnfoldTableView.h"
#import "SingleSelectViewController.h"
#import "SelectOneViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"TableView知识";
    self.view.backgroundColor = GlobalBackgroundColor;
    self.titleArray = @[@"多选",@"折合表",@"单选",@"单选"];
    self.allArray = [NSMutableArray arrayWithObjects:@"多选",@"折合表",@"单选",@"单选", nil];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MoreSelecrViewController *selectVC   = [[MoreSelecrViewController alloc]init];
    FoldAndUnfoldTableView *foldVC       = [[FoldAndUnfoldTableView alloc]init];
    SingleSelectViewController *singleVC = [[SingleSelectViewController alloc]init];
    SelectOneViewController *oneVC       = [[SelectOneViewController alloc]init];
    NSArray *vcArray = @[selectVC,foldVC,singleVC,oneVC];
    [self.navigationController pushViewController:vcArray[indexPath.row] animated:YES];
}

@end
