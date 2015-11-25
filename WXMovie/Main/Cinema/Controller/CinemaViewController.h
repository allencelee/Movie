//
//  CinemaViewController.h
//  WXMovie
//
//  Created by imac on 15/10/20.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CinemaTableView.h"
@interface CinemaViewController : BaseViewController
@property (weak, nonatomic) IBOutlet CinemaTableView *myTableView;

@end
