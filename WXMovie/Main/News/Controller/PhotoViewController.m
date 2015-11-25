//
//  PhotoViewController.m
//  WXMovie
//
//  Created by imac on 15/10/27.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>
{
    UICollectionView *photoCollectionV;
}
@end

static NSString *identify = @"PhotoCell";
@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"图片浏览";
    
    [self initCollectionView];
    
}

-(void)initCollectionView{

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight);
    layout.minimumLineSpacing=0;
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    layout.minimumInteritemSpacing = 0;
    
    photoCollectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) collectionViewLayout:layout];
    
    photoCollectionV.delegate = self;
    
    photoCollectionV.dataSource = self;
    
    photoCollectionV.pagingEnabled = YES;
    
    [self.view addSubview:photoCollectionV];
    
    [photoCollectionV registerClass:[PhotoCell class] forCellWithReuseIdentifier:identify];
    
    [photoCollectionV scrollToItemAtIndexPath:_indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    

}

#pragma mark  - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _data.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
  
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    cell.model = _data[indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{

    PhotoCell *pCell=(PhotoCell*)cell;
    
    [pCell.scrollView setZoomScale:1];

}

@end
