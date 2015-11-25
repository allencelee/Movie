//
//  HomeViewController.m
//  WXMovie
//
//  Created by imac on 15/10/20.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "HomeViewController.h"
#import "homeCell.h"
#import "PostView.h"
#import "PostCollectionView.h"
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>

{

    NSMutableArray *modelArr;
    PostView *postView;
    
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets=NO;
    
    modelArr=[[NSMutableArray alloc]init];
    
    [self creatPostView];
    //加载json数据
    [self loadJsonData];

    MyTableView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    UIView *buttonV=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    //按钮1
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [button1 setFrame:buttonV.frame];
    [button1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    [buttonV addSubview:button1];
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button1.tag=200;
    //按钮2
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [button2 setFrame:buttonV.frame];
    [button2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    [buttonV addSubview:button2];
    [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button2.tag=201;
    button2.hidden=YES;
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:buttonV];
    MyTableView.rowHeight=120;
    
 
    postView.hidden=YES;

    //创建滑动视图

}


#pragma mark - creatPostView

-(void)creatPostView{

    self.navigationController.navigationBar.translucent = NO;
    
    postView = [[PostView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-49)];
    
    postView.backgroundColor = [UIColor clearColor];
    
    
    [self.view addSubview:postView];


}

#pragma mark - loadJsonData
-(void)loadJsonData{

    NSString *path=[[NSBundle mainBundle]pathForResource:@"us_box" ofType:@"json"];
    
    NSData *jsonData=[[NSData alloc]initWithContentsOfFile:path];
    NSDictionary *jsonDic=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    NSArray *subjects=jsonDic[@"subjects"];

    
    for (NSDictionary *dic in subjects) {
        
        HomeModel *model=[[HomeModel alloc]init];
        NSDictionary *subDic=dic[@"subject"];
        model.title=subDic[@"title"];
        model.year=subDic[@"year"];
        model.rating=subDic[@"rating"];
        model.images=subDic[@"images"];
        [modelArr addObject:model];
        
    }
    
    postView.jsonArray = modelArr;

}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return modelArr.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //cell重用  记得改xib里的idenitfy
    static NSString *identify=@"cell";
    
    homeCell *cell=[tableView dequeueReusableCellWithIdentifier:identify];
    
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"homeCell" owner:self options:nil]lastObject];
    }
    [cell setModel:modelArr[indexPath.row]];

    cell.backgroundColor=[UIColor clearColor];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
#pragma mark - navigation
-(void)buttonAction:(UIButton *)but{

    UIView *buttonView=self.navigationItem.rightBarButtonItem.customView;
    UIButton *button1=(UIButton *)[buttonView viewWithTag:200];
    UIButton *button2=(UIButton *)[buttonView viewWithTag:201];
    
    button1.hidden=!button1.hidden;
    button2.hidden=!button2.hidden;
    
    [self flip:buttonView withFlag:button1.hidden];
    
    [self flip:self.view withFlag:button1.hidden];
    
    MyTableView.hidden=!MyTableView.hidden;
    
    postView.hidden=!postView.hidden;

}

-(void)flip:(UIView*)view withFlag:(BOOL)flag{

    //翻转动画
    UIViewAnimationOptions option=flag?UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    
    [UIView transitionWithView:view duration:.5 options:option animations:^{
        
    } completion:nil];

    [view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
}


@end
