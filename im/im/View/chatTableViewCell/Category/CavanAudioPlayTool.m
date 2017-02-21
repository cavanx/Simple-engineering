//
//  CavanAudioPlayTool.m
//  RubAndRub
//
//  Created by 擦擦科技 on 2016/10/21.
//  Copyright © 2016年 CaCaKeJi. All rights reserved.
//

#import "CavanAudioPlayTool.h"
#import "EMCDDeviceManager.h"

/** 全局的正在执行动画的ImageView */
static UIImageView *animatingImageView;


@implementation CavanAudioPlayTool

+ (BOOL)playWithMessage:(EMMessage *)msg msgLabel:(UILabel *)msgLabel receiver:(BOOL)receiver {
    // 把以前的动画移除
    [animatingImageView stopAnimating];
    [animatingImageView removeFromSuperview];
    // 1.播放语音
    // 获取语音路径
    EMVideoMessageBody *voiceBody = (EMVideoMessageBody *)msg.body;
    
    // 本地语音文件路径
    NSString *path = voiceBody.localPath;
    
    // 如果本地语音不存在，使用服务器语音
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:path]) {
        path = voiceBody.remotePath;
    }
    
    [[EMCDDeviceManager sharedInstance] asyncPlayingWithPath:path completion:^(NSError *error) {
        NSLog(@"播放完成 %@", error);
        // 移除动画
        [animatingImageView stopAnimating];
        [animatingImageView removeFromSuperview];
    }];
    
//    // 2. 添加动画
//    // 2.1 创建一个UIImageView 添加到label上
//    UIImageView *imgView = [[UIImageView alloc] init];
//    [msgLabel addSubview:imgView];
//    
//    // 2.2添加动画图片
//    if (receiver) {
//        imgView.animationImages = @[[UIImage imageNamed:@"voice_left_01"],
//                                    [UIImage imageNamed:@"voice_left_01"],
//                                    [UIImage imageNamed:@"voice_left_01"],
//                                    ];
//        imgView.frame = CGRectMake(0, 0, 20, 20);
//    } else {
//        imgView.animationImages = @[[UIImage imageNamed:@"voice_right_01"],
//                                    [UIImage imageNamed:@"voice_right_02"],
//                                    [UIImage imageNamed:@"voice_right_03"],
//                                    ];
//        imgView.frame = CGRectMake(0 , 0, 10, 10);
//    }
//    imgView.animationDuration = 1;
//    [imgView startAnimating];
//    animatingImageView = imgView;
    
    
    return self;
}

+ (void)stop {
    // 停止播放影音
    [[EMCDDeviceManager sharedInstance] stopPlaying];
    
    // 移除动画
    [animatingImageView stopAnimating];
    [animatingImageView removeFromSuperview];
}



@end
