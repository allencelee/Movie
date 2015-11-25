//
//  CinemaCell.h
//  WXMovie
//
//  Created by imac on 15/10/29.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaModel.h"
@interface CinemaCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *gradeLable;
@property (weak, nonatomic) IBOutlet UILabel *addressLable;
@property (weak, nonatomic) IBOutlet UILabel *lowPriceLable;
@property (weak, nonatomic) IBOutlet UIImageView *zuo;
@property (weak, nonatomic) IBOutlet UIImageView *quan;
@property(nonatomic,strong) CinemaModel *model;

@end
