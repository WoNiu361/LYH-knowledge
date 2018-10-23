//
//  GCDViewController.m
//  LYH-knoeledge
//
//  Created by LYH on 30/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()
@property (nonatomic, retain) UIImageView *imageView1;
@property (nonatomic, retain) UIImageView *imageView2;
@property (nonatomic, retain) UIImageView *imageView3;

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"GCD";
    self.view.backgroundColor = GlobalBackgroundColor;

    [self simpleKnowledgeAbountGCD];
    [self createTwoPicturesChangeOnePicture];
}

#pragma mark----关于GCD
- (void)simpleKnowledgeAbountGCD{
    // GCD 负责线程开发时的调度，优先级及功能性更强于线程NSThread，多线程开发开发时候用到
    /*
     1.GCD是苹果公司为多核的并行运算提出的解决方案
     2.GCD会自动利用更多的CPU内核（比如 双核、四核）
     3.GCD会自动管理线程的生命周期（创建线程、调度任务、销毁线程）
     程序员只需要告诉GCD想要执行什么任务，不需要编写任何线程管理代码
     */
    dispatch_queue_t queue = dispatch_queue_create("com.zhiyou100.www", NULL);
    dispatch_async(queue, ^{
        //0 表示当前线程为分线程
        MyLog(@"xianCheng-----%d",[NSThread currentThread] == [NSThread mainThread]);
    });
    
    //创建并行队列，会根据队列的执行时间来优先安排，优先级最高的安排先执行，dispatch_get_global_queue 常用于下载
    dispatch_queue_t queue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue1, ^{
        MyLog(@"hello word");
    });
    
    //获取主队列，常用于刷新UI
    dispatch_queue_t queue2 = dispatch_get_main_queue();
    dispatch_async(queue2, ^{
        // 0表示当前线程为分线程
        MyLog(@"1-1-1--1-----%d",[NSThread currentThread] == [NSThread mainThread]);
    });

    //iOS常见的延时执行方法有2种方法
    //1) 调用NSObject的方法，该方法在哪个线程调用，那么delay就在哪个线程执行（当前线程），通常是主线程
    [self performSelector:@selector(delay) withObject:nil afterDelay:2.0];
    //2) GCD 函数
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        MyLog(@"GCD延迟执行----------%d",[NSThread currentThread] == [NSThread mainThread]);
    });
}

- (void)delay{
    NSLog(@"延迟执行----%@",[NSThread currentThread]);
}

//如果把该方法放在异步函数中执行，则方法不会被调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //在异步函数中执行
    dispatch_queue_t queue = dispatch_queue_create("wedinging", 0);
    dispatch_async(queue, ^{
        [self performSelector:@selector(test) withObject:nil afterDelay:2.0];
    });
}

- (void)test{
    NSLog(@"异步函数中延迟执行----%@",[NSThread currentThread]);
}

/*--------------------------------------------------------------*/
#pragma mark---队列组
- (UIImage *)imageWithUrl:(NSString *)urlString{
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    return image;
}
- (void)createTwoPicturesChangeOnePicture{
    self.imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 50, 100, 100)];
    self.imageView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.imageView1];
    
    self.imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.imageView1.frame) + 20, 50, 100, 100)];
    self.imageView2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.imageView2];
    
    self.imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 200, 200, 100)];
    self.imageView3.backgroundColor = [UIColor  purpleColor];
    [self.view addSubview:self.imageView3];

    UIImage *image1 = [self imageWithUrl:@"https://gss0.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/a686c9177f3e670904999e8f39c79f3df8dc5521.jpg"];
     UIImage *image2 = [self imageWithUrl:@"https://gss0.baidu.com/9fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/6d81800a19d8bc3e0325caba808ba61ea8d34595.jpg"];
    //回到主线程显示图片
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imageView1.image = image1;
        self.imageView2.image = image2;
        
        //合并成一张照片
        UIGraphicsBeginImageContext(CGSizeMake(200, 100));
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 100), NO, 0.0);
        [image1 drawInRect:CGRectMake(0, 0, 100, 100)];
        [image2 drawInRect:CGRectMake(100, 0, 100, 100)];
        self.imageView3.image = UIGraphicsGetImageFromCurrentImageContext();
        //关闭上下文
        UIGraphicsEndImageContext();
        //0表示当前线程为分线程
        NSLog(@"图片合并完成---%d",[NSThread currentThread] == [NSThread mainThread]);
    });
}
@end
