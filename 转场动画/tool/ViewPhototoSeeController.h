//
//  ViewPhototoSeeController.h
//  新浪微博 oc  写法
//
//  Created by max on 2017/4/21.
//  Copyright © 2017年 jackhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewPhototoSeeController : UIViewController
@property (nonatomic,strong) NSArray * urls;
@property (nonatomic,strong) NSIndexPath *  indexPath;
@property (nonatomic , strong)UICollectionView *collectionView;
@end
