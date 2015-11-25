//
//  NewsViewController.m
//  WXMovie
//
//  Created by imac on 15/10/20.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModel.h"
#import "MyTableViewCell.h"
#import "myImageViewController.h"
#import "MyWedViewController.h"
#define HeaderHeight 200
@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>

{

    NSMutableArray *jsonArray;
    UIImageView *headerView;
    UILabel *lable;
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1,加载数据
    [self loadJsonData];
    //2.创建视图
    [self creatUI];
    //3.视图显示数据

    
}

-(void)loadJsonData{

    jsonArray = [[NSMutableArray alloc]init];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"news_list.json" ofType:nil];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    for (NSDictionary *dic in dataArray) {
        
        NewsModel *model = [[NewsModel alloc]initWithDic:dic];
        
//        model.image = dic[@"image"];
//        model.title = dic[@"title"];
//        model.type = dic[@"type"];
//        model.summary = dic[@"summary"];
        
        [jsonArray addObject:model];
    }
    
    
}

-(void)creatUI{

    UINib *nib = [UINib nibWithNibName:@"MyTableViewCell" bundle:nil];
    [_myTableView registerNib:nib forCellReuseIdentifier:@"cell"];
    
    _myTableView.rowHeight = 80;
    
    headerView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, HeaderHeight)];
    
    [self.view addSubview:headerView];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, HeaderHeight)];
    
    view.backgroundColor = [UIColor clearColor];
    NewsModel *firstModel = jsonArray[0];
    NSURL *url = [NSURL URLWithString:firstModel.image];
    [headerView sd_setImageWithURL:url];
    
    lable = [[UILabel alloc]initWithFrame:CGRectMake(0, headerView.bottom-30, kScreenWidth, 30)];
    lable.text = firstModel.title;
    lable.textAlignment = NSTextAlignmentCenter;
    lable.backgroundColor = [UIColor colorWithWhite:0.2 alpha:.5];
    lable.textColor = [UIColor whiteColor];
    [self.view addSubview:lable];
    
    _myTableView.tableHeaderView = view;
    

    
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return jsonArray.count-1 ;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.model = jsonArray[indexPath.row +1];
    
    return cell;
}


#pragma mark - UITableViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat contentOffsetY = scrollView.contentOffset.y;
    if (contentOffsetY<0) {//往下拉
        
        CGFloat h = HeaderHeight-(contentOffsetY);
        CGFloat w = kScreenWidth*h/HeaderHeight;
        headerView.frame = CGRectMake(-(w-kScreenWidth)/2, 0, w, h);
        
    }else if (contentOffsetY>0){
    
        headerView.top=-contentOffsetY;
        
    }
    lable.bottom = headerView.bottom;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    myImageViewController *imageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"myImageViewController"];
    imageVC.hidesBottomBarWhenPushed = YES;
    MyWedViewController *webVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MyWedViewController"];
    webVC .hidesBottomBarWhenPushed = YES;
    
    if (indexPath.row%2==0) {
        [self.navigationController pushViewController:imageVC animated:YES];
        
    }else if (indexPath.row%2==1){
    
        [self.navigationController pushViewController:webVC animated:YES];
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
