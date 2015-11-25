//
//  TopHeaderView.m
//  WXMovie
//
//  Created by imac on 15/10/28.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "TopHeaderView.h"
#import "TopHeaderView.h"
#import <MediaPlayer/MediaPlayer.h>
#import "TopViewController.h"

@class DetailViewC;
@implementation TopHeaderView


-(void)awakeFromNib{

    
}

-(void)setController:(UIViewController *)controller{

    _controller = controller;
    
}

-(void)setModel:(TopHeaderModel *)model{
    
    _model = model;
   
    _titleLable.text = _model.titleCn;
    
    _directorLable.text = _model.location;
    
    _contentLable.text = _model.content;
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_model.image]];

    NSArray *buttonArr = @[_button1,_button2,_button3,_button4];
    
    for (int i=0; i<4; i++) {
        
        NSArray *videoArr = _model.videos;
        
        NSDictionary *dic = videoArr[i];
        
        UIButton *but = buttonArr[i];
        
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:dic[@"image"]]]];
        
        [but setBackgroundImage:image forState:UIControlStateNormal];
        
        [but addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
}

-(void)buttonAction:(UIButton*)button{

    long index=button.tag-200;
    
    NSArray *arr=_model.videos;
    
    NSDictionary *dic=arr[index];
    
    NSString *urlStr=dic[@"url"];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    MPMoviePlayerViewController *playerVC = [[MPMoviePlayerViewController alloc]initWithContentURL:url];
    
    [_controller presentViewController:playerVC animated:YES completion:NULL ];
    
    NSLog(@"url:%@",url);
    
}



@end
