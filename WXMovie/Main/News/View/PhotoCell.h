//
//  PhotoCell.h
//  WXMovie
//
//  Created by imac on 15/10/27.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoScrollView.h"
#import "imageModel.h"

@interface PhotoCell : UICollectionViewCell

@property(nonatomic,strong)PhotoScrollView *scrollView;
@property(nonatomic,strong)imageModel *model;

@end
