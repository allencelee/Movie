//
//  imageModel.h
//  WXMovie
//
//  Created by imac on 15/10/24.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 
 {
 "id": 2238621,
 "image": "http://img31.mtime.cn/pi/2013/02/04/093444.29353753_1280X720.jpg",
 "type": 6
 },
 */
@interface imageModel : NSObject

@property(nonatomic,copy)NSNumber *selfID;
@property(nonatomic,copy)NSString *image;
@property(nonatomic,copy)NSNumber *type;

@end
