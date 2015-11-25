//
//  TopCell.h
//  WXMovie
//
//  Created by imac on 15/10/24.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopModel.h"
@interface TopCell : UICollectionViewCell

@property(nonatomic,strong)TopModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *myTitleLabel;

@property (weak, nonatomic) IBOutlet StarView *starView;

@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@end
