//
//  NewFeatureViewController.h
//  VideoGuide-master
//
//  Created by Sino on 16/6/14.
//  Copyright © 2016年 夏明伟. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MW_Width [UIScreen mainScreen].bounds.size.width
#define MW_Height [UIScreen mainScreen].bounds.size.height
#define Key_Window [UIApplication sharedApplication].keyWindow

@interface NewFeatureViewController : UICollectionViewController

@property (nonatomic , strong)NSArray *videoGuideImages;
@property (nonatomic ,strong)NSArray *videoPaths;

@property (nonatomic ,copy)void (^lastVideoPlayEnd)();

+ (NewFeatureViewController *)setUpNewFuture;
@end
