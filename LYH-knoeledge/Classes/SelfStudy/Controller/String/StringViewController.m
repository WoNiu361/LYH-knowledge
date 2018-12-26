//
//  StringViewController.m
//  LYH-knoeledge
//
//  Created by LYH on 3/1/17.
//  Copyright © 2017年 LYH-1140663172. All rights reserved.
//

#import "StringViewController.h"
#import "NSDate+CompareDate.h"

@interface StringViewController ()
/** 属性label */
@property (nonatomic, strong) UILabel *testLabel;
/** 多行显示 */
@property (nonatomic, strong) UILabel *linesLabel;
@end

@implementation StringViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"字符串知识";
    self.view.backgroundColor = GlobalBackgroundColor;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
//    [self richPropertyAboutString];
//    [self oneStringContainAnotherString];
    [self judgeAndShowTime];
}
#pragma mark - 富文本属性
- (void)richPropertyAboutString{
    self.testLabel = [UILabel createLabelWithText:@"346 名" withTexrtFont:36 withTextColor:[UIColor redColor] withFrame:CGRectMake(10, 10, 200, 40) withTextAlignment:NSTextAlignmentLeft fontWeight:UIFontWeightMedium];
    [self.view addSubview:self.testLabel];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:self.testLabel.text];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = [UIColor purpleColor];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:18];
//    [attributedString addAttributes:@{NSForegroundColorAttributeName:[UIColor purpleColor],NSFontAttributeName:[UIFont systemFontOfSize:18]} range:NSMakeRange(3, self.testLabel.text.length - 3)];
    NSRange range = NSMakeRange(3, self.testLabel.text.length - 3);
    [attributedString addAttributes:dic range:range];
    self.testLabel.attributedText = attributedString;
    
    //文本内容多了需要计算高度
    //单行显示
    NSString *content = @"北京欢迎你";
    CGSize size = [content sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:15]}];
    MyLog(@"size---%f---%f",size.width,size.height);
    
    //多行显示
    NSString *textString = @"亲，欢迎您通过以下方式与我们的营销顾问取得联系，交流您再营销推广工作中遇到的问题，营销顾问将免费为您提供咨询服务。如果有问题，请咨询：1140663172@qq.com或者邮箱13733876213@163.com";
    CGSize contentSize = [textString boundingRectWithSize:CGSizeMake(kUIScreenWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:15]} context:nil].size;
    self.linesLabel = [UILabel createLabelWithText:textString withTexrtFont:15 withTextColor:[UIColor orangeColor] withFrame:CGRectMake(self.testLabel.x, CGRectGetMaxY(self.testLabel.frame) + 5, kUIScreenWidth - 2 * self.testLabel.x, contentSize.height) withTextAlignment:NSTextAlignmentLeft fontWeight:UIFontWeightMedium];
    self.linesLabel.numberOfLines = 0;//多行显示，这句代码必不可少
    [self.view addSubview:self.linesLabel];
    
    //设置行间距
    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc]initWithString:textString];
    NSMutableParagraphStyle *paragraphyStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphyStyle.lineSpacing = 10;
    paragraphyStyle.firstLineHeadIndent = 35;//首行文字缩进
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphyStyle range:NSMakeRange(0, [textString length])];
    self.linesLabel.attributedText = attributedString1;
    [self.linesLabel sizeToFit];
    
}
#pragma mark - 判断一个字符串是否包含另一个字符串
- (void)oneStringContainAnotherString {
    
    NSString *a = @"zhengzhou";
    NSString *b = @"zhou";
    NSString *c = @"hang";
    
    //struct，结构体，range 是一个结构体。
    //location 表明 b 在 a 中的位置。
    
    NSRange range = [a rangeOfString:b];
    if (range.location == NSNotFound) {
        MyLog(@"not contain");
    } else {
        MyLog(@"contain ");
    }
}


- (void)judgeAndShowTime {
    
    self.testLabel = [UILabel createLabelWithText:@"346 名" withTexrtFont:36 withTextColor:[UIColor redColor] withFrame:CGRectMake(10, 10, 200, 40) withTextAlignment:NSTextAlignmentLeft fontWeight:UIFontWeightMedium];
    [self.view addSubview:self.testLabel];
    
    // 2014-12-31 23:59:59 -> 2014-12-31
    // 2015-01-01 00:00:01 -> 2015-01-01
    
    NSString *timeStr = @"2018-12-26 18:45:30";
    // 日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 设置日期格式(y:年,M:月,d:日,H:时,m:分,s:秒)
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    // 帖子的创建时间
    NSDate *create = [fmt dateFromString:timeStr];
    if (create.isThisYear) {//今年
        if (create.isToday) {//今天
            NSDateComponents *cmps = [[NSDate date] compareWithDate:create];
            MyLog(@"cmps   -- %@",cmps);
            if (cmps.hour >= 1) {//时间差值 >= 1小时
                self.testLabel.text = [NSString stringWithFormat:@"%zd小时前",cmps.hour];
            } else if (cmps.minute >= 1) {// 1小时 > 时间差值 >= 1分钟
                self.testLabel.text = [NSString stringWithFormat:@"%zd分钟前",cmps.minute];
            } else {//1分钟 > 时间差
                self.testLabel.text = @"刚刚";
            }
        } else if (create.isYesterday) {// 昨天
            fmt.dateFormat = @"昨天 HH:mm:ss";
            self.testLabel.text = [fmt stringFromDate:create];
        } else {
            fmt.dateFormat = @"MM-dd HH:mm:ss";
            self.testLabel.text = [fmt stringFromDate:create];
        }
    } else {//非今年
        self.testLabel.text = timeStr;
    }
    MyLog(@"time ---%@",self.testLabel.text);
}
@end
