//
//  MyTableViewCell.m
//  WXMovie
//
//  Created by imac on 15/10/23.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(NewsModel *)model{

    _model = model;
    
    _titleLable.text = model.title;
    _summaryLable.text = model.summary;
    NSString *imageUrl = model.image;
    NSURL *url = [[NSURL alloc]initWithString:imageUrl];
    [_postImageView sd_setImageWithURL:url];
   
    //设置圆角
    _postImageView.layer.cornerRadius = 35;
    _postImageView.layer.masksToBounds =YES;
    
    int type = [model.type intValue];
    if (type == 0) {
        _typeImage.image = nil;
    }else if (type == 1){//图片新闻

        _typeImage.image = [UIImage imageNamed:@"sctpxw"];
    }else if (type==2 ){//视频新闻
        _typeImage.image = [UIImage imageNamed:@"scspxw"];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
