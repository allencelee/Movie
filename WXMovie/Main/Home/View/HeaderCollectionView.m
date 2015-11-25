//
//  HeaderCollectionView.m
//  WXMovie
//
//  Created by imac on 15/10/26.
//  Copyright (c) 2015年 rulay. All rights reserved.
//

#import "HeaderCollectionView.h"
#import "HeaderCell.h"
@implementation HeaderCollectionView

static NSString *identify = @"HeaderCell";

-(instancetype)initWithFrame:(CGRect)frame {
    
    
    if (self = [super initWithFrame:frame ]) {
        
        [self registerClass:[HeaderCell class] forCellWithReuseIdentifier:identify];
        
    }
    
    return self;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    cell.model = self.jsonArray[indexPath.row];
    
    //    cell.backgroundColor = [UIColor redColor];
    return cell;
    
}

@end
