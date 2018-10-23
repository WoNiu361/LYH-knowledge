//
//  UILabel+CommonUseLLabel.h
//  LYH-knoeledge
//
//  Created by LYH on 23/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CommonUseLLabel)
+ (UILabel *)createLabelWithText:(NSString *)text withTexrtFont:(CGFloat)textFont withTextColor:(UIColor *)textColor withFrame:(CGRect)textFrame withTextAlignment:(NSTextAlignment)textAlignment fontWeight:(UIFontWeight)fontWeight;
@end
