//
//  CustomerNavigationBarView.m
//  LYH-knoeledge
//
//  Created by LYH on 27/12/16.
//  Copyright © 2016年 LYH-1140663172. All rights reserved.
//

#import "CustomerNavigationBarView.h"
@interface CustomerNavigationBarView ()
@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) UIImageView *setupImageView;
@end
@implementation CustomerNavigationBarView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = RGBAColor(0, 0, 0, 0);
        [self addSubview:self.titleLabel];
    }
    return self;
}

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        self.titleLabel = [UILabel createLabelWithText:@"图片放大" withTexrtFont:15 withTextColor:[UIColor whiteColor] withFrame:CGRectZero withTextAlignment:NSTextAlignmentCenter fontWeight:UIFontWeightMedium];
    }
    return _titleLabel;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake((self.width - 100)/2, 15, 100, 44);
}

@end
