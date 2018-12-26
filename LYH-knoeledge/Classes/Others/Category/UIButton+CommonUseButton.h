//
//  UIButton+CommonUseButton.h
//  LYH-knoeledge
//
//  Created by LYH on 26/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CommonUseButton)
+ (UIButton *)createButtonWithFrmme:(CGRect)frame
                          withTitle:(NSString *)title
                      withTitleFont:(CGFloat)titleFloat
                     withTitleColor:(UIColor *)color
                withBackgroundColor:(UIColor *)groundColor
                         withTarget:(id)target
                         withAction:(SEL)action;


/**
 扩大button的点击区域

 @param top top
 @param left left
 @param bottom bottom
 @param right right
 */
- (void)configureEnlargeAreaWithTop:(CGFloat)top
                               left:(CGFloat)left
                             bottom:(CGFloat)bottom
                              right:(CGFloat)right;
@end
