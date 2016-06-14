//
//  NewFeatureCell.m
//  VideoGuide-master
//
//  Created by Sino on 16/6/14.
//  Copyright © 2016年 夏明伟. All rights reserved.
//

#import "NewFeatureCell.h"
#import <MediaPlayer/MediaPlayer.h>

@interface NewFeatureCell()
@property (nonatomic ,weak)UIImageView *imageView;
@property (nonatomic ,strong)MPMoviePlayerController *moviePlayer;

@end

@implementation NewFeatureCell

- (UIImageView *)imageView
{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.moviePlayer.view.bounds];
        [self.moviePlayer.view addSubview:imageView];
        _imageView = imageView;
    }
    return _imageView;
}

- (MPMoviePlayerController *)moviePlayer
{
    if (!_moviePlayer) {
        _moviePlayer = [[MPMoviePlayerController alloc]init];
        _moviePlayer.view.frame = self.contentView.frame;
        
        [_moviePlayer setShouldAutoplay:YES];
        _moviePlayer.movieSourceType = MPMovieSourceTypeFile;
        _moviePlayer.controlStyle = MPMovieControlStyleNone;
        [self.contentView addSubview:_moviePlayer.view];
        /** *  监听状态改变 */
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(loadStatus) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playEnd) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
  
    }
    return _moviePlayer;
}

- (void)loadStatus
{
    if (self.moviePlayer.loadState == MPMovieLoadStatePlaythroughOK) {
        self.imageView.hidden = YES;
        
        [self.moviePlayer play];
    }
}

- (void)playEnd{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:PlayFinishedNotify object:nil];
    
}

#pragma mark loadData
- (void)setVideoPath:(NSString *)videoPath
{
    _videoPath = videoPath;
    
    [self.moviePlayer stop];
    self.moviePlayer.contentURL = [[NSURL alloc]initFileURLWithPath:videoPath];
    [self.moviePlayer prepareToPlay];
}

- (void)setVideoImage:(UIImage *)videoImage
{
    _videoImage = videoImage;
    
    self.imageView.image = videoImage;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


@end
