//
//  DrawUIViewController.m
//  LYH-knoeledge
//
//  Created by LYH on 3/1/17.
//  Copyright © 2017年 LYH-1140663172. All rights reserved.
//

#import "DrawUIViewController.h"
#import "LineView.h"

@interface DrawUIViewController ()
@property (nonatomic, weak)   UIView   *lineView;
@end

@implementation DrawUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"UI特别的知识点";
    self.view.backgroundColor = GlobalBackgroundColor;
    
    LineView *lineView = [[LineView alloc]initWithFrame:CGRectMake(0,  5, kUIScreenWidth, 50)];
    [self.view addSubview:lineView];
    self.lineView = lineView;

}



@end
