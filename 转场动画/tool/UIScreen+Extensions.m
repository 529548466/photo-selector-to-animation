//
//  UIScreen+Extensions.m
//  新浪微博 oc  写法
//
//  Created by jackhan on 16/3/18.
//  Copyright © 2016年 jackhan. All rights reserved.
//

#import "UIScreen+Extensions.h"

@implementation UIScreen (Extensions)
+ (CGSize)screenSize {
    return [UIScreen mainScreen].bounds.size;
}

+ (BOOL)isRetina {
    return [UIScreen scale] >= 2;
}

+ (CGFloat)scale {
    return [UIScreen mainScreen].scale;
}
@end
