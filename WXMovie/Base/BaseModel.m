//
//  BaseModel.m
//  WXMovie
//
//  Created by imac on 15/10/28.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel


-(instancetype)initWithDic:(NSDictionary*)dic{

    if (self = [super init]) {
     
        [self buildRalationShip:dic];
        
    }
    
    return self;
}

-(SEL)changeKeyStrToSetKey:(NSString *)key{

    //2.获得key字符串里面的第一个字母然后大写
    
    NSString *firstStr = [[key substringToIndex:1] uppercaseString];
    
    NSString *lastStr = [key substringFromIndex:1];
    
    NSString *setStr = nil;
    
    if ([key isEqualToString:@"id"]) {
        
        setStr = [NSString stringWithFormat:@"set%@%@%@:",NSStringFromClass([self class]),firstStr,lastStr];
    }else{
    
        setStr = [NSString stringWithFormat:@"set%@%@:",firstStr,lastStr];
    }
    //   3. NSSelectorFromString 把字符串转化成方法
    
    return NSSelectorFromString(setStr);
}

-(void)buildRalationShip:(NSDictionary *)dic{

    /*
     1.拿到字典里面所有的key
     2.拼接字符串类型的setKey方法
     3.把setKey字符串转化成方法
     4.把字典里面的value值设置给model
     */
    //1.
    NSArray *allKeys = [dic allKeys];
    
    for (NSString *key in allKeys) {
        
        SEL method = [self changeKeyStrToSetKey:key];
        
        id value = dic[key];
        
        if ([self respondsToSelector:method]) {
            
            [self performSelector:method withObject:value];
        }
    }
    
}

@end
