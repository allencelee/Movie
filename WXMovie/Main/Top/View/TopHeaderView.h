//
//  TopHeaderView.h
//  WXMovie
//
//  Created by imac on 15/10/28.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopHeaderModel.h"
@interface TopHeaderView : UIView

@property(nonatomic,strong)TopHeaderModel *model;
@property (weak, nonatomic) IBOutlet UITextView *contentLable;
@property (weak, nonatomic) IBOutlet UILabel *directorLable;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;

@property(nonatomic,strong)UIViewController *controller;

@end
