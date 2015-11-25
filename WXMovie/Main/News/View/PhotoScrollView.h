//
//  PhotoScrollView.h
//  WXMovie
//
//  Created by imac on 15/10/27.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView<UIScrollViewDelegate>
{

    UIImageView *imageView;
}
@property(nonatomic,copy)NSString *imageString;

@end
