//
//  PopUpViewController.m
//  LYH-knoeledge
//
//  Created by 吕颜辉 on 2017/6/24.
//  Copyright © 2017年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//

#import "PopUpViewController.h"
#import "EPInfoAlert.h"

@interface PopUpViewController ()
@property (nonatomic, strong) UIButton *popButton;

@end

@implementation PopUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"弹框提醒";
    self.view.backgroundColor = GlobalBackgroundColor;
    
    [self.view addSubview:self.popButton];
}

-(UIButton *)popButton {
    if (_popButton == nil   ) {
        _popButton = [UIButton createButtonWithFrmme:CGRectMake(kUIScreenWidth/4.0, 0, kUIScreenWidth/4.0, kSpaceH(50)) withTitle:@"弹框提醒" withTitleFont:15 withTitleColor:[UIColor blackColor] withBackgroundColor:[UIColor redColor] withTarget:self withAction:@selector(popUpAlert:)];
        
    }
    return _popButton;
}

- (void)popUpAlert:(UIButton *)sender {
    [EPInfoAlert showInfo:@"弹框提醒" inView:[UIApplication sharedApplication].keyWindow];
//    [EPInfoAlert showInfo:@"妹子，哥来了" infoFont:[UIFont systemFontOfSize:15] bgColor:[[UIColor blackColor]CGColor] inView:self.view vertical:.5];
//    [EPInfoAlert showOperationFailInView:self.view];
}

@end
