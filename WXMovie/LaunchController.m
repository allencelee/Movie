//
//  LaunchController.m
//  WXMovie
//
//  Created by imac on 15/10/30.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "LaunchController.h"

@interface LaunchController ()

{

    UIScrollView *launchScrollView;
}
@end

@implementation LaunchController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self creatScrollView];
    
    
    
}

-(void)creatScrollView{

    launchScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    launchScrollView.contentSize  = CGSizeMake(5*kScreenWidth, kScreenHeight);
    
    launchScrollView.delegate = self;
    
    launchScrollView.pagingEnabled = YES;
    
    [self.view addSubview:launchScrollView];

    
    for (int i = 0; i<5; i++) {
        
        NSString *imageName = [NSString stringWithFormat:@"guide%d",i+1];
        
        UIImage *image = [UIImage imageNamed:imageName];
        
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth*i, 0, kScreenWidth, kScreenHeight)];
        
        imageV.tag = 100+i;
        
        [imageV setImage:image];
        
        imageV.userInteractionEnabled = YES;
        
        UIImageView *progressView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/2-90+i*kScreenWidth, kScreenHeight-50, 173, 26)];
        
        NSString *progressName = [NSString stringWithFormat:@"guideProgress%d",i+1];
        
        [progressView setImage:[UIImage imageNamed:progressName]];
        
        [launchScrollView addSubview:imageV];
        
        [launchScrollView addSubview:progressView];

        if (i==4) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [button setFrame:CGRectMake(kScreenWidth/2-40, kScreenHeight-120, 80, 40)];
            
            [button setTitle:@"现在开始" forState:UIControlStateNormal];
            
            button.tag = 200;
            
            button.layer.cornerRadius = 16;
            
            button.backgroundColor = [UIColor colorWithRed:0.3 green:0.1 blue:0.1 alpha:1];
            
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [imageV addSubview:button];
            
//            button.hidden = YES;
        }
        
        
    }

    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    UIImageView *imageV = (UIImageView*)[self.view viewWithTag:104];
    UIButton *but = (UIButton*)[imageV viewWithTag:200];
    
    int index = scrollView.contentOffset.x/kScreenWidth;
    
    if (index ==4 ) {
        
        but.hidden = NO;
    }else{
    
        but.hidden = YES;
    }
}

-(void)buttonAction:(UIButton*)but{

    
    
    
    
    if ([[UIApplication sharedApplication].keyWindow.rootViewController isKindOfClass:[UITabBarController class]]) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }else{
        
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UITabBarController *tabBarController = [main instantiateInitialViewController];
    NSLog(@"%@",tabBarController);
    
    [UIApplication sharedApplication].keyWindow.rootViewController =tabBarController;
    
    tabBarController.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    
    [UIView animateWithDuration:1 animations:^{
        
    tabBarController.view.transform = CGAffineTransformIdentity ;
        
    }];}

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
