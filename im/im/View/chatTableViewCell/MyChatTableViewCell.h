//
//  MyChatTableViewCell.h
//  im
//
//  Created by 历成栋 on 2017/2/21.
//  Copyright © 2017年 cavan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EMSDK.h>
#define SENDCELLID @"SenderCell"
@interface MyChatTableViewCell : UITableViewCell
/**
 消息模型
 */
@property (nonatomic, strong) EMMessage *message;
/** 占位图片 */

- (CGFloat)cellHeight;
@end
