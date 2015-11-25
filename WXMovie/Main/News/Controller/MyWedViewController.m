//
//  MyWedViewController.m
//  WXMovie
//
//  Created by imac on 15/10/23.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "MyWedViewController.h"

@interface MyWedViewController ()

@end

@implementation MyWedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    NSURL *url = [NSURL URLWithString:@"http://www.apple.com/cn/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_MyWebView loadRequest:request];
    

    
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
