//
//  CinamaModel.h
//  WXMovie
//
//  Created by imac on 15/10/29.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "BaseModel.h"
/*
 {
	"districtList" : [ {
 "name" : "东城区",
 "id" : "1029"
 }, {
 "name" : "西城区",
 "id" : "1011"
 }, {
 "name" : "海淀区",
 "id" : "1015"
 }, {
 "name" : "朝阳区",
 "id" : "1019"
 
 */


@interface DistrictModel : BaseModel

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *DistrictModelId;


@end
