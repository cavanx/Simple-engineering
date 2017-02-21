//
//  LoginView.h
//  im
//
//  Created by  on 2017/2/20.
//  Copyright © 2017年 cavan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CavanLoginViewdelegate <NSObject>
-(void)ackButtonClick:(UIButton *)ackBtn userName:(NSString *)username passWord:(NSString *)password isLogin:(BOOL)islogin CavanError:(NSString *)cavanError;
@end

@interface LoginView : UIView


@property (nonatomic, weak) id<CavanLoginViewdelegate>delegate;
@end
