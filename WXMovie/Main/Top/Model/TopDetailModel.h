//
//  TopDetailModel.h
//  WXMovie
//
//  Created by imac on 15/10/28.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 "list" : [
 {
 "userImage" : "http://img2.mtime.com/images/default/head.gif",
 "nickname" : "yangna988",
 "rating" : "9.0",
 "content" : "儿子很喜欢 一直期盼上映"

 */
@interface TopDetailModel : BaseModel

@property(nonatomic,copy)NSString *userImage;
@property(nonatomic,copy)NSString *nickname;
@property(nonatomic,copy)NSString *rating;
@property(nonatomic,copy)NSString *content;

@end
