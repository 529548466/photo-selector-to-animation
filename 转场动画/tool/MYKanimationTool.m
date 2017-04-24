//
//  MYKanimationTool.m
//  ZhongQiKJ
//
//  Created by max on 2017/4/10.
//  Copyright © 2017年 美优卡. All rights reserved.
//

#import "MYKanimationTool.h"
#import "ViewPhototoSeeController.h"
//#import "SDWebImage/UIImageView+WebCache.h"
#import "UIImageView+WebCache.h"
#import "CollectionPhototoseeViewCell.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@implementation MYKanimationTool
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    self.CollectionView.delegate1 = self;
    self.isPresented = NO;
    return self;
}
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    self.isPresented = YES;
    return self;
}
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    /**
     *  dismissing
     */
    if (self.isPresented) {
        [self executeDismissAnimation:transitionContext];
    } else {
        [self executePresentationAnimation:transitionContext];
    }
}


/**
 *  present 动画
 *
 *  @param transitionContext
 */
- (void)executePresentationAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifycationChange:) name:@"liandong" object:nil];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [transitionContext.containerView addSubview:toView];
    ViewPhototoSeeController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toViewController.view.userInteractionEnabled = YES;
    toViewController.collectionView.hidden =YES;
//    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];

    UIImageView *vc = [[UIImageView alloc]init];
    [vc sd_setImageWithURL:self.url];
    [vc sizeToFit];
    vc.contentMode = UIViewContentModeScaleAspectFill;
    vc.clipsToBounds = YES;
    vc.frame  = self.Rect;
    [transitionContext.containerView addSubview:vc];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    toView.alpha = 0;

    [UIView animateWithDuration:duration animations:^{
//        toViewController.view.alpha = 1;
        UIImage * imge = [[[SDWebImageManager sharedManager] imageCache] imageFromDiskCacheForKey:[self.url absoluteString]];
        
        CGFloat w = ScreenWidth;
        CGFloat h = imge.size.height*w/imge.size.width;
        CGFloat height = ScreenHeight;
        CGFloat y = 0;
        if (h<height) {
            y = (height - h)*0.5;
        }
        vc.frame = CGRectMake(0, y, w, h);
        toView.alpha = 1;
       
    } completion:^(BOOL finished) {
//       toViewController.view.hidden = NO;
        toViewController.collectionView.hidden =NO;
        [vc removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}

//-(NSURL *)bmiddleURL:(NSURL *)url{
//    
//    NSString *url1 = [url absoluteString];
//    NSString *url3  =    [url1 stringByReplacingOccurrencesOfString:@"/thumbnail/" withString:@"/bmiddle/"];
//    NSURL * url2 =  [NSURL URLWithString:url3];
//    
//    return url2;
//    
//}
/**
 *  dismiss 动画
 *
 *  @param transitionContext
 */
- (void)executeDismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    [fromView removeFromSuperview];
    UIImageView *vc = [[UIImageView alloc]init];
    if (self.urls.count < self.path.item) {
         [vc sd_setImageWithURL:self.url];
        
    }else{
        NSURL * url = self.urls[self.path.item];
        [vc sd_setImageWithURL:url];
    }

    [vc sizeToFit];
    vc.contentMode = UIViewContentModeScaleAspectFill;
    vc.clipsToBounds = YES;
    UIImage * imge = [[[SDWebImageManager sharedManager] imageCache] imageFromDiskCacheForKey:[self.url absoluteString]];
    
    CGFloat w = ScreenWidth;
    CGFloat h = imge.size.height*w/imge.size.width;
    CGFloat height = ScreenHeight;
    CGFloat y = 0;
    if (h<height) {
        y = (height - h)*0.5;
    }
    vc.frame = CGRectMake(0, y, w, h);

   
    [transitionContext.containerView addSubview:vc];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
//    fromView.alpha = 1;
    
    [UIView animateWithDuration:duration animations:^{
        //        toViewController.view.alpha = 1;
        
        
         vc.frame  = self.Rect;
        
    } completion:^(BOOL finished) {
        //       toViewController.view.hidden = NO;
//        toViewController.collectionView.hidden =NO;
        [vc removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];

}
-(void)StarView:(CGRect)Rect indexPath:(NSIndexPath *)path{
    self.Rect = Rect;
    self.path = path;
}

@end
