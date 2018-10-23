//
//  MainTableViewController.h
//  LYH-knoeledge
//
//  Created by LYH on 2/1/17.
//  Copyright © 2017年 LYH-1140663172. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewController : UITableViewController
/** cell的个数 */
@property (nonatomic, strong) NSMutableArray *allArray;
/** cell里面的标题 */
@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, assign) UITableViewStyle *cellStyle;
@end
