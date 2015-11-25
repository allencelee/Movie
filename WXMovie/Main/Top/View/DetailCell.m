//
//  DetailCell.m
//  WXMovie
//
//  Created by imac on 15/10/28.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "DetailCell.h"

@implementation DetailCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(TopDetailModel *)model{


    [_userImageView sd_setImageWithURL:[NSURL URLWithString:model.userImage]];
    
    _nickNameLable.text = model.nickname;
    
    _ratingLable.text = model.rating;
    
    _contentLable.text = model.content;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
