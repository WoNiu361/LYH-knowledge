//
//  EPInfoAlert.h
//  sesamelife
//
//  Created by chenlei1 on 12-12-1.
//
//  alert控件，用于显示相关alert信息,1.5s后自动消失，不包含按钮

#import "EPInfoAlert.h"

#define ALERT_MAX_WIDTH          200.0f      // 文本信息的最大宽度，超过宽度折行
#define ALERT_BORDER_TOPBOTTOM   4.0f        // 上下边界的间距
#define ALERT_BORDER_LEFTRIGHT   8.0f        // 左右边界的间距

@interface EPInfoAlert()
{
    CGColorRef m_bgcolor;
    NSString*  m_strInfo;
    CGSize     m_fontSize;
    UIFont*    m_infoFont;
}

- (void)appear;     // 浮现
- (void)fadeAway;   // 渐变消失
// size    文本信息的大小
- (id)initWithInfoSize:(CGSize)size bgColor:(CGColorRef)color info:(NSString*)info infoFont:(UIFont*)font;
- (void)addRoundedRectToPath:(CGContextRef)context rect:(CGRect)rect;

@end

@implementation EPInfoAlert

- (id)initWithInfoSize:(CGSize)size bgColor:(CGColorRef)color info:(NSString*)info infoFont:(UIFont*)font
{
    CGRect rect = CGRectMake(0, 0, size.width + 2 * ALERT_BORDER_LEFTRIGHT, size.height + 2 * ALERT_BORDER_TOPBOTTOM);
    self = [super initWithFrame:rect];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        m_fontSize = size;
        m_bgcolor  = color;
        if (info != nil) {
            m_strInfo  = [info copy];
        }
        m_infoFont = font;
    }
    return self;
}

// 绘制圆角矩形背景
- (void)addRoundedRectToPath:(CGContextRef)context rect:(CGRect)rect
{
    CGFloat fw, fh;
    CGFloat ovalWidth  = 5.0f;
    CGFloat ovalHeight = 5.0f;
    
    CGContextSaveGState(context);
    CGContextTranslateCTM (context, CGRectGetMinX(rect),
                           CGRectGetMinY(rect));
    CGContextScaleCTM (context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth (rect) / ovalWidth;
    fh = CGRectGetHeight (rect) / ovalHeight;
    CGContextMoveToPoint(context, fw, fh/2);
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1);
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1);
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1);
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 背景0.8透明度
    CGContextSetAlpha(context, 0.7);
    [self addRoundedRectToPath:context rect:rect];
    CGContextSetFillColorWithColor(context, m_bgcolor);
    CGContextFillPath(context);
    
    // 文字1.0透明度
    CGContextSetAlpha(context, 1.0);
    //CGContextSetShadowWithColor(context, CGSizeMake(0, -1), 1, [[UIColor whiteColor] CGColor]);
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGRect rt = CGRectMake(ALERT_BORDER_LEFTRIGHT, ALERT_BORDER_TOPBOTTOM, m_fontSize.width, m_fontSize.height);
    [m_strInfo drawInRect:rt withAttributes:@{ NSFontAttributeName :  m_infoFont,
                                               NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

// 从上层视图移除并释放
- (void)remove{
    [self removeFromSuperview];
}

// 渐变消失
- (void)fadeAway
{
    [UIView beginAnimations:@"alertFadeaway" context:nil];
    [UIView setAnimationDuration:1.5f];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(remove)];
    self.alpha = 0.0f;
    [UIView commitAnimations];
}

// 出现
- (void)appear
{
    [UIView beginAnimations:@"alertAppear" context:nil];
    [UIView setAnimationDuration:0.3f];
    self.alpha = 1.0;
    [UIView commitAnimations];
    [self performSelector:@selector(fadeAway) withObject:nil afterDelay:1.5];
}

- (void)dealloc{
    m_strInfo = nil;
    m_infoFont = nil;
}

#pragma mark - 对外接口

+ (void)showInfo:(NSString *)info
        infoFont:(UIFont*)font
         bgColor:(CGColorRef)color
          inView:(UIView *)view
        vertical:(CGFloat)height
{
    if (info == nil || !view) {
        return;
    }
    
    height = height < 0 ? 0 : height > 1 ? 1 : height;
    CGSize size = [info boundingRectWithSize:CGSizeMake(ALERT_MAX_WIDTH, CGFLOAT_MAX)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{ NSFontAttributeName : font }
                                     context:nil].size;
    CGSize finalSize = CGSizeMake(size.width + 2, size.height + 2);
    EPInfoAlert* alert = [[EPInfoAlert alloc] initWithInfoSize:finalSize bgColor:color info:info infoFont:font];
    alert.center = CGPointMake(view.center.x, view.frame.size.height*height);
    alert.alpha = 0;
    [view addSubview:alert];
    [alert appear];
}

+ (void)showInfo:(NSString*)info inView:(UIView*)view
{
    [EPInfoAlert showInfo:info
                 infoFont:[UIFont systemFontOfSize:14]
                  bgColor:[[UIColor blackColor] CGColor]
                   inView:view
                 vertical:0.5];
}

+ (void)showOperationFailInView:(UIView*)view
{
    [EPInfoAlert showInfo:@"操作失败，请稍后重试!" inView:view];
}

@end
