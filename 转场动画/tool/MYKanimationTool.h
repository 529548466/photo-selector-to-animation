//
//  MYKanimationTool.h
//  ZhongQiKJ
//
//  Created by max on 2017/4/10.
//  Copyright © 2017年 美优卡. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ViewPhototoSeeController.h"
#import "HMStatusPictureView.h"

@interface MYKanimationTool : NSObject<UIViewControllerTransitioningDelegate,HMStatusPictureViewDelegate>
@property(nonatomic ,assign) BOOL isPresented;
@property(nonatomic,strong )NSIndexPath * index;
@property(nonatomic,copy)NSURL *url ;
@property(nonatomic,assign)CGRect Rect;
@property(nonatomic,strong ) HMStatusPictureView * CollectionView;
@property(nonatomic,strong ) UIView * View;
@property(nonatomic,strong ) NSArray * urls;
@property(nonatomic,strong ) NSIndexPath * path;
@end
