//
//  TextFieldViewController.m
//  LYH-knoeledge
//
//  Created by LYH on 2/1/17.
//  Copyright © 2017年 LYH-1140663172. All rights reserved.
//

#import "TextFieldViewController.h"
#import "BaseTextField.h"
#import <objc/runtime.h>
@interface TextFieldViewController ()
@property (nonatomic, strong) BaseTextField *textField;
@end

@implementation TextFieldViewController

// 只调用一次
+ (void)initialize{
    unsigned int count = 0;
    //运用runTime来查找属性
    Ivar *ivars = class_copyIvarList([UITextField class], &count);
    for (int i = 0; i < count; i ++) {
        Ivar ivar = ivars[i];
        NSLog(@"-1111--%s----%s",ivar_getName(ivar),ivar_getTypeEncoding(ivar));
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"UITextField";
    self.view.backgroundColor = GlobalBackgroundColor;

    [self.view addSubview:self.textField];
}

#pragma mark----UITextField属性
-(BaseTextField *)textField{
    if (_textField == nil) {
        self.textField = [[BaseTextField alloc]initWithFrame:CGRectMake(50, 10, 200, 40)];
    }
    return _textField;
}

@end
