//
//  HomeModel.h
//  WXMovie
//
//  Created by imac on 15/10/21.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *year;
@property(nonatomic,strong)NSDictionary *rating;
@property(nonatomic,copy)NSString *original_title;
@property(nonatomic,strong)NSDictionary *images;

@end
