//
//  PostCell.m
//  WXMovie
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "PostCell.h"

@implementation PostCell

{

    UIImageView *imageV;
}

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        self.contentView.transform = CGAffineTransformMakeScale(0.95, 0.95);
        imageV = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
        
        [self.contentView addSubview:imageV];
        
    }
    return self;
}

-(void)setModel:(HomeModel *)model{

    _model = model;
    
    [imageV sd_setImageWithURL:[NSURL URLWithString:_model.images[@"large"]]];
}
@end
