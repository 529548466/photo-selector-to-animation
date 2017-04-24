//
//  HMStatusPictureView.m
//  新浪微博 oc  写法
//
//  Created by jackhan on 16/3/22.
//  Copyright © 2016年 jackhan. All rights reserved.
//

#import "HMStatusPictureView.h"
#import "HMStatusCellCommon.h"
#import "HMStatusPictureCellCollectionViewCell.h"
#import "ViewPhototoSeeController.h"
#import "MYKanimationTool.h"
#import "UIScreen+Extensions.h"

/// 每列图片数量
#define kPicViewColCount 3
/// 图片间距
#define kPicViewItemMargin 5
/// 可重用标识符
NSString *const kStatusPictureCellId = @"StatusPictureCellId";


@interface HMStatusPictureView() <UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic , strong)MYKanimationTool *animationTool;
@end
extern UIViewController * vc5;
@implementation HMStatusPictureView
#pragma mark - 设置数据
- (void)setUrls:(NSArray *)urls {
    _urls = urls;
    
    
    // 提示：sizeToFit 会调用 sizeThatFits: 方法，计算配图视图大小
    [self sizeToFit];
    
    // 刷新数据
    [self reloadData];
}
/// 计算配图视图大小
- (CGSize)sizeThatFits:(CGSize)size {
    return [self calcViewSize];
}
/// 计算视图大小
///
/// @return 配图视图的大小
- (CGSize)calcViewSize {
    // 1. 配图数量
    NSInteger count = _urls.count;
    
    // 如果没有图片，直接返回
    if (count == 0) {
        return CGSizeZero;
    }
    
    // 2. 基本数据计算
    // 单个 cell 的宽高
    CGFloat itemWH = ([UIScreen screenSize].width - (kPicViewColCount - 1) * (kPicViewItemMargin + kStatusCellMargin)) / kPicViewColCount;
    
    // 设置布局 item 大小
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    layout.itemSize = CGSizeMake(itemWH, itemWH);
    
    // 列数
    NSInteger col = count == 4 ? 2 : (count >= kPicViewColCount ? kPicViewColCount : count);
    // 行数
    NSInteger row = (count - 1) / kPicViewColCount + 1;
    
    // 3. 计算宽高
    CGFloat width = ceil(col * itemWH + (col - 1) * kPicViewItemMargin);
    CGFloat height = ceil(row * itemWH + (row - 1) * kPicViewItemMargin);
    
    return CGSizeMake(width, height);

}

#pragma mark - 构造函数
- (instancetype)init {
  // 设置 layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self = [super initWithFrame:CGRectZero collectionViewLayout:layout];
    if (self) {
        // 设置 layout
        layout.minimumInteritemSpacing = kPicViewItemMargin;
        layout.minimumLineSpacing = kPicViewItemMargin;
        // 设置数据源
        self.dataSource = self;
        self.delegate = self;
        // 注册 Cell
        [self registerClass:[HMStatusPictureCellCollectionViewCell class] forCellWithReuseIdentifier:kStatusPictureCellId];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifycationChange:) name:@"liandong" object:nil];
        
    }
    return self;

}

#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.urls.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HMStatusPictureCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kStatusPictureCellId forIndexPath:indexPath];
    
    cell.imageURL = self.urls[indexPath.row];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    

    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    CGRect rect1 = [self convertRect:cell.frame toCoordinateSpace:[UIApplication sharedApplication].keyWindow];
    ViewPhototoSeeController * vc = [[ViewPhototoSeeController alloc]init];
    vc.modalPresentationStyle= UIModalPresentationCustom;
    vc.urls = self.urls;
    vc.indexPath = indexPath;
    vc.transitioningDelegate  = self.animationTool;
    self.animationTool.index = indexPath;
    self.animationTool.url = self.urls[indexPath.row];
    self.animationTool.Rect = rect1;
    self.animationTool.CollectionView = collectionView;
    self.animationTool.View = self;
    self.animationTool.urls = self.urls;
    
    [vc5 presentModalViewController:vc animated:YES];
    
}
-(void)notifycationChange:(NSNotification *)notifycation{

    NSDictionary *dict = notifycation.userInfo;
    NSString *str = dict[@"tag"];
    
    if ([self.delegate1 respondsToSelector:@selector(StarView:indexPath:)])
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:str.integerValue inSection:0];
        UICollectionViewCell * cell = [self cellForItemAtIndexPath:indexPath];
        
        CGRect rect1 = [self convertRect:cell.frame toCoordinateSpace:[UIApplication sharedApplication].keyWindow];
        
      [self.delegate1 StarView:rect1 indexPath:indexPath ] ;
    }

    


}

-(MYKanimationTool *)animationTool{
    if (_animationTool == nil) {
        _animationTool = [[MYKanimationTool alloc]init];
    }
    return _animationTool;
}







@end
