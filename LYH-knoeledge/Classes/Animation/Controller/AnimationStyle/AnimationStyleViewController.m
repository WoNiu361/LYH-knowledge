//
//  AnimationStyleViewController.m
//  LYH-knoeledge
//
//  Created by 庭好的 on 2018/10/11.
//  Copyright © 2018年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//

#import "AnimationStyleViewController.h"

@interface AnimationStyleViewController ()
{
    NSArray *_classNames;
}
@end

@implementation AnimationStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"动画类型";
    self.titleArray = @[@"CABasicAnimation", @"CAKeyframeAnimation", @"CAAnimationGroup", @"CATransition"];
    self.allArray = [NSMutableArray arrayWithArray:self.titleArray];
    _classNames = @[@"CABasicAnimationViewController", @"KeyFrameAnimationViewController", @"AnimationGroupViewController", @"TranslationViewController"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc = [[NSClassFromString(_classNames[indexPath.row]) alloc]init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
