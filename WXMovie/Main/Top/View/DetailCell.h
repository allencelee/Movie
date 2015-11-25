//
//  DetailCell.h
//  WXMovie
//
//  Created by imac on 15/10/28.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopDetailModel.h"
@interface DetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;

@property (weak, nonatomic) IBOutlet UILabel *nickNameLable;

@property (weak, nonatomic) IBOutlet UILabel *ratingLable;

@property (weak, nonatomic) IBOutlet UILabel *contentLable;


@property(nonatomic,strong)TopDetailModel *model;
@end
