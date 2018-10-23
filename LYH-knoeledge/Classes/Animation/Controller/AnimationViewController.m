//
//  AnimationViewController.m
//  LYH-knoeledge
//
//  Created by LYH on 23/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import "AnimationViewController.h"
#import "ButtonAnimationViewController.h"
#import "GradientBakgroundViewController.h"
#import "AnimationStyleViewController.h"

@interface AnimationViewController ()

@property (nonatomic, weak)   UIView   *lineView;
@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"动画";
    self.view.backgroundColor = GlobalBackgroundColor;
    self.allArray = [NSMutableArray arrayWithObjects:@"shake动画",@"",@"",@"",@"", nil];
    self.titleArray = @[@"shake动画",@"背景色渐变",@"动画类型",@"",@""];
     
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ButtonAnimationViewController *buttonVC = [[ButtonAnimationViewController alloc]init];
    GradientBakgroundViewController *gradientVC = [[GradientBakgroundViewController alloc]init];
    AnimationStyleViewController *animationVC = [[AnimationStyleViewController alloc] init];
    NSArray *vcArray = @[buttonVC,gradientVC,animationVC,buttonVC,buttonVC];
    [self.navigationController pushViewController:vcArray[indexPath.row] animated:YES];
}

@end
