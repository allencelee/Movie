//
//  StarView.m
//  WXMovie
//
//  Created by imac on 15/10/21.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "StarView.h"
#import "homeCell.h"
@implementation StarView


//如果不从xib加载则使用init方法
//-(instancetype)initWithFrame:(CGRect)frame{
//
//    if (self=[super init]) {
//        
//        [self creatSubViews];
//    }
//    return self;
//    
//}
//
//-(void)creatSubViews{
//    UIImage *yellowStar = [UIImage imageNamed:@"yellow"];
//    UIImage *grayStar = [UIImage imageNamed:@"gray"];
//    yellowView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, yellowStar.size.width*5, yellowStar.size.width)];
//    yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowStar];
//    grayView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, yellowStar.size.width*5,yellowStar.size.width )];
//    grayView.backgroundColor = [UIColor colorWithPatternImage:grayStar];
//    [self addSubview:grayView];
//    [self addSubview:yellowView];
//    self.width=5*self.height;
//    CGFloat scale = self.height/yellowStar.size.height;
//    yellowView.transform = CGAffineTransformMakeScale(scale, scale);
//    grayView.transform = CGAffineTransformMakeScale(scale, scale);
//    yellowView.origin=CGPointZero;
//    grayView.origin = CGPointZero;
//}

-(void)awakeFromNib{
    //1.初始化星星视图
    UIImage *yellowStar = [UIImage imageNamed:@"yellow"];
    UIImage *grayStar = [UIImage imageNamed:@"gray"];
    yellowView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, yellowStar.size.width*5, yellowStar.size.width)];
    yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowStar];
    
    
    grayView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, yellowStar.size.width*5,yellowStar.size.width )];
    grayView.backgroundColor = [UIColor colorWithPatternImage:grayStar];
    
    
    [self addSubview:grayView];
    [self addSubview:yellowView];
    //2.设置本身宽度=高度的5倍
    self.width=5*self.height;
    
    CGFloat scale = self.height/yellowStar.size.height;
    //3.修改transform
    yellowView.transform = CGAffineTransformMakeScale(scale, scale);
    grayView.transform = CGAffineTransformMakeScale(scale, scale);
    //4.改回坐标
    yellowView.origin=CGPointZero;
    grayView.origin = CGPointZero;
    
}
-(void)setRating:(float )rating{

    _rating=rating;
    
    CGFloat width = _rating/10*self.width;
    
    yellowView.width=width;
    
}


@end
