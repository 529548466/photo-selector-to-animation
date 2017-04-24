//
//  HMStatusPictureCellCollectionViewCell.m
//  新浪微博 oc  写法
//
//  Created by jackhan on 16/3/23.
//  Copyright © 2016年 jackhan. All rights reserved.
//

#import "HMStatusPictureCellCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
#import "UIImage+Extension.h"
@implementation HMStatusPictureCellCollectionViewCell{
    UIImageView *_imageView;
    UIImageView *_gifIconView;
}

#pragma mark - 构造函数
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
     [self setupUI];
    }
    
    return self;
    
}
#pragma mark - 设置界面
- (void)setupUI {

 // 0. 创建控件
    _imageView = [[UIImageView alloc] init];
    _gifIconView = [UIImageView imageViewWithImageName:@"timeline_image_gif"];
    
    // 设置图片拉伸模式
    
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.clipsToBounds = YES;
    
    // 1. 添加控件
    [self.contentView addSubview:_imageView];
    [self.contentView addSubview:_gifIconView];
    // 2. 自动布局
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    [_gifIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
    }];



}
#pragma mark - 设置数据
-(void)setImageURL:(NSURL *)imageURL{
    [_imageView sd_setImageWithURL:imageURL placeholderImage:nil options:SDWebImageRefreshCached | SDWebImageRetryFailed];
//    _gifIconView.hidden = ![imageURL.absoluteString.pathExtension.lowercaseString isEqualToString:@"gif"];
}

@end
