//
//  NSDate+CompareDate.h
//  LYH-knoeledge
//
//  Created by 庭好的 on 2018/12/26.
//  Copyright © 2018年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//



NS_ASSUME_NONNULL_BEGIN

@interface NSDate (CompareDate)

/**
 比较fromDate和self的时间差值

 @param fromDate 比较的NSDate对象
 @return NSDateComponents
 */
- (NSDateComponents *)compareWithDate:(NSDate *)fromDate;


/**
  是否为今年

 @return BOOL
 */
- (BOOL)isThisYear;

/**
 是否为今天

 @return BOOL
 */
- (BOOL)isToday;

/**
 是否为昨天

 @return BOOL
 */
- (BOOL)isYesterday;

@end

NS_ASSUME_NONNULL_END
