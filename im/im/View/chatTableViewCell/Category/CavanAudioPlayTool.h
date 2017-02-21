//
//  CavanAudioPlayTool.h
//  RubAndRub
//
//  Created by 擦擦科技 on 2016/10/21.
//  Copyright © 2016年 CaCaKeJi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <EMSDK.h>
@interface CavanAudioPlayTool : NSObject
+ (BOOL)playWithMessage:(EMMessage *)msg msgLabel:(UILabel *)msgLabel receiver:(BOOL)receiver;

+(void)stop;
@end
