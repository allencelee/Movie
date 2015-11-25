//
//  PhotoCell.m
//  WXMovie
//
//  Created by imac on 15/10/27.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        _scrollView = [[PhotoScrollView alloc]initWithFrame:self.bounds];
        

        [self addSubview:_scrollView];
        
    }
    return self;
}

-(void)setModel:(imageModel *)model{

    _model = model;
    
    NSString *imageStr = model.image;
    
    _scrollView.imageString = imageStr;
    
    
}

@end
