//
//  myImageViewController.h
//  WXMovie
//
//  Created by imac on 15/10/23.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "imageModel.h"
#import "imageCell.h"
#import "PhotoViewController.h"
@interface myImageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *myCollectionViewFlowLayout;


@end
