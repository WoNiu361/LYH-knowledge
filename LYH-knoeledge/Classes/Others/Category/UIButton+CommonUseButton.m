//
//  UIButton+CommonUseButton.m
//  LYH-knoeledge
//
//  Created by LYH on 26/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import "UIButton+CommonUseButton.h"
#import <objc/runtime.h>

static const void *topNameKey = &topNameKey;
static const void *rightNameKey = &rightNameKey;
static const void *bottomNameKey = &bottomNameKey;
static const void *leftNameKey = &leftNameKey;

@implementation UIButton (CommonUseButton)
+ (UIButton *)createButtonWithFrmme:(CGRect)frame
                          withTitle:(NSString *)title
                      withTitleFont:(CGFloat)titleFloat
                     withTitleColor:(UIColor *)color
                withBackgroundColor:(UIColor *)groundColor
                         withTarget:(id)target
                         withAction:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:titleFloat];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setBackgroundColor:groundColor];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
#pragma mark -  扩大button的点击区域
- (void)configureEnlargeAreaWithTop:(CGFloat)top
                               left:(CGFloat)left
                             bottom:(CGFloat)bottom
                              right:(CGFloat)right {
    
    objc_setAssociatedObject(self, topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargeRect {
    
    NSNumber *topEdge = objc_getAssociatedObject(self, topNameKey);
    NSNumber *leftEdge = objc_getAssociatedObject(self, leftNameKey);
    NSNumber *bottomEdge = objc_getAssociatedObject(self, bottomNameKey);
    NSNumber *rightEdge = objc_getAssociatedObject(self, rightNameKey);
    
    if (topEdge && leftEdge && bottomEdge && rightEdge) {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    } else {
        return self.bounds;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGRect rect = [self enlargeRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super hitTest:point withEvent:event];
    } else {
        return CGRectContainsPoint(rect, point) ? self : nil;
    }
}
@end
