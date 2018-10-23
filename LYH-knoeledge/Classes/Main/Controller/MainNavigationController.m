//
//  MainNavigationController.m
//  LYH-knoeledge
//
//  Created by LYH on 23/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)initialize{
    [self setNavigationItemTheme];
    [self setNavigationBarTheme];
}

+ (void)setNavigationItemTheme{
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    NSMutableDictionary *textAttributes = [NSMutableDictionary dictionary];
    textAttributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [barItem setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
    
//    [barItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
}

+ (void)setNavigationBarTheme{
    //取出设置主题对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    //设置导航栏背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg"] forBarMetrics:UIBarMetricsDefault];
    
    //设置导航栏背景颜色
    navBar.tintColor = [UIColor whiteColor];
    
    //设置导航栏标题颜色和字体大小
    NSMutableDictionary *textAttributes = [NSMutableDictionary dictionary];
    textAttributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    [navBar setTitleTextAttributes:textAttributes];
    
    //去除阴影
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowOffset = CGSizeZero;
    textAttributes[NSShadowAttributeName] = shadow;
    navBar.shadowImage = [[UIImage alloc]init];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    if (viewController.navigationItem.leftBarButtonItem == nil && [self.viewControllers count] > 0){
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigation_back"] style:UIBarButtonItemStylePlain target:self action:@selector(popself)];
        viewController.navigationItem.leftBarButtonItem = backItem;
    }
    self.interactivePopGestureRecognizer.delegate = (id)self;
    
    [super pushViewController:viewController animated:animated];
}

- (void)popself{
    [self.view endEditing:YES];
    [self popViewControllerAnimated:YES];
}

//设置状态栏的颜色
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
