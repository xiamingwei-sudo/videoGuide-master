//
//  NewFeatureViewController.m
//  VideoGuide-master
//
//  Created by Sino on 16/6/14.
//  Copyright © 2016年 夏明伟. All rights reserved.
//

#import "NewFeatureViewController.h"
#import "MWFlowLayout.h"
#import "NewFeatureCell.h"

@interface NewFeatureViewController ()

@property (nonatomic , strong)UIPageControl *pageControl;

@property (nonatomic,assign, getter=isVideoFinished)BOOL videoFinished;


@end

@implementation NewFeatureViewController

static NSString * const reuseIdentifier = @"NewFeatureCell";

+ (NewFeatureViewController *)setUpNewFuture
{
    NewFeatureViewController *newFeatureVC = [[NewFeatureViewController alloc] init];
    // 设置本地视频路径数组
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<4; i++) {
        [array addObject:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"guide%d",i] ofType:@"mp4"]];
    }
    newFeatureVC.videoPaths = array;
    // 设置封面图片数组
    newFeatureVC.videoGuideImages = @[@"guide0", @"guide1", @"guide2", @"guide3"];
    // 设置最后一个视频播放完成之后的block
    [newFeatureVC setLastVideoPlayEnd:^{
//        UINavigationController *rootNav = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
//        [UIApplication sharedApplication].keyWindow.rootViewController = rootNav;
        NSLog(@"last end and have tap");
    }];
    return newFeatureVC;
}


- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        
        CGFloat width = 120;
        CGFloat height = 30;
        CGFloat x = (MW_Width - width)/2.0f;
        CGFloat y= (MW_Height -30- 20);
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(x, y, width, height)];
        _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        [Key_Window addSubview:_pageControl];
    }
    return _pageControl;
}
- (instancetype)init{
   
    return [super initWithCollectionViewLayout:[[MWFlowLayout alloc]init]];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUp];

}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.pageControl.numberOfPages = self.videoGuideImages.count;
}

- (void)setUp{
    [self.collectionView registerClass:[NewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(videoPlayEnd) name:PlayFinishedNotify object:nil];
}
- (void)videoPlayEnd{
    self.videoFinished = YES;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.videoGuideImages.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewFeatureCell *itemCell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    itemCell.videoImage = [UIImage imageNamed:self.videoGuideImages[indexPath.row]];
    itemCell.videoPath = self.videoPaths[indexPath.row];
    
    self.videoFinished= NO;
    return itemCell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.videoGuideImages.count -1 && self.videoFinished) {
        if (self.lastVideoPlayEnd) {
            self.lastVideoPlayEnd();
        }
    }
}

- (void)dealloc
{
    [self.pageControl removeFromSuperview];
    self.pageControl = nil;
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    uint page = (scrollView.contentOffset.x / scrollView.bounds.size.width) + 0.5;
    self.pageControl.currentPage = page;
}

@end
