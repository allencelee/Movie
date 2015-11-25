//
//  MoreViewController.m
//  WXMovie
//
//  Created by imac on 15/10/20.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "MoreViewController.h"
#import "LaunchController.h"




@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
    self.tableView.backgroundColor = [UIColor clearColor];
    

    [self showCaches];
//    [self performSelector:@selector(removeCaches) withObject:nil afterDelay:5];
    
    
    

}
//-(void)removeCaches{
//    
//    NSString *path = NSHomeDirectory();
//    
//    NSLog(@"%@",path);
//    
//    NSString *fullPath = [path stringByAppendingPathComponent:@"/Library/Caches/default/com.hackemist.SDWebImageCache.default"];
//
//    NSFileManager *manager = [NSFileManager defaultManager];
//    
//    [manager removeItemAtPath:fullPath error:nil];
//    
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"确定要清理缓存？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        
    
    }
    
    if (indexPath.row == 4) {

//        UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
       
//        UITabBarController *mainTBC = [main instantiateInitialViewController];
        
        LaunchController *launch=[[LaunchController alloc]init];
        
        launch.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        
        [self presentViewController:launch animated:YES completion:nil];
//
//        
//        [UIApplication sharedApplication].keyWindow.rootViewController = launch;
        

    
    }
    
    
}

-(void)showCaches{

    NSUInteger size = [[SDImageCache sharedImageCache]getSize];
    
    NSInteger Msize = size/1024/1024;
    
    _cachesLable.text = [NSString stringWithFormat:@"%ldM",Msize];
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex == 1) {
      
        [[SDImageCache sharedImageCache]clearDisk];
        
        [self showCaches];
        
    }
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
