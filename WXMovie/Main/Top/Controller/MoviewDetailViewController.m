//
//  MoviewDetailViewController.m
//  WXMovie
//
//  Created by imac on 15/10/28.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "MoviewDetailViewController.h"
#import "DetailCell.h"
#import "TopDetailModel.h"
#import "TopHeaderModel.h"
#import "TopHeaderView.h"
@interface MoviewDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

{

    NSMutableArray *detailArray;
    
    NSIndexPath *_indexPath;
    
    TopHeaderView *headerView;
    
    TopHeaderModel *headerModel;
    
}

@end

@implementation MoviewDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    self.navigationController.navigationBar.translucent=NO;

    [self loadJsonData];
    
    [self creatUI];
    
}


-(void)loadJsonData{

    detailArray = [[NSMutableArray alloc]init];
    
    NSDictionary *HeaderDic = [BaseJsonData requestJsonDataFromName:@"movie_detail"];
    
    headerModel = [[TopHeaderModel alloc]initWithDic:HeaderDic];
    
    NSDictionary *detailDic = [BaseJsonData requestJsonDataFromName:@"movie_comment"];
    
    NSArray *arr=detailDic[@"list"];
    
    for (NSDictionary *dic in arr) {
        
        TopDetailModel *detailModel = [[TopDetailModel alloc]initWithDic:dic];
        
        [detailArray addObject:detailModel];
    }
    
    
    
    
    
}

-(void)creatUI{

    [_MyTablView registerNib:[UINib nibWithNibName:@"DetailCell" bundle:nil] forCellReuseIdentifier:@"DetailCell"];
    
//    _MyTablView.rowHeight = 80;
    
    UIView *superView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 222)];
    
    headerView = [[[NSBundle mainBundle]loadNibNamed:@"TopHeaderView" owner:self options:nil]lastObject];
    
    [superView addSubview:headerView];
    
    headerView.model = headerModel;
    
    _MyTablView.tableHeaderView = superView;
    
    headerView.backgroundColor = [UIColor clearColor];
    
    headerView.controller = self;
    
    
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return detailArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell" forIndexPath:indexPath];
    
    cell.model = detailArray[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    _indexPath = indexPath;
    
    [_MyTablView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if ([_indexPath isEqual:indexPath]) {
        
        TopDetailModel *model=detailArray[indexPath.row];
        
        NSString *content = model.content;
        
        CGRect frame = [content boundingRectWithSize:CGSizeMake(239.00/320*kScreenWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
        
        CGFloat height = frame.size.height+60+5;
        
        return height;
        
    }
    return 86;
}
@end
