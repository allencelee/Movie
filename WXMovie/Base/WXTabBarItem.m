//
//  WXTabBarItem.m
//  WXMovie
//
//  Created by imac on 15/10/20.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "WXTabBarItem.h"
#define kImageWidth 20
@implementation WXTabBarItem

-(instancetype)initWithFrame:(CGRect)frame
               withImageName:(NSString*)imageName
                    withText:(NSString*)title{

    if (self=[super initWithFrame:frame]) {
      
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width-kImageWidth)/2, 8, kImageWidth,kImageWidth)];
        
        _imageView.image=[UIImage imageNamed:imageName];
        
        _imageView.contentMode=UIViewContentModeScaleAspectFit;
        
        [self addSubview:_imageView];
        
        //初始化显示title
        
        _textLable = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_imageView.frame),frame.size.width, 14)];
        _textLable.textAlignment=NSTextAlignmentCenter;
        _textLable.text=title;
        _textLable.textColor=[UIColor whiteColor];
        _textLable.font=[UIFont systemFontOfSize:10];
        [self addSubview:_textLable];
    }
    return self;
}



@end
