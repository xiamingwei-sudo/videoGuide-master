//
//  NewFeatureCell.h
//  VideoGuide-master
//
//  Created by Sino on 16/6/14.
//  Copyright © 2016年 夏明伟. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PlayFinishedNotify @"PlayFinishedNotify"
@interface NewFeatureCell : UICollectionViewCell

@property (nonatomic , strong)UIImage *videoImage;

@property (nonatomic , copy)NSString *videoPath;

@end
