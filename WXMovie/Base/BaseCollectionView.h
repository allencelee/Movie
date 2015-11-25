//
//  BaseCollectionView.h
//  WXMovie
//
//  Created by imac on 15/10/27.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@property CGFloat itemWidth;
@property NSInteger currentPage;
@property NSArray *jsonArray;

@end
