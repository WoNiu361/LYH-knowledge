//
//  SingleSelectTableViewCell.h
//  LYH-knoeledge
//
//  Created by LYH on 20/1/17.
//  Copyright © 2017年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SelectOrUselectModel;
@interface SingleSelectTableViewCell : UITableViewCell

@property (nonatomic, strong) SelectOrUselectModel *model;
+ (instancetype)setupCellWithTableView:(UITableView *)tableView;
@end





@interface StyleCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) SelectOrUselectModel *model;

@end
