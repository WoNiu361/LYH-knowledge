//
//  MoveCollectionViewCell.m
//  LYH-knoeledge
//
//  Created by LYH on 3/1/17.
//  Copyright © 2017年 LYH-1140663172. All rights reserved.
//

#import "MoveCollectionViewCell.h"

@interface MoveCollectionViewCell ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, retain) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end
static NSString * const reuseIdentifier = @"collectionViewCell";
@implementation MoveCollectionViewCell

-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        self.dataArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = GlobalBackgroundColor;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(kUIScreenWidth/6, 60);
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = GlobalBackgroundColor;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.view addSubview:self.collectionView];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPress:)];
    [self.collectionView addGestureRecognizer:longPress];
    
    for (int i = 1; i < 46; i ++) {
        NSString *str = [NSString stringWithFormat:@"%d",i];
        [self.dataArray addObject:str];
    }
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    UILabel *numberLabel = [UILabel createLabelWithText:self.dataArray[indexPath.row] withTexrtFont:15 withTextColor:[UIColor whiteColor] withFrame:cell.bounds withTextAlignment:NSTextAlignmentCenter fontWeight:UIFontWeightMedium];
    [cell addSubview:numberLabel];
    return cell;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    //    NSMutableArray *arr = [NSMutableArray arrayWithArray:self.photoArray];
    //数组里的个数必须和numberOfItemsInSection这个方法里的个数一致，否则移动到第一个或者最后一个，程序会崩溃
    NSString *string = [self.dataArray objectAtIndex:sourceIndexPath.row];
    [self.dataArray removeObject:string];
    [self.dataArray insertObject:string atIndex:destinationIndexPath.row];
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)longPress{
    //判断手势状态
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan:{
            NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:[longPress locationInView:self.collectionView]];
            if (indexPath == nil) {
                break;
            }
            //在路径上则开始移动该路径上的cell
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
        }
            break;
            
        case UIGestureRecognizerStateChanged:{
            //移动过程当中随时更新cell位置
            [self.collectionView updateInteractiveMovementTargetPosition:[longPress locationInView:self.collectionView]];
        }
            break;
            
        case UIGestureRecognizerStateEnded:{
             //移动结束后关闭cell移动
            [self.collectionView endInteractiveMovement];
        }
            
        default:
            [self.collectionView cancelInteractiveMovement];
            break;
    }
}

@end
