//
//  MWFlowLayout.m
//  VideoGuide-master
//
//  Created by Sino on 16/6/14.
//  Copyright © 2016年 夏明伟. All rights reserved.
//

#import "MWFlowLayout.h"

@implementation MWFlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;//水平方向
    self.minimumLineSpacing = 0;//行间距(最小值)
    self.minimumInteritemSpacing = 0;//两个item之间的间距
    
    self.itemSize = self.collectionView.bounds.size;
    
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;// 设置是否回弹
    self.collectionView.pagingEnabled = YES;
    
}

@end
