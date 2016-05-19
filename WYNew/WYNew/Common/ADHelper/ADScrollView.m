//
//  ADScrollView.m
//  zhangchu掌厨
//
//  Created by qianfeng on 15/12/10.
//  Copyright (c) 2015年 cl. All rights reserved.
//

#import "ADScrollView.h"
#import "UIImageView+WebCache.h"
#define VIEW_WIDTH self.bounds.size.width
#define VIEW_HEIGHT self.bounds.size.height
#define IMAGE_TIME_INTERVAL 3
@interface ADScrollView()<UIScrollViewDelegate>{
    UIImageView * _leftImageView; // 左视图
    UIImageView * _centerImageView; // 中间视图
    UIImageView * _rightImageView; // 右视图
    NSInteger _currentImageIndex; // 当前显示的图片序号
    UIPageControl * _pageControl; // 不解释
    NSTimer * _timer; // 自动滚动
    BOOL isAutoScroll; // 是否自动滚动
    UILabel * _titleLabel;
}
@end
@implementation ADScrollView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createImageView];
    }
    return self;
}
-(void)createImageView{
//    显示第一张图片
    _currentImageIndex = 0;
    // 创建ImageView并设置位置
    _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT)];

    [self addSubview:_leftImageView];
    _centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(VIEW_WIDTH , 0, VIEW_WIDTH , VIEW_HEIGHT)];
    
    [self addSubview:_centerImageView];
    
    _rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(VIEW_WIDTH * 2, 0, VIEW_WIDTH , VIEW_HEIGHT)];
    
    [self addSubview:_rightImageView];
    self.contentSize = CGSizeMake(VIEW_WIDTH * 3, VIEW_HEIGHT);
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.pagingEnabled = YES;
    //默认显示中间的图片
    self.contentOffset = CGPointMake(VIEW_WIDTH, 0);
    self.delegate = self;
}
-(void)createPageControl{
    // 一个点一般大小为20 * 20
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((VIEW_WIDTH - 20 * _imageArr.count) / 2 + self.frame.origin.x, VIEW_HEIGHT - 20 +self.frame.origin.y, 20 *_imageArr.count, 20)];
    _pageControl.numberOfPages = _imageArr.count;
     _pageControl.currentPage = _currentImageIndex;
    _pageControl.userInteractionEnabled = NO;
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((VIEW_WIDTH - 60 * _imageArr.count) / 2 + self.frame.origin.x , VIEW_HEIGHT -80 + self.frame.origin.y, 60 * _imageArr.count, 60)];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.numberOfLines = 0;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:18];
     // 判断是否已经添加到父视图，如果未添加，则抛出异常，由于此异常没有任何对象接收，所以程序崩溃
    if (self.superview) {
        [self.superview addSubview:_pageControl];
        [self.superview addSubview:_titleLabel];
    }
    else{
        NSLog(@"请先添加到父视图再reloadData");
         @throw nil;
    }
}
//减速停止了时执行，手触摸时执行
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //NSLog(@"结束滚动");
    //滚动结束回到中间
   // self.contentOffset = CGPointMake(VIEW_WIDTH, 0);
    if (_imageArr) {
        if (scrollView.contentOffset.x == 0) {
            //     NSLog(@"向左滚动");
            // 如果当前图片为第一张 在往左滑动就变为最后一张
            if (_currentImageIndex == 0) {
//向左滚动 成最后一张
                _currentImageIndex = _imageArr.count - 1;
            }else{
                
                _currentImageIndex--;
            }
        }
        //偏移为VIEW_WIDTH *2 当前图片向右在滑动
        if (scrollView.contentOffset.x == VIEW_WIDTH *2) {
             //    NSLog(@"向右滚动");
             // 如果当前图片为最后一张 在往右滑动就变为第一张
            if (_currentImageIndex == _imageArr.count -1) {
                _currentImageIndex = 0;
            }else{
                _currentImageIndex++;
            }
        }
        
        if (_currentImageIndex == 0) {
//            _leftImageView.image = [UIImage imageNamed:_imageArr[_imageArr.count -1]];
//            //当前图片
//            _centerImageView.image = [UIImage imageNamed:_imageArr[_currentImageIndex]];
//            _rightImageView.image = [UIImage imageNamed:_imageArr[_currentImageIndex+1]];
            // 当前为第一张 往左边滑动为 _imageArr.count - 1
            [self setImageWithUrlString:_imageArr[_imageArr.count - 1] inImageView:_leftImageView];
            [self setImageWithUrlString:_imageArr[_currentImageIndex] inImageView:_centerImageView];
            [self setImageWithUrlString:_imageArr[(_currentImageIndex + 1) % _imageArr.count] inImageView:_rightImageView];
        }else{
//            _leftImageView.image = [UIImage imageNamed:_imageArr[_currentImageIndex -1]];
//            _centerImageView.image = [UIImage imageNamed:_imageArr[_currentImageIndex]];
//         //   _rightImageView.image = [UIImage imageNamed:_imageArr[_currentImageIndex+1]];
//             _rightImageView.image = [UIImage imageNamed:_imageArr[(_currentImageIndex+1) % _imageArr.count]];
            [self setImageWithUrlString:_imageArr[_currentImageIndex - 1] inImageView:_leftImageView];
            [self setImageWithUrlString:_imageArr[_currentImageIndex] inImageView:_centerImageView];
            [self setImageWithUrlString:_imageArr[(_currentImageIndex + 1) % _imageArr.count] inImageView:_rightImageView];

        }
        _pageControl.currentPage = _currentImageIndex;
        
        //        将文字显示在图片上
        
                if (_pageControl.currentPage == 0) {
                    _titleLabel.text = self.labelArr[0];
                    _imageUrl = _imageUrlArr[0];
                   
                }else if (_pageControl.currentPage == 1){
                    _titleLabel.text = self.labelArr[1];
                    _imageUrl = _imageUrlArr[1];
                   
                }else if (_pageControl.currentPage == 2){
                    _titleLabel.text = self.labelArr[2];
                    _imageUrl = _imageUrlArr[2];
                    
                }else if (_pageControl.currentPage == 3){
                    _titleLabel.text = self.labelArr[3];
                    _imageUrl = _imageUrlArr[3];
                   
                }else if (_pageControl.currentPage == 4){
                    _titleLabel.text = self.labelArr[4];
                    _imageUrl = _imageUrlArr[4];
                   
                }
        
//        if (_pageControl.currentPage == 0) {
//            for (int i =0; i<=4; i++) {
//                if (_pageControl.currentPage == i) {
//                    _titleLabel.text = self.labelArr[i];
//                    _imageUrl = _imageUrlArr[i];
//                }
//                
//            }
//        }
//
        
        if (!isAutoScroll) {
            [_timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:IMAGE_TIME_INTERVAL]];
        }
        //定时器停止 图片回到中间
        isAutoScroll = NO;
        self.contentOffset = CGPointMake(VIEW_WIDTH, 0);
    }
}
//-(void)createTimer{
//    //创建的时候不自动滚动
//    isAutoScroll = NO;
//    _timer = [NSTimer scheduledTimerWithTimeInterval:IMAGE_TIME_INTERVAL target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
//}
-(void)scrollImage{
    isAutoScroll = YES;
    // 向右滚动一次
    [self  setContentOffset:CGPointMake(VIEW_WIDTH *2, 0) animated:YES];
    //[self  setContentOffset:CGPointMake(VIEW_WIDTH *2, 0)];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self scrollViewDidEndDecelerating:self];
    });

}
//重写数组方法
-(void)setImageArr:(NSArray *)imageArr{
    _imageArr = imageArr;
    //有了数组在创建  不然 滚动点 不出现
    [self createPageControl];
}
-(void)reloadData{
    //[self createPageControl];
    
    //图片数量大于等于当前图片数量
    if (_imageArr.count >=3) {
        _currentImageIndex = 0;
        //文字默认为0
        _titleLabel.text = _labelArr[0];
        _imageUrl = _imageUrlArr[0];
        
//        左边图片为最后一张
       // _leftImageView.image = [UIImage imageNamed:_imageArr[_imageArr.count -1]];
        [self setImageWithUrlString:_imageArr[_imageArr.count -1] inImageView:_leftImageView];
        [self setImageWithUrlString:_imageArr[_currentImageIndex] inImageView:_centerImageView];
        [self setImageWithUrlString:_imageArr[_currentImageIndex + 1] inImageView:_rightImageView];
     //   _centerImageView.image = [UIImage imageNamed:_imageArr[0]];
        //当前图片
        //_centerImageView.image = [UIImage imageNamed:_imageArr[_currentImageIndex]];
       // _rightImageView.image = [UIImage imageNamed:_imageArr[_currentImageIndex+1]];
//       大于3 调用定时器
//        [self createTimer];
    }
}
-(void)setImageWithUrlString:(NSString*)urlString inImageView:(UIImageView*)imageView{
    if ([urlString hasPrefix:@"http://"]) {
      //[imageView setImageWithUrlString:urlString];
        
        //三方库导入图片
    [imageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
    }else{
        [imageView setImage:[UIImage imageNamed:urlString]];
    }
}


@end




