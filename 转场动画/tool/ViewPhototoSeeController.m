//
//  ViewPhototoSeeController.m
//  新浪微博 oc  写法
//
//  Created by max on 2017/4/21.
//  Copyright © 2017年 jackhan. All rights reserved.
//

#import "ViewPhototoSeeController.h"
#import "CollectionPhototoseeViewCell.h"
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewPhototoSeeController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic , strong) UIPageControl *PageControl;
@end


@implementation ViewPhototoSeeController

-(void)loadView{
    CGRect rect = [UIScreen mainScreen].bounds;
    rect.size.width += 20;
    self.view = [[UIView alloc]initWithFrame:rect];
    self.view.backgroundColor = [UIColor blackColor];
    // 2. 设置布局
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    UICollectionViewFlowLayout *layout  = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = self.view.bounds.size;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UILayoutConstraintAxisVertical;
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.frame = self.view.bounds;
    [self.collectionView registerClass:[CollectionPhototoseeViewCell class] forCellWithReuseIdentifier:@"cell_photo"];
    [self.view addSubview:self.collectionView];
    
    [self.PageControl setBackgroundColor:[UIColor clearColor]];
    self.PageControl.currentPage = 0;
    self.PageControl.numberOfPages = self.urls.count;
    self.PageControl.userInteractionEnabled = NO;
    
    [self.view addSubview:self.PageControl];  NSString * str = @"0";
    NSDictionary *dict = @{
                           @"tag":str
                           };
    [[NSNotificationCenter defaultCenter] postNotificationName:@"liandong" object:nil userInfo:dict];
    [self.collectionView scrollToItemAtIndexPath:self.indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    
    
  
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.urls.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionPhototoseeViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell_photo" forIndexPath:indexPath];
    cell.url = self.urls[indexPath.item];

    return cell;
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/ scrollView.frame.size.width;
    NSString * str = [NSString stringWithFormat:@"%ld",(long)index];
   
    NSDictionary *dict = @{
                           @"tag":str
                           };
    [[NSNotificationCenter defaultCenter] postNotificationName:@"liandong" object:nil userInfo:dict];
    
    
    [self.PageControl setCurrentPage:index];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

-(UIPageControl *)PageControl{
    if (_PageControl == nil) {
        _PageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, ScreenHeight - 45, ScreenWidth, 20)];
    }
    return _PageControl;
}





@end
