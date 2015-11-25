//
//  BaseJsonData.m
//  WXMovie
//
//  Created by imac on 15/10/24.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "BaseJsonData.h"

@implementation BaseJsonData

+(id)requestJsonDataFromName:(NSString*)fileName{

    NSString *path = [[NSBundle mainBundle]pathForResource:fileName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    id requestData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    return requestData;
}
@end
