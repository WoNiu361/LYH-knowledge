//
//  UIButton+CommonUseButton.m
//  LYH-knoeledge
//
//  Created by LYH on 26/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import "UIButton+CommonUseButton.h"

@implementation UIButton (CommonUseButton)
+ (UIButton *)createButtonWithFrmme:(CGRect)frame withTitle:(NSString *)title withTitleFont:(CGFloat)titleFloat withTitleColor:(UIColor *)color withBackgroundColor:(UIColor *)groundColor withTarget:(id)target withAction:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:titleFloat];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setBackgroundColor:groundColor];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
@end
