//
//  MainTabbarViewController.m
//  CustomTabbar
//
//  Created by imac on 15/10/12.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "MainTabbarViewController.h"
#import "WXTabBarItem.h"
//#define KScreenWidth [UIScreen mainScreen].bounds.size.width
@interface MainTabbarViewController ()
{
    UIImageView *selectedImaV;
}
@end

@implementation MainTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1,设置子视图控制器
//    [self creatViewController];
    // 2,自定义标签栏
    [self creatTabbar];
    
}

-(void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    //删除自带的tabBarbutton
    Class tabBarButton = NSClassFromString(@"UITabBarbutton");
    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:[tabBarButton class]]) {
            [view removeFromSuperview];
        }
        
    }
    
}
-(void)creatTabbar{
    
    UIView *tabbarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49)];
    [self.tabBar addSubview:tabbarView];
    
    
    UIImageView *bgImageView=[[UIImageView alloc]initWithFrame:tabbarView.bounds];
    
    bgImageView.image=[UIImage imageNamed:@"UIStatusBarStyleLightContent"];
    [tabbarView addSubview:bgImageView];
    
    NSArray *imaArray=@[@"icon_cinema",
                        @"msg_new",
                        @"start_top250",
                        @"movie_cinema",
                        @"more_setting"];
    
    NSArray *imaName=@[@"首页",
                       @"新闻",
                       @"top",
                       @"影院",
                       @"更多"];
    
        for (int i=0; i<self.viewControllers.count; i++) {
            
        NSString *imageN=imaArray[i];
        NSString *title=imaName[i];
        WXTabBarItem *item = [[WXTabBarItem alloc]initWithFrame:CGRectMake(i*kScreenWidth/imaArray.count, 0, kScreenWidth/imaArray.count, 49)
                                                  withImageName:imageN
                                                       withText:title];

        

        
        item.tag=100+i;
        
        [tabbarView addSubview:item];
        
        [item addTarget:self action:@selector(changeAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    selectedImaV=[[UIImageView alloc]initWithFrame:CGRectMake(9, 0, kScreenWidth/imaArray.count-15, 49)];
    
    selectedImaV.image=[UIImage imageNamed:@"selectTabbar_bg_all1"];
    
    [tabbarView addSubview:selectedImaV];
    
    [tabbarView insertSubview:selectedImaV atIndex:1];
    
}



-(void)changeAction:(UIButton *)button{

    self.selectedIndex=button.tag-100;
    [UIView animateWithDuration:0.15 animations:^{
        selectedImaV.center=button.center ;
    }];

    
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
