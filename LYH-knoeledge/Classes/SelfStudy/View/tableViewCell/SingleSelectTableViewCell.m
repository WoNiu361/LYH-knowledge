//
//  SingleSelectTableViewCell.m
//  LYH-knoeledge
//
//  Created by LYH on 20/1/17.
//  Copyright © 2017年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//

#import "SingleSelectTableViewCell.h"
#import "SelectOrUselectModel.h"

@interface SingleSelectTableViewCell ()
@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) UIImageView *selectedImageView;
@property (nonatomic, strong) UIView      *lineView;

@end
static NSString *const selectID = @"SelectOneTableViewCell";
@implementation SingleSelectTableViewCell



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = GlobalBackgroundColor;
        [self setupContents];
    }
    return self;
}

+ (instancetype)setupCellWithTableView:(UITableView *)tableView{
    SingleSelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:selectID];
    if (cell == nil) {
        cell = [[SingleSelectTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:selectID];
    }
    return cell;
}


- (void)setupContents{
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.titleLabel.text = @"LYH";
    [self.contentView addSubview:self.titleLabel];
    
    self.selectedImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"selected"]];
    self.selectedImageView.hidden = YES;
    self.selectedImageView.frame = CGRectZero;
    [self.contentView addSubview:self.selectedImageView];
    
    self.lineView = [[UIView alloc]initWithFrame:CGRectZero];
    self.lineView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.lineView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(10, self.contentView.height/2 - 9, 0, 0);
    [self.titleLabel sizeToFit];
    
    self.selectedImageView.frame = CGRectMake(self.contentView.width - 10 - self.selectedImageView.image.size.width, (self.contentView.height - self.selectedImageView.image.size.height)/2, self.selectedImageView.image.size.width, self.selectedImageView.image.size.height);
    
    self.lineView.frame = CGRectMake(0, self.contentView.height - .5, self.contentView.width, .5);
}

-(void)setModel:(SelectOrUselectModel *)model{
    _model = model;
    
    self.titleLabel.text = model.titleString;
    if (model.isSelect) {
        self.selectedImageView.hidden =  NO;
    }
    else{
        self.selectedImageView.hidden = YES;
    }
}


@end




@interface StyleCollectionViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation StyleCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentView.userInteractionEnabled = true;
        self.contentView.layer.cornerRadius = 2;
        self.contentView.layer.masksToBounds = YES;
        self.contentView.layer.borderWidth = .5;
        self.contentView.layer.borderColor = RGBColor(212,216,218).CGColor;
        
        _titleLabel = [UILabel createLabelWithText:@"我的测试" withTexrtFont:15 withTextColor:RGBColor(93,109,116) withFrame:CGRectZero withTextAlignment:NSTextAlignmentCenter fontWeight:UIFontWeightMedium];
        [self.contentView addSubview:_titleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = self.contentView.bounds;
}

-(void)setModel:(SelectOrUselectModel *)model {
    
    _model = model;
    _titleLabel.text = model.titleString;
    if (model.isSelect) {
        self.contentView.backgroundColor = RGBColor(255,181,133);
        self.contentView.layer.borderColor = RGBColor(255,240,230).CGColor;
        _titleLabel.textColor =  kUIColorFromRGB(0xf1610a);
    } else {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.contentView.layer.borderColor = RGBColor(212,216,218).CGColor;
        _titleLabel.textColor = RGBColor(93,109,116);
    }
}

@end
