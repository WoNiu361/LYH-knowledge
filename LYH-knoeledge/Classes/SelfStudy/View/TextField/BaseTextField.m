//
//  BaseTextField.m
//  BaseTextField
//
//  Created by LYH on 20/12/16.
//  Copyright © 2016年 LYH. All rights reserved.
//

#import "BaseTextField.h"

@implementation BaseTextField

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.font = [UIFont systemFontOfSize:13];
        //右边一直有清除按钮
        self.clearButtonMode = UITextFieldViewModeAlways;
        UIImageView *searchIcon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 30, 30)];
        searchIcon.image = [UIImage imageNamed:@"setYuMing"];
        searchIcon.contentMode = UIViewContentModeCenter;
        self.leftView = searchIcon;
        self.leftViewMode  = UITextFieldViewModeAlways;
        //键盘的类型
        self.returnKeyType = UIReturnKeySearch;
        self.borderStyle   = UITextBorderStyleRoundedRect;
        //设置光标的颜色
        self.tintColor = [UIColor blackColor];
        
//        // 创建一个富文本对象
//        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
//        // 设置富文本对象的颜色
//        attributes[NSForegroundColorAttributeName] = [UIColor redColor];
//        attributes[NSFontAttributeName] = [UIFont systemFontOfSize:15];
//        // 设置UITextField的占位文字
//        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入账号" attributes:attributes];
        
        self.placeholder = @"请输入账号";
        //更改占位符的颜色
        [self setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
        //更改占位符的字体大小
        [self setValue:[UIFont systemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];

    }
    return self;
}
#pragma mark----改变左边view的位置
- (CGRect)leftViewRectForBounds:(CGRect)bounds{
    CGRect rect = [super leftViewRectForBounds:bounds];
    rect.origin.x += 10;
    return rect;
}

/*----------------------------------------*/
//- (CGRect)placeholderRectForBounds:(CGRect)bounds{
//    CGRect rect = [super placeholderRectForBounds:bounds];
//    rect = CGRectMake(bounds.origin.x + 38, bounds.origin.y + 17, bounds.size.width, bounds.size.height);
//    return rect;
//}
//
//- (void)drawPlaceholderInRect:(CGRect)rect{
//    [super drawPlaceholderInRect:rect];
//    [[UIColor orangeColor] set];
//    [self.placeholder drawInRect:rect withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
//}

/*----------------------------------------*/
#pragma mark----下面这几个方法，是在UITextField没有左边图片的情况下，来改变光标和占位符的位置
//- (CGRect)leftViewRectForBounds:(CGRect)bounds{
//    CGRect iconRect = [super leftViewRectForBounds:bounds];
//    iconRect.origin.x += 10;
//    return iconRect;
//}
//
////重写占位符
//- (CGRect)editingRectForBounds:(CGRect)bounds{
//    CGRect editingRect = [super editingRectForBounds:bounds];
//    editingRect.origin.x += 20;
//    return editingRect;
//}
//
////重写文字显示时的X值
//- (CGRect)textRectForBounds:(CGRect)bounds{
//    CGRect textRect = [super textRectForBounds:bounds];
//    textRect.origin.x += 20;
//    return textRect;
//}

//这里有一个坑：就是当你同时重写这三个方法时，同时设置他们X的偏移量时会发现运行结果如下图
//  重写占位符的X值
//- (CGRect)placeholderRectForBounds:(CGRect)bounds{
//    CGRect placeHolderRect = [super placeholderRectForBounds:bounds];
//    placeHolderRect.origin.x += 80;
//    return placeHolderRect;
//}
@end
