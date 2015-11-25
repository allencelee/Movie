//
//  TopModel.h
//  WXMovie
//
//  Created by imac on 15/10/24.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 {
 "rating" : {
 "stars" : "50",
 "average" : 9.5,
 "min" : 0,
 "max" : 10
 },
 "collect_count" : 659005,
 "images" : {
 "small" : "http:\/\/img3.douban.com\/view\/photo\/icon\/public\/p480747492.jpg",
 "large" : "http:\/\/img3.douban.com\/view\/movie_poster_cover\/lpst\/public\/p480747492.jpg",
 "medium" : "http:\/\/img3.douban.com\/view\/movie_poster_cover\/spst\/public\/p480747492.jpg"
 },
 "id" : "1292052",
 "alt" : "http:\/\/movie.douban.com\/subject\/1292052\/",
 "title" : "肖申克的救赎",
 "subtype" : "movie",
 "year" : "1994",
 "original_title" : "The Shawshank Redemption"
 }
 */
@interface TopModel : NSObject

@property(nonatomic,strong)NSDictionary *images;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,strong)NSDictionary *rating;

@end
