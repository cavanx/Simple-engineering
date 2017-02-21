//
//  FriendsTableViewCell.m
//  im
//
//  Created by 历成栋 on 2017/2/20.
//  Copyright © 2017年 cavan. All rights reserved.
//

#import "FriendsTableViewCell.h"



@implementation FriendsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    {
             // NSLog(@"cellForRowAtIndexPath");
            static NSString *identifier = @"status";
        // 1.缓存中取
            FriendsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            // 2.创建
             if (cell == nil)
             {
                    cell = [[FriendsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            return cell;
    }
    
}
    
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addwidgets];
    }
    return self;
}
-(void)addwidgets{
    UIImageView *headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10,60, 60)];
    self.headImageName  = headImageView;
    [self addSubview:headImageView];
    UILabel *nickname = [[UILabel alloc]initWithFrame:CGRectMake(95,32 , self.frame.size.width-self.frame.size.height*2-30, 16)];
    [nickname setFont:[UIFont systemFontOfSize:15]];
    [nickname setTextColor:[UIColor blackColor]];
    self.nickName = nickname;
    [self addSubview:nickname];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
