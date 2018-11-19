//
//  StringViewController.m
//  LYH-knoeledge
//
//  Created by LYH on 3/1/17.
//  Copyright © 2017年 LYH-1140663172. All rights reserved.
//

#import "StringViewController.h"

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
    [self oneStringContainAnotherString];
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

@end
