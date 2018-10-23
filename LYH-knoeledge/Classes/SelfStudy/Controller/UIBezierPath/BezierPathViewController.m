//
//  BezierPathViewController.m
//  LYH-knoeledge
//
//  Created by 庭好的 on 2018/10/12.
//  Copyright © 2018年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//

#import "BezierPathViewController.h"

@interface BezierPathViewController ()
@property (nonatomic, strong) NSArray<NSString *> *classNameArray;

@end

@implementation BezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"贝塞尔曲线知识";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.classNameArray = @[@"BasicBezierPathViewController"];
    self.titleArray = @[@"基础知识"];
    self.allArray = self.titleArray.mutableCopy;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *vc    = [[NSClassFromString(self.classNameArray[indexPath.row]) alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title                = [self.titleArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
