//
//  homeCell.h
//  WXMovie
//
//  Created by imac on 15/10/21.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "StarView.h"
@interface homeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *postView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIView *ratingView;
@property (weak, nonatomic) IBOutlet UILabel *ratingLable;
@property (weak, nonatomic) IBOutlet UILabel *yearLable;
@property (weak, nonatomic) IBOutlet StarView *starView;
@property(nonatomic,strong)HomeModel *model;

@end
