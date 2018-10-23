//
//  UILabel+CommonUseLLabel.m
//  LYH-knoeledge
//
//  Created by LYH on 23/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import "UILabel+CommonUseLLabel.h"

@implementation UILabel (CommonUseLLabel)
+ (UILabel *)createLabelWithText:(NSString *)text withTexrtFont:(CGFloat)textFont withTextColor:(UIColor *)textColor withFrame:(CGRect)textFrame withTextAlignment:(NSTextAlignment)textAlignment fontWeight:(UIFontWeight)fontWeight {
    UILabel *label = [[UILabel alloc]initWithFrame:textFrame];
    label.text = text;
    label.textAlignment = textAlignment;
    label.font = [UIFont systemFontOfSize:textFont weight:fontWeight];
    label.textColor = textColor;
    return label;
}
@end
