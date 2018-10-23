//
//  NotCommonUseTableViewCell.m
//  LYH-knoeledge
//
//  Created by LYH on 23/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import "NotCommonUseTableViewCell.h"
#import "NotCommonUseModel.h"

@interface NotCommonUseTableViewCell()
/** cell 左边的图片 */
@property (nonatomic, strong) UIImageView  *leftImageView;
/** cell 上的标题 */
@property (nonatomic, strong) UILabel      *titleLabel;
/** cell 右边的图片 */
@property (nonatomic, strong) UIImageView  *trtagnleImageVeiw;
/** cell 下边的线 */
@property (nonatomic, strong) UIView       *lineVeiw;
/** cell选中时的背景颜色 */
@property (nonatomic, strong) UIView       *selectedView;

@end
static NSString *const notCommonID = @"NotCommonUseTableViewCell";
@implementation NotCommonUseTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.leftImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.trtagnleImageVeiw];
        [self.contentView addSubview:self.lineVeiw];
        self.selectedBackgroundView = self.selectedView;
        
    }
    return self;
}

+ (instancetype)setupCellWithTableView:(UITableView *)tableView{
    NotCommonUseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:notCommonID];
    if (cell == nil) {
        cell = [[NotCommonUseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:notCommonID];
    }
    return cell;
}

-(UIImageView *)leftImageView{
    if (_leftImageView == nil) {
        self.leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"payBackList"]];
    }
    return _leftImageView;
}

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        self.titleLabel = [UILabel createLabelWithText:@"LYH的demo" withTexrtFont:kSpaceW(30/2) withTextColor:RGBAColor(51, 51, 51, 1) withFrame:CGRectZero withTextAlignment:NSTextAlignmentLeft fontWeight:UIFontWeightMedium];
    }
    return _titleLabel;
}

-(UIImageView *)trtagnleImageVeiw{
    if (_trtagnleImageVeiw == nil) {
        self.trtagnleImageVeiw = [[UIImageView alloc]initWithImage:[UIImage  imageNamed:@"enterInto"]];
    }
    return _trtagnleImageVeiw;
}

-(UIView *)lineVeiw{
    if (_lineVeiw == nil) {
        self.lineVeiw = [[UIView alloc]initWithFrame:CGRectZero];
        self.lineVeiw.backgroundColor = RGBAColor(229, 229, 229, 1);
    }
    return _lineVeiw;
}
#pragma mark-----cell选中时的背景颜色
-(UIView *)selectedView{
    if (_selectedView == nil) {
        self.selectedView = [[UIView alloc]initWithFrame:CGRectZero];
        self.selectedView.backgroundColor = RGBColor(223, 223, 23);
    }
    return _selectedView;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.leftImageView.frame = CGRectMake(kSpaceW(30/2), (self.contentView.height - self.leftImageView.image.size.height)/2, self.leftImageView.image.size.width, self.leftImageView.image.size.height);
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.leftImageView.frame) + kSpaceW(32/2), self.leftImageView.y + kSpaceH(2), 0, 0);
    [self.titleLabel sizeToFit];
    self.trtagnleImageVeiw.frame = CGRectMake(self.contentView.width - kSpaceW(28/2) - self.trtagnleImageVeiw.image.size.width, self.leftImageView.y + kSpaceH(2),self.trtagnleImageVeiw.size.width, self.trtagnleImageVeiw.image.size.height);
    self.lineVeiw.frame = CGRectMake(0, self.contentView.height - .5, self.contentView.width, .5);
    self.selectedView.frame = self.contentView.bounds;
}

-(void)setModel:(NotCommonUseModel *)model{
    _model = model;
    self.leftImageView.image = [UIImage imageNamed:model.pictureString];
    self.titleLabel.text = model.titleString;
}

@end
