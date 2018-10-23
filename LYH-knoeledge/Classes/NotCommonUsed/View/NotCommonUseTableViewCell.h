//
//  NotCommonUseTableViewCell.h
//  LYH-knoeledge
//
//  Created by LYH on 23/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NotCommonUseModel;

@interface NotCommonUseTableViewCell : UITableViewCell

+ (instancetype)setupCellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) NotCommonUseModel *model;

@end
