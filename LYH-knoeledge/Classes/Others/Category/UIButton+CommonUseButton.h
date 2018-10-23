//
//  UIButton+CommonUseButton.h
//  LYH-knoeledge
//
//  Created by LYH on 26/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CommonUseButton)
+ (UIButton *)createButtonWithFrmme:(CGRect)frame withTitle:(NSString *)title withTitleFont:(CGFloat)titleFloat withTitleColor:(UIColor *)color withBackgroundColor:(UIColor *)groundColor withTarget:(id)target withAction:(SEL)action;
@end
