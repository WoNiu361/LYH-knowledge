//
//  BasicBezierPathViewController.m
//  LYH-knoeledge
//
//  Created by 庭好的 on 2018/10/12.
//  Copyright © 2018年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//

#import "BasicBezierPathViewController.h"

@interface BasicBezierPathViewController ()

@end

@implementation BasicBezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(50, 50, 100, 100);
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2.0f;//线的宽度
    shapeLayer.strokeColor = [UIColor redColor].CGColor;//线的颜色
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    shapeLayer.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
}

@end
