//
//  UIButton+ShakeButton.m
//  shake动画
//
//  Created by LYH on 27/10/16.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "UIButton+ShakeButton.h"

@implementation UIButton (ShakeButton)

- (void)addShakeAnimation {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.5;
    animation.additive = YES;
    [self.layer addAnimation:animation forKey:@"shake"];
}


@end
