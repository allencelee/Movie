//
//  imageCell.m
//  WXMovie
//
//  Created by imac on 15/10/24.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "imageCell.h"

@implementation imageCell


-(void)setModel:(imageModel *)model{

    _model = model;
    
    [_myImageView sd_setImageWithURL:[NSURL URLWithString:model.image]];

    
}
-(void)awakeFromNib{

    self.layer.borderWidth=2;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    
    
}
@end
