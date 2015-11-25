//
//  PostView.h
//  WXMovie
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeCell.h"
#import "PostCollectionView.h"
#import "HomeModel.h"
@interface PostView : UIView

{

    UIView *_headerView;
}
@property(nonatomic,strong)NSArray *jsonArray;
@end
