//
//  TopCell.m
//  WXMovie
//
//  Created by imac on 15/10/24.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "TopCell.h"

@implementation TopCell

- (void)awakeFromNib {

    _myTitleLabel.backgroundColor = [UIColor colorWithWhite:.3 alpha:.7];
}

-(void)setModel:(TopModel *)model{

    _model = model;
    
    [_myImageView sd_setImageWithURL:model.images[@"medium"]];
    _myTitleLabel.text = model.title;
    
    float ratNum = [model.rating[@"average"] floatValue];
    NSString *rat = [NSString stringWithFormat:@"%.1lf",ratNum];
    _ratingLabel.text = rat;
    _starView.rating = ratNum;
    _starView.backgroundColor = [UIColor clearColor];
    
    
    
}

@end
