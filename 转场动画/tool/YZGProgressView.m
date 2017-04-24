//
//  YZGProgressView.m
//  新浪微博 oc  写法
//
//  Created by max on 2017/4/22.
//  Copyright © 2017年 jackhan. All rights reserved.
//

#import "YZGProgressView.h"
@interface YZGProgressView()
@property (nonatomic , strong) UIImageView * ImageView;\
@property (nonatomic , assign)CGFloat progress1;
@end
@implementation YZGProgressView


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:CGRectZero]) {
        [self setup];
    }
    return self;
}

-(void)setup{
    
    self.backgroundColor = [UIColor clearColor];
}
-(void)setProgress:(CGFloat)progress{
    self.progress1 = progress;
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect {
    CGPoint center = CGPointMake(rect.size.width*0.5, rect.size.height*0.5);
    CGFloat r = MIN(rect.size.height, rect.size.height) * 0.5;
    CGFloat start = -M_PI_2;
    CGFloat end = start + self.progress1 *2* M_PI;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:center radius:r startAngle:start endAngle:end clockwise:YES];
    [path addLineToPoint:center];
    [path closePath];
    [[UIColor colorWithWhite:1.0 alpha:0.4] setFill];
    [path fill];
    
}


@end



