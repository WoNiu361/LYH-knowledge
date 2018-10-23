//
//  SelectOrUnselectTableViewCell.m
//  LYH-knoeledge
//
//  Created by 吕颜辉 on 17/1/8.
//  Copyright © 2017年 LYH-1140663172. All rights reserved.
//

#import "SelectOrUnselectTableViewCell.h"
#import "SelectOrUselectModel.h"

@interface SelectOrUnselectTableViewCell ()
@property (nonatomic, strong) UIImageView *selectImageView;
@property (nonatomic, strong) UILabel     *titleLabel;
@end
static NSString *const selectID = @"SelectOrUnselectTableViewCell";
@implementation SelectOrUnselectTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
//方法1.也可以实现多选
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//    selected = self.isChangePicture;
//    if (selected) {
//        self.selectImageView.image = [UIImage imageNamed:@"selected"];
//    }
//    else{
//        self.selectImageView.image = [UIImage imageNamed:@"unselected"];
//    }
//
//}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.selectImageView];
        
    }
    return self;
}

+ (instancetype)setupCellWithTableView:(UITableView *)tableView{
    SelectOrUnselectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:selectID];
    if (!cell) {
        cell = [[SelectOrUnselectTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:selectID];
    }
    return cell;
}

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        self.titleLabel = [UILabel createLabelWithText:@"LYH-1140663172" withTexrtFont:15 withTextColor:GlobalTextLabelColor withFrame:CGRectZero withTextAlignment:NSTextAlignmentLeft fontWeight:UIFontWeightMedium];
    }
    return _titleLabel;
}

-(UIImageView *)selectImageView{
    if (_selectImageView == nil) {
        self.selectImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"unselected"]];
    }
    return _selectImageView;
}
//方法2.也可以实现多选
-(void)setIsChangePicture:(BOOL)isChangePicture{
    _isChangePicture = isChangePicture;
    if (isChangePicture) {
        self.selectImageView.image = [UIImage imageNamed:@"selected"];
    }
    else{
        //这样设置，没有未选中的图片，只有选中的图片才显示,运行看效果
//        self.selectImageView.image = [UIImage imageNamed:nil];
        self.selectImageView.image = [UIImage imageNamed:@"unselected"];
        
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.selectImageView.frame = CGRectMake(self.contentView.width - self.selectImageView.image.size.width - 20, (self.contentView.height - self.selectImageView.image.size.height)/2, self.selectImageView.image.size.width, self.selectImageView.image.size.height);
    
//    self.titleLabel.frame = CGRectMake(10, (self.contentView.height - self.titleLabel.height)/2, 0, 0);
//    [self.titleLabel sizeToFit];
    self.titleLabel.frame = CGRectMake(10, (self.contentView.height - 15)/2, self.contentView.width - 10  - self.selectImageView.image.size.width - 20, 15);
}

-(void)setModel:(SelectOrUselectModel *)model{
    _model = model;
    
    self.titleLabel.text = model.titleString;
}

@end
