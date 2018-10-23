//
//  CustomCollectionViewFlowLayoutVC.m
//  LYH-knoeledge
//
//  Created by 庭好的 on 2018/10/12.
//  Copyright © 2018年 LYH-1140663172.If you find problems,Please contact me with QQ or email :13733876213@163.com. All rights reserved.
//

#import "CustomCollectionViewFlowLayoutVC.h"
#import "CustomCollectionViewFlowLayout.h"
#import "SingleSelectTableViewCell.h"
#import "SelectOrUselectModel.h"
#import "EPInfoAlert.h"

#define kLimitCount    3

@interface CustomCollectionViewFlowLayoutVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView                       *styleCollectionView;
@property (nonatomic, strong) NSMutableArray<SelectOrUselectModel *> *reasonModelArray;
@end
static NSString *const wayID = @"THSendGoodsWayView";
@implementation CustomCollectionViewFlowLayoutVC

-(NSMutableArray<SelectOrUselectModel *> *)reasonModelArray {
    if (_reasonModelArray == nil) {
        _reasonModelArray = [NSMutableArray array];
    }
    return _reasonModelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     如果reasonArray这些值是在tableViewCell中，那么reasonArray里的值一定要在控制器中处理，在tableViewCell里面处理，会导致你点击选中item，滑动cell时cell重用，那么选中的状态就不会变成初始状态。
     */
    NSArray<NSDictionary *> *reasonArray = [NSArray arrayWithObjects:
                                            @{@"key":@"1",@"reason":@"完善前可退款"},
                                            @{@"key":@"2",@"reason":@"送货入户"},
                                            @{@"key":@"3",@"reason":@"无需安装"},
                                            @{@"key":@"4",@"reason":@"7天无条件退货退款"},
                                            @{@"key":@"5",@"reason":@"派师傅指导安装"},
                                            @{@"key":@"6",@"reason":@"提供技术支持"},
                                            @{@"key":@"7",@"reason":@"施工方原因"}, nil];
    [reasonArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SelectOrUselectModel *model = [[SelectOrUselectModel alloc] init];
        model.titleString           = [obj objectForKey:@"reason"];
        model.keyStr                = [obj objectForKey:@"key"];
        model.isSelect              = false;
        [self.reasonModelArray addObject:model];
    }];
    
    CustomCollectionViewFlowLayout *layout = [[CustomCollectionViewFlowLayout alloc] init];
    layout.LayoutType                      = FlowLayoutTypeLeft;
    layout.betweenOfCell                   = 7 ;
    layout.scrollDirection                 = UICollectionViewScrollDirectionVertical;
    _styleCollectionView                   = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _styleCollectionView.backgroundColor   = [UIColor whiteColor];
    _styleCollectionView.delegate          = self;
    _styleCollectionView.dataSource             = self;
    _styleCollectionView.scrollEnabled     = false;
    [_styleCollectionView registerClass:[StyleCollectionViewCell class] forCellWithReuseIdentifier:wayID];
    [self.view addSubview:_styleCollectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.reasonModelArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    StyleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:wayID forIndexPath:indexPath];
    cell.model = [self.reasonModelArray objectAtIndex:indexPath.item];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapItem:)];
//    [cell.contentView addGestureRecognizer:tap];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SelectOrUselectModel *model = [self.reasonModelArray objectAtIndex:indexPath.item];
    CGRect strRect = [model.titleString boundingRectWithSize:CGSizeMake(kUIScreenWidth, 12) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12 weight:UIFontWeightMedium]} context:nil];
    return CGSizeMake(strRect.size.width + 40, 40);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   
    SelectOrUselectModel *model = [self.reasonModelArray objectAtIndex:indexPath.item];
    if (!model.isSelect) {
        if ([self limitCount]) {
            [EPInfoAlert showInfo:@"变更原因最多只能选择三条" inView:self.view];
        } else {
            model.isSelect = !model.isSelect;
        }
    } else {
        model.isSelect = !model.isSelect;
    }
    [self.styleCollectionView reloadData];
    [self getSelectDelayReasons];
}

- (void)tapItem:(UITapGestureRecognizer *)tap {
    
    CGPoint point = [tap locationInView:self.styleCollectionView];
    NSIndexPath *indexPath = [self.styleCollectionView indexPathForItemAtPoint:point];
    
    SelectOrUselectModel *model = [self.reasonModelArray objectAtIndex:indexPath.item];
    if (!model.isSelect) {
        if ([self limitCount]) {
            [EPInfoAlert showInfo:@"变更原因最多只能选择三条" inView:self.view];
        } else {
            model.isSelect = !model.isSelect;
        }
    } else {
        model.isSelect = !model.isSelect;
    }
    [self.styleCollectionView reloadData];
}

- (BOOL)limitCount {
    
    NSMutableArray *tempArray = [NSMutableArray array];
    [self.reasonModelArray enumerateObjectsUsingBlock:^(SelectOrUselectModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.isSelect) {
            [tempArray addObject:obj];
        }
    }];
    if (tempArray.count >= kLimitCount) {
        return true;
    }
    return false;
}
#pragma mark - 选中的model
- (NSArray *)getSelectDelayReasons {
    
    NSMutableArray *reasonArray = [NSMutableArray array];
    [self.reasonModelArray enumerateObjectsUsingBlock:^(SelectOrUselectModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.isSelect) {
            [reasonArray addObject:obj.keyStr];
        }
    }];
    MyLog(@"key----%@",reasonArray);
    return reasonArray;
}

@end
