//
//  homeCell.m
//  WXMovie
//
//  Created by imac on 15/10/21.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "homeCell.h"
#import "StarView.h"
@implementation homeCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(HomeModel*)model{

    _model=model;
    _titleLable.text =_model.title;
    NSNumber *ratingNum=_model.rating[@"average"];
    
    float ratingNumber = [ratingNum floatValue];
    
    NSString *ratingString = [NSString stringWithFormat:@"%.1f",ratingNumber];
    
    _ratingLable.text=ratingString;

    _yearLable.text=[NSString stringWithFormat:@"年份：%@",_model.year ];
    
    NSString *imageUrl=_model.images[@"medium"];
    
    NSURL *url= [[NSURL alloc]initWithString:imageUrl];
    
    [_postView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"test.jpg"]];
    
    _starView.rating = ratingNumber;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
