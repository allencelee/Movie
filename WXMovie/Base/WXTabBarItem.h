//
//  WXTabBarItem.h
//  WXMovie
//
//  Created by imac on 15/10/20.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXTabBarItem : UIControl

{
    UIImageView *_imageView;
    UILabel *_textLable;
}

-(instancetype)initWithFrame:(CGRect)frame
               withImageName:(NSString*)imageName
                    withText:(NSString*)title;


@end
