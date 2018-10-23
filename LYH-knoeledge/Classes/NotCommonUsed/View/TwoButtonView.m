//
//  TwoButtonView.m
//  俩个Button
//
//  Created by 吕颜辉 on 16/11/30.
//  Copyright © 2016年 吕颜辉. All rights reserved.
//

#import "TwoButtonView.h"
@interface TwoButtonView ()
@property (nonatomic, retain) UIButton *testButton;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, retain) UIView *lineView;
@end
@implementation TwoButtonView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        [self addSubview:self.testButton];
        [self createButton];
    }
    return self;
}

-(NSArray *)titleArray{
    if (_titleArray == nil) {
        self.titleArray = @[@"第一年",@"第一月"];
    }
    return _titleArray;
}

- (void)createButton{
    for (int i = 0; i < self.titleArray.count; i ++) {
        self.testButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.testButton.frame = CGRectMake(i * self.frame.size.width/2, 0, self.frame.size.width/2, self.frame.size.height);
        [self.testButton setTitle:self.titleArray[i] forState:UIControlStateNormal];
        self.testButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.testButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.testButton setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        self.testButton.tag = 500 + i;
        [self.testButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.testButton];
        if (i == 0) {
            self.testButton.selected = YES;
            self.lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width/4, 2)];
            self.lineView.center = CGPointMake(self.testButton.center.x, self.testButton.frame.size.height - 2);
            self.lineView.backgroundColor = [UIColor purpleColor];
            [self.testButton addSubview:self.lineView];
        }
    }
}

- (void)clickButton:(UIButton *)sender{
    for (UIButton *btn in self.subviews) {
        btn.selected = NO;
    }
    if (sender.tag) {
        sender.selected = YES;
    }
    
    [UIView animateWithDuration:.25 animations:^{
        self.lineView.frame = CGRectMake(0, 0, self.frame.size.width/4, 2);
        self.lineView.center = CGPointMake(sender.center.x, sender.frame.size.height - 2);
    }];
    
    if (self.clickBlock) {
        self.clickBlock(sender.tag - 500);
    }
}
@end
