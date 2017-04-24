//
//  UIImage+Extension.m
//  新浪微博 oc  写法
//
//  Created by jackhan on 16/3/12.
//  Copyright © 2016年 jackhan. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImageView (Extension)
+ (instancetype)imageViewWithImageName:(NSString *)imageName {
    
    return [[self alloc] initWithImage:[UIImage imageNamed:imageName]];
}
@end
