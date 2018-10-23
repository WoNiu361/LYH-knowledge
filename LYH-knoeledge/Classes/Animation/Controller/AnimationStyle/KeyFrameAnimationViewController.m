//
//  KeyFrameAnimationViewController.m
//  LYH-knoeledge
//
//  Created by 庭好的 on 2018/10/11.
//  Copyright © 2018年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//

#import "KeyFrameAnimationViewController.h"

@interface KeyFrameAnimationViewController ()

@end

@implementation KeyFrameAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"关键帧动画";
    
    UIImageView *catImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cat"]];
    catImageView.frame = CGRectMake(50, 100, catImageView.image.size.width, catImageView.image.size.height);
    [self.view addSubview:catImageView];
    //根据values移动的动画
    CAKeyframeAnimation *catKeyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGPoint originalPoint                = catImageView.layer.frame.origin;
    CGFloat distance                     =  50;
    NSValue *value1                      = [NSValue valueWithCGPoint:CGPointMake(originalPoint.x + distance, originalPoint.y + distance)];
    NSValue *value2                      = [NSValue valueWithCGPoint:CGPointMake(originalPoint.x + 2 * distance, originalPoint.y + distance)];
    NSValue *value3                      = [NSValue valueWithCGPoint:CGPointMake(originalPoint.x + 2 * distance, originalPoint.y +  2 * distance)];
    NSValue *value4                      = [NSValue valueWithCGPoint:originalPoint];
    catKeyAnimation.values               = @[value4, value1, value2, value3, value4];
    catKeyAnimation.duration             = 2;
    catKeyAnimation.repeatCount          = MAXFLOAT;
    catKeyAnimation.removedOnCompletion  = NO;
    [catImageView.layer addAnimation:catKeyAnimation forKey:nil];
    
    UIImageView *penguImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"QQ"]];
    penguImageView.frame        = CGRectMake(50, 150, penguImageView.image.size.width, penguImageView.image.size.height);
    [self.view addSubview:penguImageView];
     //指定path的动画
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(100, 200)];
    [path addLineToPoint:CGPointMake(200, 200)];
    [path addLineToPoint:CGPointMake(200, 100)];
    [path addLineToPoint:CGPointMake(100, 100)];
    
    CAKeyframeAnimation *penguAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    penguAnimation.path                 = path.CGPath;
    penguAnimation.duration             = 2;
    penguAnimation.repeatCount          = MAXFLOAT;
    penguAnimation.removedOnCompletion  = false;
    [penguImageView.layer addAnimation:penguAnimation forKey:@"lyh"];
    
}



@end
