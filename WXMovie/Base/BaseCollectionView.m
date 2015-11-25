//
//  BaseCollectionView.m
//  WXMovie
//
//  Created by imac on 15/10/27.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView

-(instancetype)initWithFrame:(CGRect)frame {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    flowLayout.minimumLineSpacing= 0;
    
    if (self = [super initWithFrame:frame collectionViewLayout:flowLayout]) {
        
        self.dataSource = self ;
        
        self.delegate = self ;
        
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        
    }
    
    return self;
    
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _jsonArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
    
}
#pragma mark - flowLayoutDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize itemZize = CGSizeMake(_itemWidth, self.height);
    
    return itemZize;
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    CGFloat offsetY = (kScreenWidth-_itemWidth)/2;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, offsetY, 0, offsetY);
    
    return insets;
    
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    //    NSLog(@"%lf",scrollView.contentOffset.x);
    NSLog(@"%lf",targetContentOffset->x);
    
    int index = (targetContentOffset->x+(_itemWidth/2))/_itemWidth;
    
    NSLog(@"%d",index);
    
    CGFloat contentOffsetX = index*_itemWidth;
    
    targetContentOffset->x = contentOffsetX;
    
    self.currentPage=index;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.currentPage != indexPath.row) {
        
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        self.currentPage = indexPath.row;
    }
}

@end
