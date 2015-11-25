//
//  BaseNavigationController.m
//  WXMovie
//
//  Created by imac on 15/10/20.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1 设置导航栏
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64@2x"] forBarMetrics:UIBarMetricsDefault];
    //2 设置字体颜色
    NSDictionary *fontDic=@{NSFontAttributeName:[UIFont systemFontOfSize:20],
                 NSForegroundColorAttributeName:[UIColor whiteColor]};
    [self.navigationBar setTitleTextAttributes:fontDic];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
