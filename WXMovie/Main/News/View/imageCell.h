//
//  imageCell.h
//  WXMovie
//
//  Created by imac on 15/10/24.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "imageModel.h"
@interface imageCell : UICollectionViewCell

@property(nonatomic,strong)imageModel *model;

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@end
