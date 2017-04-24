//
//  CollectionPhototoseeViewCell.m
//  新浪微博 oc  写法
//
//  Created by max on 2017/4/21.
//  Copyright © 2017年 jackhan. All rights reserved.
//

#import "CollectionPhototoseeViewCell.h"
#import "YZGProgressView.h"
#import "UIImageView+WebCache.h"
#import "UIView+MKPExtension.h"
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface CollectionPhototoseeViewCell()<UIScrollViewDelegate,UIGestureRecognizerDelegate>
@property (nonatomic ,strong) UIScrollView *scrollView;
@property (nonatomic ,strong) UIImageView *imageView;
@property (nonatomic ,strong) YZGProgressView * ProgressView;
@end
extern UIViewController * vc5;
@implementation CollectionPhototoseeViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
-(void)setup{
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.delegate = self;
//    self.ProgressView.frame = CGRectMake(ScreenWidth/5, ScreenHeight/2, 100, 100);
    
    [self.contentView addSubview:self.scrollView];
    [self.scrollView addSubview:self.imageView];
    [self.contentView addSubview:self.ProgressView];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    tap.delegate=self;
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:tap];
    [self addGestureRecognizer:tap];
    
    CGRect rect = [UIScreen mainScreen].bounds;
//    rect.size.width -= 20;
    self.scrollView.frame = rect;
}
-(void)setUrl:(NSURL *)url{
    self.ProgressView.hidden = NO;
    self.ProgressView.center = self.scrollView.center;
//    self.ProgressView.centerX =self.scrollView.center.x -20;
    self.ProgressView.size = CGSizeMake(50, 50);
    
    self.imageView.transform = CGAffineTransformIdentity;
    // 重设 scrollView 的内容属性
    self.scrollView.contentInset = UIEdgeInsetsZero;
    self.scrollView.contentOffset = CGPointZero;
    self.scrollView.contentSize = CGSizeZero;
    
    [self.imageView sd_setImageWithURL:[self bmiddleURL:url] placeholderImage:nil options:SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.ProgressView.progress = (CGFloat)receivedSize/(CGFloat)expectedSize ;
        });
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.ProgressView.hidden = YES;
        CGFloat w = self.scrollView.bounds.size.width;
        CGFloat h = image.size.height * w / image.size.width;
        CGSize size = CGSizeMake(w, h);
        if (size.height<self.scrollView.bounds.size.height) {
            self.imageView.frame = CGRectMake(0, 0, size.width, size.height);
            CGFloat y = (self.scrollView.bounds.size.height - size.height)*0.5;
            self.scrollView.contentInset = UIEdgeInsetsMake(y, 0, 0, 0);
        }else{
           self.imageView.frame = CGRectMake(0, 0, size.width, size.height);
            self.scrollView.contentSize = size;
        }
        
    }];
}
-(NSURL *)bmiddleURL:(NSURL *)url{
    
    NSString *url1 = [url absoluteString];
    NSString *url3  =    [url1 stringByReplacingOccurrencesOfString:@"/thumbnail/" withString:@"/bmiddle/"];
    NSURL * url2 =  [NSURL URLWithString:url3];
    
    return url2;
    
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}
-(void)tap{
     [vc5 dismissViewControllerAnimated:YES completion:nil];
}
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    if (scale<1) {
        
        [vc5 dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    [UIView animateWithDuration:0.2 animations:^{
        CGFloat offsetY = (scrollView.bounds.size.height - view.frame.size.height) * 0.5;
        offsetY = offsetY < 0 ? 0 : offsetY;
        CGFloat offsetX = (scrollView.bounds.size.width - view.frame.size.width) * 0.5;
        offsetX = offsetX < 0 ? 0 : offsetX;
        self.scrollView.contentInset = UIEdgeInsetsMake(offsetY, offsetX, 0, 0);
    }];
  
}

-(UIScrollView *)scrollView{
    if (_scrollView == nil) {
        _scrollView  = [[UIScrollView alloc]init];
    }
    return _scrollView;
}
-(UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}
-(YZGProgressView *)ProgressView{
    if (_ProgressView == nil) {
        _ProgressView = [[YZGProgressView alloc]init];
    }
    return _ProgressView;
}
@end
