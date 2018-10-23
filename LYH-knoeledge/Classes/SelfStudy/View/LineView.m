//
//  LineView.m
//  LYH-knoeledge
//
//  Created by LYH on 2/1/17.
//  Copyright © 2017年 LYH-1140663172. All rights reserved.
//

#import "LineView.h"

@implementation LineView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kUIScreenWidth/3, 0, kUIScreenWidth/3, 30)];
        [self addSubview:label];
        label.text = @"使用第三方登录";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = kUIColorFromRGB(0x878787);

    }
    return self;
}
//继承与UIView的类，只要你写了下面这个方法，就会自动调用这个方法
- (void)drawRect:(CGRect)rect{//初次不建议使用，位置很难把握，浪费时间
    CGContextRef context = UIGraphicsGetCurrentContext();
    //第二个参数决定线的x位置，三参是y的位置
    CGContextMoveToPoint(context, 15, 15);
    //第二个参数决定线的宽度，三参是y的位置
    CGContextAddLineToPoint(context, kUIScreenWidth/3 , 15);
    [kUIColorFromRGB(0x878787) set];
    CGContextSetLineWidth(context, 0.5);//二参是线的高度
    CGContextStrokePath(context);
    
    CGContextRef context1 = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context1, 2*kUIScreenWidth/3, 15);
    CGContextAddLineToPoint(context1, kUIScreenWidth -15, 15);
    [kUIColorFromRGB(0x878787) set];
    CGContextSetLineWidth(context1, 0.5);
    CGContextStrokePath(context1);
}

@end
