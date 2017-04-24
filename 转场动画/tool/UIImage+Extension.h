//
//  UIImage+Extension.h
//  新浪微博 oc  写法
//
//  Created by jackhan on 16/3/12.
//  Copyright © 2016年 jackhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Extension)
/// 使用图像名创建图像视图
///
/// @param imageName 图像名称
///
/// @return UIImageView
+ (instancetype)imageViewWithImageName:(NSString *)imageName;
@end
