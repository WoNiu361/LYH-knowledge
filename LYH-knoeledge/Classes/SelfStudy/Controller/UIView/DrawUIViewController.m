//
//  DrawUIViewController.m
//  LYH-knoeledge
//
//  Created by LYH on 3/1/17.
//  Copyright © 2017年 LYH-1140663172. All rights reserved.
//

#import "DrawUIViewController.h"
#import "LineView.h"

@interface DrawUIViewController ()
@property (nonatomic, weak)   UIView   *lineView;
@end

@implementation DrawUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"UI特别的知识点";
    self.view.backgroundColor = GlobalBackgroundColor;
    
    LineView *lineView = [[LineView alloc]initWithFrame:CGRectMake(0,  5, kUIScreenWidth, 50)];
    [self.view addSubview:lineView];
    self.lineView = lineView;
    
    [self enlargeButtonClickArea];

}
#pragma mark - 扩大按钮的点击区域
- (void)enlargeButtonClickArea {
    
    UIView *vi = [[UIView alloc] initWithFrame:CGRectMake(0, 60, 100, 40)];
    vi.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:vi];
    
    UIButton *btn = [UIButton createButtonWithFrmme:CGRectMake(0, 0, 50, vi.height) withTitle:@"扩大点击区域" withTitleFont:11 withTitleColor:[UIColor whiteColor] withBackgroundColor:[UIColor greenColor] withTarget:self withAction:@selector(clickButton:)];
    [btn configureEnlargeAreaWithTop:0 left:0 bottom:0 right:50];
    [vi addSubview:btn];
}

- (void)clickButton:(UIButton *)sender {
    MyLog(@"%s",__func__);
}

@end
