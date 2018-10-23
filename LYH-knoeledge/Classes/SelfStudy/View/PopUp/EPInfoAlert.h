//
//  EPInfoAlert.h
//  sesamelife
//
//  Created by chenlei1 on 12-12-1.
//

#import <UIKit/UIKit.h>

/**
 *  alert控件，用于显示相关alert信息,1.5s后自动消失，不包含按钮
 */
@interface EPInfoAlert : UIView

//info为提示信息，view是消息框的superview
+ (void)showInfo:(NSString*)info inView:(UIView*)view;

// info为提示信息，
// font为提示信息字体，
// color为背景颜色，
// view是为消息框的superView（推荐Tabbarcontroller.view),
// vertical 为垂直方向上出现的位置 从 取值 0 ~ 1。
+ (void)showInfo:(NSString*)info
        infoFont:(UIFont*)font
         bgColor:(CGColorRef)color
          inView:(UIView*)view
        vertical:(CGFloat)height;

/**
 *  显示“操作失败，请稍候重试”
 *
 *  @param view 要显示的view
 */
+ (void)showOperationFailInView:(UIView*)view;

@end
