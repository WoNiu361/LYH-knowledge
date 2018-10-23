//
//  CustomCollectionViewFlowLayout.m
//  LYH-knoeledge
//
//  Created by 庭好的 on 2018/10/12.
//  Copyright © 2018年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//

#import "CustomCollectionViewFlowLayout.h"

@interface CustomCollectionViewFlowLayout (){
    /** 在居中对齐的时候需要知道这行所有cell的宽度总和  */
    CGFloat _sumWidth ;
}

@end

@implementation CustomCollectionViewFlowLayout

- (instancetype)init {
    self = [super init];
    if (self) {
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.minimumLineSpacing = 10;
        self.minimumInteritemSpacing = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 12, 10, 12);
        _betweenOfCell = 10.0;
        _LayoutType = FlowLayoutTypeLeft;
    }
    return self;
}

- (void)setBetweenOfCell:(CGFloat)betweenOfCell {
    _betweenOfCell = betweenOfCell;
    self.minimumInteritemSpacing = betweenOfCell;
}

- (instancetype)initWthType:(FlowLayoutType)LayoutType {
    self = [super init];
    if (self){
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.minimumLineSpacing = 10;
        self.minimumInteritemSpacing = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 12, 10, 12);
        _betweenOfCell = 10.0;
        _LayoutType = LayoutType;
    }
    return self;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *layoutAttributes_t = [super layoutAttributesForElementsInRect:rect];
    NSArray *layoutAttributes = [[NSArray alloc]initWithArray:layoutAttributes_t copyItems:YES];
    
    /**
     *  用来临时存放一行的Cell数组
     */
    NSMutableArray *layoutAttributesTemp = [[NSMutableArray alloc] init];
    for (NSUInteger index = 0; index < layoutAttributes.count; index ++) {
        UICollectionViewLayoutAttributes *currentAttr = layoutAttributes[index]; // 当前cell的位置信息
        UICollectionViewLayoutAttributes *previousAttr = index == 0 ? nil : layoutAttributes[index - 1]; // 上一个cell 的位置信
        UICollectionViewLayoutAttributes *nextAttr = index + 1 == layoutAttributes.count ? nil : layoutAttributes[index + 1];   // 下一个cell 位置信息
        
        /**
         *  加入临时数组
         */
        [layoutAttributesTemp addObject:currentAttr];
        _sumWidth += currentAttr.frame.size.width;
        
        CGFloat previousY = previousAttr == nil ? 0 : CGRectGetMaxY(previousAttr.frame);
        CGFloat currentY = CGRectGetMaxY(currentAttr.frame);
        CGFloat nextY = nextAttr == nil ? 0 : CGRectGetMaxY(nextAttr.frame);
        
        /**
         *  如果当前cell是单独一行
         */
        if (currentY != previousY && currentY != nextY){
            if ([currentAttr.representedElementKind isEqualToString:UICollectionElementKindSectionHeader]) {
                [layoutAttributesTemp removeAllObjects];
                _sumWidth = 0.0;
            }else if ([currentAttr.representedElementKind isEqualToString:UICollectionElementKindSectionFooter]){
                [layoutAttributesTemp removeAllObjects];
                _sumWidth = 0.0;
            }else{
                [self setCellFrameWith:layoutAttributesTemp];
            }
        }
        
        /**
         *  如果下一个cell在本行，这开始调整Frame位置
         */
        else if( currentY != nextY) {
            [self setCellFrameWith:layoutAttributesTemp];
        }
    }
    return layoutAttributes;
}

-(void)setCellFrameWith:(NSMutableArray*)layoutAttributes{
    CGFloat nowWidth = 0.0;
    switch (_LayoutType) {
        case FlowLayoutTypeLeft:
            nowWidth = self.sectionInset.left;
            for (UICollectionViewLayoutAttributes * attributes in layoutAttributes) {
                CGRect nowFrame = attributes.frame;
                nowFrame.origin.x = nowWidth;
                attributes.frame = nowFrame;
                nowWidth += nowFrame.size.width + self.betweenOfCell;
            }
            _sumWidth = 0.0;
            [layoutAttributes removeAllObjects];
            break;
            
        case FlowLayoutTypeCenter:
            nowWidth = (self.collectionView.frame.size.width - _sumWidth - ((layoutAttributes.count - 1) * _betweenOfCell)) / 2;
            for (UICollectionViewLayoutAttributes * attributes in layoutAttributes) {
                CGRect nowFrame = attributes.frame;
                nowFrame.origin.x = nowWidth;
                attributes.frame = nowFrame;
                nowWidth += nowFrame.size.width + self.betweenOfCell;
            }
            _sumWidth = 0.0;
            [layoutAttributes removeAllObjects];
            break;
            
        case FlowLayoutTypeRight:
            nowWidth = self.collectionView.frame.size.width - self.sectionInset.right;
            for (NSInteger index = layoutAttributes.count - 1 ; index >= 0 ; index-- ) {
                UICollectionViewLayoutAttributes * attributes = layoutAttributes[index];
                CGRect nowFrame = attributes.frame;
                nowFrame.origin.x = nowWidth - nowFrame.size.width;
                attributes.frame = nowFrame;
                nowWidth = nowWidth - nowFrame.size.width - _betweenOfCell;
            }
            _sumWidth = 0.0;
            [layoutAttributes removeAllObjects];
            break;
    }
}


@end
