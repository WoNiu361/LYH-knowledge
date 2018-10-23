//
//  RepeatUseInProject.h
//  LYH-knoeledge
//
//  Created by LYH on 26/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RepeatUseInProject : NSObject
+ (instancetype)shareRepeatUse;

/**
 时间戳转化为时间
 
 @param timeStampString 时间戳
 
 @return 返回时间
 */
- (NSString *)translateTimeStampToTimeString:(NSString *)timeStampString;
/**
 当前时间 年-月-日
 
 @return 当前时间
 */

- (NSString *)getCurrentDate;
/**
 获取当前月的第一天
 
 @return 返回获取当前月的第一天
 */

- (NSString *)getCurrentMonthFirstDay;
@end
