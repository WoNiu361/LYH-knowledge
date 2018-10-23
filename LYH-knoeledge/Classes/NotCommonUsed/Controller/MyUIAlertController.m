//
//  MyUIAlertController.m
//  LYH-knoeledge
//
//  Created by 吕颜辉 on 17/3/3.
//  Copyright © 2017年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//

#import "MyUIAlertController.h"

@interface MyUIAlertController ()

@end

@implementation MyUIAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"系统弹框提示";
    self.view.backgroundColor = GlobalBackgroundColor;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 10, 100, 100);
    btn.centerX = self.view.centerX/2;
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(popupAlertView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 10, 100, 100);
    button.centerX = self.view.centerX * 3 / 2 ;
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(showAlertView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)popupAlertView{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提醒" message:@"您的假期将要结束，请充值" preferredStyle:UIAlertControllerStyleAlert];
    
    [self setTitleRichPropertyWithController:alertController withTitle:@"温馨提醒"];
    [self setRichStringPropertyWithViewController:alertController withMessage:@"您的假期将要结束，请充值"];
    
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [cancleAction setValue:[UIColor orangeColor] forKey:@"_titleTextColor"];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [sureAction setValue:[UIColor purpleColor] forKey:@"_titleTextColor"];
    [alertController addAction:sureAction];
    [alertController addAction:cancleAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)setTitleRichPropertyWithController:(UIViewController *)vc withTitle:(NSString *)title{
    NSMutableAttributedString *alertAttributeStr = [[NSMutableAttributedString alloc]initWithString:title];
    [alertAttributeStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor orangeColor]} range:NSMakeRange(0, 4)];
    [vc setValue:alertAttributeStr forKey:@"attributedTitle"];
}

- (void)setRichStringPropertyWithViewController:(UIViewController *)vc withMessage:(NSString *)message{
    NSMutableAttributedString *messageAttributeStr = [[NSMutableAttributedString alloc]initWithString:message];
    [messageAttributeStr addAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor],NSFontAttributeName:[UIFont systemFontOfSize:13]} range:NSMakeRange(0, message.length)];
    [vc setValue:messageAttributeStr forKey:@"attributedMessage"];
}

- (void)showAlertView:(UIButton *)sender{
    NSString *messageString = @"天街小雨润如酥，草色遥看近却无；最是一年春好色，决胜烟柳满皇都。我能想到最浪漫的事，就是和你一起变老。渭城朝雨浥轻尘，客舍青青柳色新；劝君更尽一杯酒，西出阳关无故人";
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"好想找个女朋友" message:messageString preferredStyle:UIAlertControllerStyleAlert];
    MyLog(@"alertSubViews------%@",alertController.view.subviews);
    
   /*
    现在的title和message都是居中对齐的, 但是如果我们想让他左对齐或者右对齐该怎么做呢, 这里我查UIAlertController中的属性并没有titleLabel和messageLabel.说明这两个label是隐藏的.外界不能直接访问的.
    2.但是通过找UIAlertController的subviews终于找到了
    */
    UIView *subView1 = alertController.view.subviews[0];
    UIView *subView2 = subView1.subviews[0];
    UIView *subView3 = subView2.subviews[0];
    UIView *subView4 = subView3.subviews[0];
    UIView *subView5 = subView4.subviews[0];
    NSLog(@"subView5.subviews----%@",subView5.subviews);
    
    UILabel *titleLabel = subView5.subviews[0];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    UILabel *messageLabel = subView5.subviews[1];
    messageLabel.textAlignment = NSTextAlignmentLeft;
    
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController  addAction:sureAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
