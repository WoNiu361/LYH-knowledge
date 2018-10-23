//
//  SelectOrUselectModel.h
//  LYH-knoeledge
//
//  Created by 吕颜辉 on 17/1/8.
//  Copyright © 2017年 LYH-1140663172. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SelectOrUselectModel : NSObject

@property (nonatomic, assign) BOOL     isSelect;
@property (nonatomic, copy)   NSString *titleString;
@property (nonatomic, copy)   NSString *headTitle;
@property (nonatomic, copy)   NSString *keyStr;
/** 是否展开 */
@property (nonatomic, assign) BOOL     isUnfold;

@end
