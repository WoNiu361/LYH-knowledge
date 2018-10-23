//
//  MainTabBarController.m
//  LYH-knoeledge
//
//  Created by LYH on 23/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationController.h"

#import "AnimationViewController.h"
#import "SelfStudyViewController.h"
#import "NotCommonUseViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupTabBar];
    [self addChildViewControllers];

}

- (void)setupTabBar{
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:RGBColor(90, 90, 90)
                                                        } forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSForegroundColorAttributeName:RGBColor(220, 172, 65)
                                                        } forState:UIControlStateSelected];
}

- (void)addChildViewControllers{
    AnimationViewController *animationVC = [[AnimationViewController alloc]init];
    [self addChildViewController:animationVC withImageName:@"tabbar_home" withTitle:@"动画" ];
    
    SelfStudyViewController *selfStudyVC = [[SelfStudyViewController alloc]init];
    [self addChildViewController:selfStudyVC withImageName:@"main_tabbar_mine" withTitle:@"自学"];
    
    NotCommonUseViewController *notCommonUseVC = [[NotCommonUseViewController alloc]init];
    [self addChildViewController:notCommonUseVC withImageName:@"tabbar_mine" withTitle:@"不常用"];
}

- (void)addChildViewController:(UIViewController *)childController withImageName:(NSString *)icon withTitle:(NSString *)title{
    
    UITabBarItem *item = childController.tabBarItem;
    childController.title = title;
    
    NSString *selectIcon = [icon stringByAppendingString:@"_selected"];
    UIImage *iconImage = [[UIImage imageNamed:icon] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectIconImage = [[UIImage imageNamed:selectIcon] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    item.image = iconImage;
    item.selectedImage = selectIconImage;
    
    MainNavigationController *nav = [[MainNavigationController alloc]initWithRootViewController:childController];
    [self addChildViewController:nav];
}

@end
