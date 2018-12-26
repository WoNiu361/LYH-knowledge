//
//  AnimationGroupViewController.m
//  LYH-knoeledge
//
//  Created by 庭好的 on 2018/10/11.
//  Copyright © 2018年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//

#import "AnimationGroupViewController.h"

@interface AnimationGroupViewController ()

@end

@implementation AnimationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"动画组";
    
    UIImageView *heartImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"heart"]];
    heartImageView.frame = CGRectMake(0, 0, heartImageView.image.size.width/1.5, heartImageView.image.size.height/1.5);
    heartImageView.center = self.view.center;
    [self.view addSubview:heartImageView];
    
    //创建动画组
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 3;
    animationGroup.repeatCount = MAXFLOAT;
    animationGroup.removedOnCompletion = false;
    /* beginTime 可以分别设置每个动画的beginTime来控制组动画中每个动画的触发时间，时间不能够超过动画的时间，默认都为0.f */
    
    //缩放动画
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation1.values = @[[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:1.5],[NSNumber numberWithFloat:1.0]];
    animation1.beginTime = 0.f;
    
    //按照圆弧移动动画
    CAKeyframeAnimation *animation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(300, 200)];
    [bezierPath addQuadCurveToPoint:CGPointMake(200, 300) controlPoint:CGPointMake(300, 300)];
    [bezierPath addQuadCurveToPoint:CGPointMake(100, 200) controlPoint:CGPointMake(100, 300)];
    [bezierPath addQuadCurveToPoint:CGPointMake(200, 100) controlPoint:CGPointMake(100, 100)];
    [bezierPath addQuadCurveToPoint:CGPointMake(300, 200) controlPoint:CGPointMake(300, 100)];
    animation2.path = bezierPath.CGPath;
    animation2.beginTime = 0.f;
    
    //透明度动画
  /*  CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation3.fromValue = [NSNumber numberWithDouble:0.0];
//    animation3.byValue = [NSNumber numberWithDouble:1.0];
    animation3.toValue = [NSNumber numberWithDouble:1.0];
    animation3.beginTime = 0.f; */
    CAKeyframeAnimation *animation3 = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    animation3.values = @[[NSNumber numberWithFloat:0.0],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:1.0],[NSNumber numberWithFloat:0.5],[NSNumber numberWithFloat:0.0]];
    animation3.beginTime = 0.f;
    animation3.repeatCount = MAXFLOAT;
    
    //添加动画组
    animationGroup.animations = @[animation1,animation2,animation3];
    [heartImageView.layer addAnimation:animationGroup forKey:nil];
}


@end
