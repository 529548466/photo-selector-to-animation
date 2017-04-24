//
//  ViewController.m
//  转场动画
//
//  Created by max on 2017/4/24.
//  Copyright © 2017年 max. All rights reserved.
//

#import "ViewController.h"
#import "HMStatusPictureView.h"
#import "Masonry.h"

@interface ViewController ()
@property (nonatomic ,strong) HMStatusPictureView *PictureView ;
@end
UIViewController * vc5;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    vc5 = self;
    
    
     _PictureView = [[HMStatusPictureView alloc]init];
    _PictureView.backgroundColor = [UIColor whiteColor];
    _PictureView.frame = CGRectMake(10, 100,320, 100);
    
    NSURL *url = [NSURL URLWithString:@"http://wx1.sinaimg.cn/thumbnail/005w9hMTly1fexo6qegv6j30fa0a675c.jpg"];
    NSURL *url2 = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493024669838&di=fad5f438ce02f661786830b6cc5acde1&imgtype=0&src=http%3A%2F%2Fdl.bizhi.sogou.com%2Fimages%2F2012%2F03%2F14%2F124196.jpg"];
    NSURL *url3 = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493024669838&di=48ee584c8a1a760a43bae0df62657cd2&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fpic%2Fitem%2Fe5ff0081cb237db138012f73.jpg"];
    NSURL *url4 = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493024669838&di=fbd75e203f06e2b33a011ac85def97fa&imgtype=0&src=http%3A%2F%2Fsucai.qqjay.com%2Fqqjayxiaowo%2F201210%2F26%2F1.jpg"];
    NSURL *url5 = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493024669837&di=182dd277bb6ecbbdcb96fbb14cca1275&imgtype=0&src=http%3A%2F%2Fpic55.nipic.com%2Ffile%2F20141208%2F19462408_171130083000_2.jpg"];
    NSURL *url6 = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493024669837&di=fa2eac8c0dbe30d9255178f081123a4c&imgtype=0&src=http%3A%2F%2Fimg13.poco.cn%2Fmypoco%2Fmyphoto%2F20120828%2F15%2F55689209201208281549023849547194135_001.jpg"];
    NSURL *url7 = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493024669837&di=b02b293c6664b1fd097bf5b3bce216a2&imgtype=0&src=http%3A%2F%2Fd.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F0e2442a7d933c895623a9a8fd11373f0830200f9.jpg"];
    NSURL *url8 = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493024669836&di=beb137839c4fe44addb5cc7afd5236b7&imgtype=0&src=http%3A%2F%2Fpic54.nipic.com%2Ffile%2F20141127%2F300220_135749354000_2.jpg"];
    NSURL *url9 = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1493024669836&di=269f5677a7b334f3303fcf8ec5da0061&imgtype=0&src=http%3A%2F%2Fm2.quanjing.com%2F2m%2Falamyrf005%2Fb1fw89.jpg"];
    
    
    NSArray *arry = @[url,url2,url3,url4,url5,url6,url7,url8,url9];
    _PictureView.urls = arry;
    [self.view addSubview:_PictureView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(HMStatusPictureView *)PictureView{
//    if (_PictureView == nil) {
//       
//        
//    }
//    return _PictureView;
//}


@end
