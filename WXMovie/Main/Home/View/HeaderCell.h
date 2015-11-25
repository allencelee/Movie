//
//  HeaderCell.h
//  WXMovie
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
@interface HeaderCell : UICollectionViewCell
{
    
    UIImageView *imageView;
}
@property(nonatomic,strong)HomeModel *model;
@end
