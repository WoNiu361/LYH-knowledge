//
//  GradientBakgroundViewController.m
//  LYH-knoeledge
//
//  Created by 吕颜辉 on 2017/6/25.
//  Copyright © 2017年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//

#import "GradientBakgroundViewController.h"

@interface GradientBakgroundViewController ()
@property (nonatomic, strong) UIView *bgView;

@end

@implementation GradientBakgroundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.title = @"背景色渐变";
    self.view.backgroundColor = GlobalBackgroundColor;
    
    _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kUIScreenWidth, kUIScreenHeight - kNavigationBarHeight)];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = _bgView.bounds;
    gradient.colors = @[(__bridge id)kUIColorFromRGB(0x4CA4FF).CGColor, (__bridge id)kUIColorFromRGB(0xC3E1FF).CGColor];
    gradient.locations  = @[@(0), @(1)];
    [_bgView.layer addSublayer:gradient];
    [self.view addSubview:_bgView];
}


@end
