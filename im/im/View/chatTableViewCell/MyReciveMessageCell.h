//
//  MyReciveMessageCell.h
//  im
//
//  Created by 历成栋 on 2017/2/21.
//  Copyright © 2017年 cavan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EMSDK.h>
//static NSString *ReceiverCell = @"";
//static NSString *SenderCell = @"";
#define RECEVERCELLID @"ReceiverCell"

@protocol CavanChatWithFriendsCellDelegate <NSObject>

-(void)didClickFriendHeadView:(NSInteger)cellRow;

@end
@interface MyReciveMessageCell : UITableViewCell

/**
 接收到的聊天消息
 */
@property (weak, nonatomic) IBOutlet UILabel *reciveChatLable;

/**
 用户昵称
 */
@property (weak, nonatomic) IBOutlet UILabel *nickNameLable;
/**
 消息模型
 */
@property (nonatomic, strong) EMMessage *message;
- (CGFloat)cellHeight;

@property (nonatomic,weak) id<CavanChatWithFriendsCellDelegate> headImagedelegate;
@property(nonatomic,assign)NSInteger cellRow;//点击的行数

@end
