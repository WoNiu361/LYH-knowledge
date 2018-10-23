//
//  CABasicAnimationViewController.m
//  LYH-knoeledge
//
//  Created by 庭好的 on 2018/10/11.
//  Copyright © 2018年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//

#import "CABasicAnimationViewController.h"

@interface CABasicAnimationViewController ()

@end

@implementation CABasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"基本动画";
    
    [self heartScaleAnimation];
    [self winnowerRotationAnimation];
    [self arrowTranslationAnimation];
    
}
#pragma mark - 心脏缩放动画
- (void)heartScaleAnimation {
    
    //心脏缩放
    UIImageView *heartImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"heart"]];
    heartImageView.frame        = CGRectMake(50, 20, heartImageView.image.size.width/2.0, heartImageView.image.size.height/2.0);
    [self.view addSubview:heartImageView];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];//选中的这个keyPath就是缩放
    //transform.scale 这个KeyPath就是缩放的关键词，不可更改
    scaleAnimation.fromValue         = [NSNumber numberWithDouble:.0];//一开始时是0.0的大小
    scaleAnimation.toValue           = [NSNumber numberWithDouble:1.5]; //结束时是1.5的大小
    scaleAnimation.duration          = 1;//设置时间
    scaleAnimation.repeatCount       = MAXFLOAT;
    [heartImageView.layer addAnimation:scaleAnimation forKey:@"LYHCQScale"];//添加动画
    //LYHCQScale 这个key随意填写，不影响效果
}
#pragma mark - 风车旋转
- (void)winnowerRotationAnimation {
    
    UIImageView *winnowerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fengche"]];
    winnowerImageView.frame = CGRectMake(kUIScreenWidth/2.0, 20, winnowerImageView.image.size.width/2.0, winnowerImageView.image.size.height/2.0);
    [self.view addSubview:winnowerImageView];
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue         = [NSNumber numberWithDouble:0.f];
    rotationAnimation.toValue           = [NSNumber numberWithDouble:2 * M_PI];
    rotationAnimation.duration          = 2.f;
    rotationAnimation.repeatCount       = MAXFLOAT;
    [winnowerImageView.layer addAnimation:rotationAnimation forKey:@"rotation"];
}
#pragma mark - 箭头平移
- (void)arrowTranslationAnimation {
    
    UIImageView *arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
    arrowImageView.frame = CGRectMake(10, 100, arrowImageView.image.size.width/2.0, arrowImageView.image.size.height/2.0);
    [self.view addSubview:arrowImageView];
    
    CABasicAnimation *translationAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    translationAnimation.fromValue         = [NSNumber numberWithDouble:0.f];
    translationAnimation.toValue           = [NSNumber numberWithDouble:kUIScreenWidth];
    translationAnimation.duration          = 2.0f;
    translationAnimation.repeatCount       = MAXFLOAT;
    [arrowImageView.layer addAnimation:translationAnimation forKey:@"position"];
}

/*
 意思是Z轴方向，这个类不具有
 Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<NSConcreteValue 0x1c024bca0> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key z.'
 */

@end
