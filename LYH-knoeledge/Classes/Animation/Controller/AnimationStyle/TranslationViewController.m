//
//  TranslationViewController.m
//  LYH-knoeledge
//
//  Created by 庭好的 on 2018/10/11.
//  Copyright © 2018年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//

#import "TranslationViewController.h"

@interface TranslationViewController ()
@property (nonatomic, weak) UIImageView *translationImageView;
@end

@implementation TranslationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"转场动画";
    
    UIImageView *translationImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"boy"]];
    translationImageView.frame = CGRectMake(0, 0, translationImageView.image.size.width, translationImageView.image.size.height);
    translationImageView.center = self.view.center;
    [self.view addSubview:translationImageView];
    self.translationImageView = translationImageView;
    
//    CATransition *translation = [CATransition animation];
//    translation.duration = 1;
//    translation.type = @"pageCurl";
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [translationImageView.layer addAnimation:translation forKey:nil];
//    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CATransition *translation = [CATransition animation];
    translation.duration = 1;
    translation.type = @"pageCurl";
    [self.translationImageView.layer addAnimation:translation forKey:nil];
}

@end
