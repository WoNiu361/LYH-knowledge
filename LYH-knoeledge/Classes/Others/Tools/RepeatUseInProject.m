//
//  RepeatUseInProject.m
//  LYH-knoeledge
//
//  Created by LYH on 26/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import "RepeatUseInProject.h"

@implementation RepeatUseInProject

+ (instancetype)shareRepeatUse{
    static RepeatUseInProject *repeatUse = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        repeatUse = [[RepeatUseInProject alloc]init];
    });
    return repeatUse;
}

#pragma mark-----时间戳转化为时间
/**
 时间戳转化为时间

 @param timeStampString 时间戳

 @return 返回时间
 */
- (NSString *)translateTimeStampToTimeString:(NSString *)timeStampString{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timeStampString floatValue]];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}
#pragma mark-----获取当前的时间
/**
 当前时间 年-月-日
 
 @return 当前时间
 */

- (NSString *)getCurrentDate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    //    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSString *currentTime = [formatter stringFromDate:[NSDate date]];
    MyLog(@"currentTime-----%@",currentTime);
    
    NSString *yearStr = [currentTime substringToIndex:4];
    MyLog(@"yearStr-----%@",yearStr);
    
    //当月和日是个位数时，前面补@“0”
    NSString *monthStr = [currentTime substringWithRange:NSMakeRange(5, 2)];
    if (monthStr.length == 1) {
        monthStr = [NSString stringWithFormat:@"%@%@",@"0",monthStr];
    }
    
    MyLog(@"monthStr----%@",monthStr);
    
    NSString *dayStr = [currentTime substringFromIndex:8];
    if (dayStr.length == 1) {
        dayStr = [@"0" stringByAppendingString:dayStr];
    }
    
    MyLog(@"dayStr----%@",dayStr);
    
    NSString *curentTimeStr = [NSString stringWithFormat:@"%@-%@-%@",yearStr,monthStr,dayStr];
    
    return curentTimeStr;
}
#pragma mark-----获取当前月的第一天
/**
 获取当前月的第一天
 
 @return 返回获取当前月的第一天
 */

- (NSString *)getCurrentMonthFirstDay{
    NSDate *now = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps = [cal
                               components:NSCalendarUnitYear | NSCalendarUnitMonth
                               fromDate:now];
    [comps setDay:1];
    [comps setHour:+8];
    
    NSLog(@"0-0-0---%@",[cal dateFromComponents:comps]);
    NSString *string = [NSString stringWithFormat:@"%@",[cal dateFromComponents:comps]];
    NSString *currentMonthFirstDay = [string substringToIndex:10];
    NSLog(@"currentMonthFirstDay----%@",currentMonthFirstDay);
    return currentMonthFirstDay;
    
}


@end
