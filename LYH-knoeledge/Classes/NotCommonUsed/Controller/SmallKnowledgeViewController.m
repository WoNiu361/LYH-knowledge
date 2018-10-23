//
//  SmallKnowledgeViewController.m
//  LYH-knoeledge
//
//  Created by LYH on 26/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import "SmallKnowledgeViewController.h"

@interface SmallKnowledgeViewController ()
@property (nonatomic, weak)   UILabel     *stampLabel;
@property (nonatomic, strong) UILabel     *currentDateLabel;
@property (nonatomic, strong) UILabel     *currentMonthOfFirstDayLabel;
@property (nonatomic, weak)   UIImageView *imageView;
@property (nonatomic, weak)   UIView      *lineView;
@property (nonatomic, weak)   UIView      *view1;
@end

@implementation SmallKnowledgeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAppear:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHidden:) name:UIKeyboardDidHideNotification object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = GlobalBackgroundColor;
    self.navigationItem.title = @"小知识点";

#pragma mark-----时间戳转化为时间
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, 200, 30)];
    label.text = [[RepeatUseInProject shareRepeatUse] translateTimeStampToTimeString:@"1471231526"];
    [self.view addSubview:label];
    self.stampLabel = label;
    
#pragma mark----获取当前的年月日
    self.currentDateLabel = [UILabel createLabelWithText:[[RepeatUseInProject shareRepeatUse] getCurrentDate] withTexrtFont:15 withTextColor:[UIColor orangeColor] withFrame:CGRectMake(label.x, CGRectGetMaxY(label.frame), label.width, label.height) withTextAlignment:NSTextAlignmentLeft fontWeight:UIFontWeightMedium];
    [self.view addSubview:self.currentDateLabel];
    
#pragma mark----获取当前月的第一天
    self.currentMonthOfFirstDayLabel = [UILabel createLabelWithText:[[RepeatUseInProject shareRepeatUse] getCurrentMonthFirstDay] withTexrtFont:15 withTextColor:[UIColor orangeColor] withFrame:CGRectMake(label.x, CGRectGetMaxY(self.currentDateLabel.frame), label.width, label.height)withTextAlignment:NSTextAlignmentLeft fontWeight:UIFontWeightMedium];
    [self.view addSubview:self.currentMonthOfFirstDayLabel];
    
//用这种方法加载图片，图片必须放在根目录上，不能放在Assets.xcassets里面，否则图片加载不出来，并且后面的@2x不能省略.这种方法图片不会缓存起来，占用内存小
    NSString *path = [[NSBundle mainBundle] pathForResource:@"aboutUs@2x" ofType:@"png"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageWithContentsOfFile:path]];
    imageView.frame = CGRectMake(0, CGRectGetMaxY(self.currentMonthOfFirstDayLabel.frame), imageView.image.size.width, imageView.image.size.height);
    [self.view addSubview:imageView];
    self.imageView = imageView;
    
    [self aboutStringKnowledge];
    
    [self drawXuXian];
    
    [self setupView];
    
    [self aboutDictionaryProperty];
    
    [self aboutArrayKnowledge];
    
    [self otherLittleKnowledge];

}

#pragma mark-----字符串
- (void)aboutStringKnowledge{
    NSString *str1 = @"LYH";
    NSString *str2 = [str1 stringByAppendingString:@"123"];
    NSLog(@"1-2-2-----%@",str2);
    
    NSString *str3 = [str1 stringByAppendingFormat:@"456"];
    NSLog(@"2-2-2--2--2---%@",str3);
    
    
    NSMutableString *repair = [[NSMutableString alloc]init];
    [repair appendString:@"<xml>"];
    NSLog(@"repair------%@",repair);
    
    [repair appendFormat:@"/xml"];
    NSLog(@"repair------%@",repair);
    NSLog(@"~~~~~~~~~%@",[NSString stringWithString:repair]);
    
    NSString *loginStr = @"wen";//unionid
    NSString *currentTimeStamp = @"234556678";//time
    NSString *appid = @"8000001";//appid;
    NSString *bigStr = [NSString stringWithFormat:@"appid=%@&time=%@&unionid=%@",appid,currentTimeStamp,loginStr];
    NSLog(@"str-------%@",bigStr);
}

#pragma mark-----绘制虚线
- (void)drawXuXian{
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(self.imageView.width, self.imageView.y + 5, self.view.frame.size.width - self.imageView.width , 1)];
    //    lineView.backgroundColor = [UIColor redColor];
    [self.view addSubview:lineView];
    self.lineView = lineView;
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame)/2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //设置虚线颜色
    [shapeLayer setStrokeColor:[UIColor grayColor].CGColor];
    //设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:4],[NSNumber numberWithInt:3], nil]];
    //设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
 
}

#pragma mark-----view的设置
- (void)setupView{
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(self.imageView.width + 5, self.imageView.y + 15, self.view.frame.size.width - 20 - self.imageView.width, 40)];
    view1.backgroundColor = [UIColor redColor];
    //自动适应父视图大小
    view1.autoresizesSubviews = YES;
    view1.autoresizingMask = (UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth);
    [self.view addSubview:view1];
    self.view1 = view1;
}
#pragma mark-----字典的一些属性
- (void)aboutDictionaryProperty{
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"jack",@"name",@"26",@"age", nil];
    MyLog(@"jack------%@",dic[@"name"]);
    MyLog(@"age------%@",dic[@"age"]);//[dic objectForKey:@"age"]
    
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"jack",@"name",@"26",@"age", nil];
}
#pragma mark-----数组的一些知识
- (void)aboutArrayKnowledge{
    NSArray *cityArray = @[@"郑州",@"漯河",@"新乡",@"杭州",@"南京"];
//    NSArray *arr = [NSArray arrayWithObjects:<#(nonnull id), ...#>, nil];
//    NSArray *arr = [NSArray arrayWithObjects:<#(const id  _Nonnull __unsafe_unretained *)#> count:<#(NSUInteger)#>];
//    NSArray *arr = [NSArray arrayWithContentsOfURL:<#(nonnull NSURL *)#>];
//    NSArray *arr = [NSArray arrayWithContentsOfFile:<#(nonnull NSString *)#>];
    /*
     对象在运行时获取其类型的能力称为内省。内省可以有多种方法实现。
     判断对象类型
     -(BOOL) isKindOfClass: classObj判断是否是这个类或者这个类的子类的实例
     -(BOOL) isMemberOfClass: classObj 判断是否是这个类的实例
     */
    [cityArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //obj 是数组里的值;idx 是数组里每个值的索引
        MyLog(@"obj---%lu---%@",(unsigned long)idx,obj);
        MyLog(@"stop-----%@",stop ? @"YES" : @"NO");
    }];
    
    for (NSString *str in cityArray) {
        MyLog(@"str-c-------%@",str);
    }
    
    //NSArray判断是否为空需要注意的问题
    //判断数组是否为空，需要对各种情况都进行判断
    if (cityArray != nil && ![cityArray isKindOfClass:[NSNull class]] && cityArray.count != 0){
        
    }

}
#pragma mark-----其他零碎的知识
- (void)otherLittleKnowledge{
    //“==”操作符判断的是两个指针本身（也就是两个对象的内存地址），而不是所指的对象。
    NSString *str1 = @"bound 123";
    NSString *str2 = [NSString stringWithFormat:@"bound %@",@"123"];
    //%p 打印对象的额内存地址
    NSLog(@"str1---%@,%p",str1,&(str1));
    NSLog(@"str2----%@,%p",str2,&(str2));
    
    if (str1 == str2) {
        NSLog(@"== YES");
    } else {
        NSLog(@"== NO");
    }
    //从打印看出 ，str1和str2打印出来的结构都是bound 123，但是if判断输出NO，从内存地址看，发现两者内存地址不同，由此可以看出“ == ”判断比较的是两个“指针”本身（也就是内存地址），而不是对象。
    
    /*
     二、“- (BOOL)isEqual:(id)object; ” “+ (NSUInteger)hash；”
     
     NSObject协议中声明了判断对象等同性的两个方法，这两个方法返回相等条件是：当且仅当“指针值”完全相等的时候，对象才相等。如果isEqual判断两个对象相等，那么两个对象的hash返回值也一定相等。反之hsah值相等，isEqual未必认为两者一样。
     
     */

    //iOS中怎么判定一个数字值相等
    /*
     您好，iOS是基于OC所写的，而OC是兼容C语言的，所以您完全可以用C语言中判断变量的方式直接进行判断
     比如您设定了两个变量，这些变量都是OC中的数据类型
     NSInteger a = 100;
     NSinteger b = 100;
     //那么您只需要用一个BOOL类型的变量接收两个变量比较的结果就可以了
     BOOL result = (a == b);
     //如果a和b相同，那么result的值会为YES(1)，否则result的值就会为NO(0)
     */

}

- (void)keyboardAppear:(NSNotification *)notification{
    NSLog(@"---键盘显示------");
}
- (void)keybordHidden:(NSNotification *)notification{
    NSLog(@"---键盘隐藏-----");
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
