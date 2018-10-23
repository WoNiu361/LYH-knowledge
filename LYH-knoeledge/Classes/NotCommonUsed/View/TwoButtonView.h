//
//  TwoButtonView.h
//  俩个Button
//
//  Created by 吕颜辉 on 16/11/30.
//  Copyright © 2016年 吕颜辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoButtonView : UIView
@property (nonatomic,copy) void(^clickBlock)(NSInteger);
@end
