//
//  CinemaCell.m
//  WXMovie
//
//  Created by imac on 15/10/29.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "CinemaCell.h"

@implementation CinemaCell

- (void)awakeFromNib {

    
}

-(void)setModel:(CinemaModel *)model{

    _model = model;
    
//    if (model!=nil) {
    _nameLable.text = _model.name;
    
    _gradeLable.text = _model.grade;
    
    _addressLable.text = _model.address;
    
    _lowPriceLable.text = [ NSString stringWithFormat:@"$%@",_model.lowPrice];
    
    _zuo.image = [UIImage imageNamed:@"cinemaSeatMark@2x"];
    
    _quan.image = [UIImage imageNamed:@"cinemaCouponMark@2x"];
        
//    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
