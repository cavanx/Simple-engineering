//
//  FriendsTableViewCell.h
//  im
//
//  Created by 历成栋 on 2017/2/20.
//  Copyright © 2017年 cavan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendsTableViewCell : UITableViewCell

@property (nonatomic,strong)UIImageView *headImageName;

@property (nonatomic,strong)UILabel *nickName;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
