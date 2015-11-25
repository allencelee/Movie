//
//  PhotoScrollView.m
//  WXMovie
//
//  Created by imac on 15/10/27.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "PhotoScrollView.h"

@implementation PhotoScrollView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self initView];
        
    }
    return self;
}

-(void)initView{

    self.maximumZoomScale = 2;
    
    self.minimumZoomScale = 1;
    
    self.delegate = self;
    
    imageView = [[UIImageView alloc]initWithFrame:self.bounds];
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self addSubview:imageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    
    tap.numberOfTapsRequired = 2;
    
    tap.numberOfTouchesRequired = 1;
    
    [self addGestureRecognizer:tap];
    
}
-(void)tapAction{

    float scale =  self.zoomScale > 1 ? 1:2;

    [self setZoomScale:scale animated:YES];
    
}


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{

    return imageView;

}

-(void)setImageString:(NSString *)imageString{
    
    _imageString = imageString;
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:_imageString]];

}


@end
