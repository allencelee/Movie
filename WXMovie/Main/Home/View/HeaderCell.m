//
//  HeaderCell.m
//  WXMovie
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "HeaderCell.h"

@implementation HeaderCell

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
      
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, self.width-10, self.height)];
       
        [self.contentView addSubview:imageView];
    }
    return self;
}
-(void)setModel:(HomeModel *)model{

    _model = model;
    
    NSString *url = model.images[@"small"];
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:url]];
    
    
    
}

@end
