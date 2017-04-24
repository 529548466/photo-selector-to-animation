//
//  HMStatusPictureView.h
//  新浪微博 oc  写法
//
//  Created by jackhan on 16/3/22.
//  Copyright © 2016年 jackhan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMStatusPictureView;
@protocol HMStatusPictureViewDelegate <NSObject>
- (void)StarView:(CGRect )Rect indexPath:(NSIndexPath *)path;
@end

@interface HMStatusPictureView : UICollectionView
@property (nonatomic,weak)id <HMStatusPictureViewDelegate> delegate1;
/// 配图 URL 数组
@property (nonatomic, strong) NSArray *urls;
@end
