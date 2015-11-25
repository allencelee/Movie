//
//  HomeViewController.h
//  WXMovie
//
//  Created by imac on 15/10/20.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "HomeModel.h"

@interface HomeViewController : BaseViewController
{

    __weak IBOutlet UITableView *MyTableView;
    

    
    HomeModel *homeModel;
    
}
@end
