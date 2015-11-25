//
//  TopViewController.h
//  WXMovie
//
//  Created by imac on 15/10/20.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "TopModel.h"
#import "TopCell.h"
@interface TopViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *myCollectionFlowLayOut;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@end
