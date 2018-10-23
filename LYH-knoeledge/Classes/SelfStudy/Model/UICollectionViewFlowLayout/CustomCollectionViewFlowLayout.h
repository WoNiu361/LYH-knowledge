//
//  CustomCollectionViewFlowLayout.h
//  LYH-knoeledge
//
//  Created by 庭好的 on 2018/10/12.
//  Copyright © 2018年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FlowLayoutType){
    FlowLayoutTypeLeft,
    FlowLayoutTypeCenter,
    FlowLayoutTypeRight
};

@interface CustomCollectionViewFlowLayout : UICollectionViewFlowLayout

/** 两个Cell之间的距离  */
@property (assign, nonatomic) CGFloat betweenOfCell;

/** cell对齐方式  */
@property (assign, nonatomic) FlowLayoutType LayoutType;

- (instancetype)initWthType:(FlowLayoutType)LayoutType;

@end
