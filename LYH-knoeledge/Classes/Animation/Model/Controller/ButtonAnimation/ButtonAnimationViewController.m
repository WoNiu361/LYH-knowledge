//
//  ButtonAnimationViewController.m
//  LYH-knoeledge
//
//  Created by LYH on 3/1/17.
//  Copyright © 2017年 LYH-1140663172. All rights reserved.
//

#import "ButtonAnimationViewController.h"
#import "UIButton+ShakeButton.h"

@interface ButtonAnimationViewController ()
@property (nonatomic, strong) UIButton *shakeButton;
@property (nonatomic, strong) UIView   *bgView;
@end

@implementation ButtonAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"按钮动画";
    self.view.backgroundColor = GlobalBackgroundColor;

    self.shakeButton = [UIButton createButtonWithFrmme:CGRectMake((kUIScreenWidth - kUIScreenWidth/3)/2, 0, kUIScreenWidth/3, 50) withTitle:@"shake动画" withTitleFont:15 withTitleColor:[UIColor whiteColor] withBackgroundColor:[UIColor blueColor] withTarget:self withAction:@selector(shakeButtonAnimation:)];
    [self.view addSubview:self.shakeButton];
    
    [self changeViewColor];

}

- (void)shakeButtonAnimation:(UIButton *)sender{
    [sender addShakeAnimation];
}

- (void)changeViewColor {
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.shakeButton.frame) + 10, kUIScreenWidth, kUIScreenHeight/2.0)];
    [self.view addSubview:self.bgView];
    
    // 颜色渐变
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bgView.bounds;
    
//    gradient.colors = @[(__bridge id)kUIColorFromRGB(0x4CA4FF).CGColor, (__bridge id)kUIColorFromRGB(0xC3E1FF).CGColor];
    gradient.colors = @[(__bridge id)[UIColor blackColor].CGColor,(__bridge id)[UIColor whiteColor].CGColor];
    gradient.locations  = @[@(0), @(1)];
    [self.bgView.layer addSublayer:gradient];

}

@end
