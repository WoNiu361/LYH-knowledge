//
//  CollectionViewController.m
//  LYH-knoeledge
//
//  Created by 庭好的 on 2018/10/12.
//  Copyright © 2018年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//

#import "CollectionViewController.h"
#import "MoveCollectionViewCell.h"
#import "CustomCollectionViewFlowLayoutVC.h"

@interface CollectionViewController ()
@property (nonatomic, strong) NSArray<NSString *> *vcNameArray;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"collectionView知识";
    self.titleArray = @[@"移动collectionViewCell",@"自定义UICollectionViewFlowLayout"];
    self.allArray = [NSMutableArray arrayWithArray:self.titleArray];
    self.vcNameArray = @[@"MoveCollectionViewCell",@"CustomCollectionViewFlowLayoutVC"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc = [[NSClassFromString(self.vcNameArray[indexPath.row]) alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = self.titleArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
