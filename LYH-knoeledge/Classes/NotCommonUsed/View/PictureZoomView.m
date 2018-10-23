//
//  PictureZoomView.m
//  LYH-knoeledge
//
//  Created by LYH on 23/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import "PictureZoomView.h"
@interface PictureZoomView ()
/** 背景图片 */
@property (nonatomic, strong) UIImageView *backgroundImageView;
/** 头像 */
@property (nonatomic, strong) UIImageView *headImageVeiw;
/** 名字 */
@property (nonatomic, strong) UILabel     *writerNameLabel;
/** 地址 */
@property (nonatomic, strong) UILabel     *addressLabel;
@end
@implementation PictureZoomView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.backgroundImageView];
        [self addSubview:self.headImageVeiw];
        [self addSubview:self.writerNameLabel];
        [self addSubview:self.addressLabel];
    }
    return self;
}

-(UIImageView *)backgroundImageView{
    if (_backgroundImageView == nil) {
        self.backgroundImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"storeBackground"]];
    }
    return _backgroundImageView;
}

-(UIImageView *)headImageVeiw{
    if (_headImageVeiw  == nil) {
        self.headImageVeiw = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sliderHeader"]];
        self.headImageVeiw.layer.cornerRadius = self.headImageVeiw.image.size.width/2;
        self.headImageVeiw.layer.masksToBounds = YES;
    }
    return _headImageVeiw;
}

-(UILabel *)writerNameLabel{
    if (_writerNameLabel == nil) {
        self.writerNameLabel = [UILabel createLabelWithText:@"LYH的demo，小知识点" withTexrtFont:18 withTextColor:[UIColor whiteColor] withFrame:CGRectZero withTextAlignment:NSTextAlignmentLeft fontWeight:UIFontWeightMedium];
    }
    return _writerNameLabel;
}

-(UILabel *)addressLabel{
    if (_addressLabel == nil) {
        self.addressLabel = [UILabel createLabelWithText:@"Please contact to me if you find bug" withTexrtFont:15 withTextColor:[UIColor whiteColor] withFrame:CGRectZero withTextAlignment:NSTextAlignmentLeft fontWeight:UIFontWeightMedium];
    }
    return _addressLabel;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.backgroundImageView.frame = self.bounds;
    //如果不想view上的控件随着土坯那放大而改变位置，那么只需要把控件的位置写死就可以了。
    if (self.changeLocation == YES) {
        self.headImageVeiw.frame = CGRectMake(kSpaceW(30/2),  kSpaceH(120/2), kSpaceW(94/2), kSpaceH(94/2));
        
        self.writerNameLabel.frame = CGRectMake(CGRectGetMaxX(self.headImageVeiw.frame) + kSpaceW(30/2), self.headImageVeiw.y, 0, 0);
        [self.writerNameLabel sizeToFit];
        
        self.addressLabel.frame = CGRectMake(self.writerNameLabel.x, CGRectGetMaxY(self.writerNameLabel.frame) + kSpaceH(26/2), 0, 0);
        [self.addressLabel sizeToFit];

    }
    else{
        self.headImageVeiw.frame = CGRectMake(15, self.centerY/2 + 10 , self.headImageVeiw.image.size.width, self.headImageVeiw.image.size.height);
        self.writerNameLabel.frame = CGRectMake(CGRectGetMaxX(self.headImageVeiw.frame) + 25, self.headImageVeiw.y - 5, 0, 0);
        [self.writerNameLabel sizeToFit];
        self.addressLabel.frame = CGRectMake(self.writerNameLabel.x, CGRectGetMaxY(self.writerNameLabel.frame) + 15, 0, 0);
        [self.addressLabel sizeToFit];
    }
}

@end
