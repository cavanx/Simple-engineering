//
//  LoginController.m
//  im
//
//  Created by 历成栋 on 2017/2/19.
//  Copyright © 2017年 cavan. All rights reserved.
//

#import "LoginController.h"
#import "LoginView.h"
#import <EMSDK.h>
#import "MBProgressHUD+MJ.h"
#import "CavanTbaController.h"
@interface LoginController ()<CavanLoginViewdelegate>
@property (nonatomic,strong) LoginView *loginViews;
@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    // Do any additional setup after loading the view.
}
- (void)setupViews {
    self.loginViews = [[LoginView alloc]initWithFrame:CGRectMake(0, 0, CAVAN_SCRWIDTH, CAVAN_SCRHEIGTH)];
    self.loginViews.delegate = self;
    self.view = self.loginViews;
}

- (void)ackButtonClick:(UIButton *)ackBtn userName:(NSString *)username passWord:(NSString *)password isLogin:(BOOL)islogin CavanError:(NSString *)cavanError{
    if (cavanError ==nil) {
        if (islogin) {
            [MBProgressHUD showMessage:@"正在登录..."];
            [self loginWithUserName:username password:password];
        }else{
            [MBProgressHUD showMessage:@"正在注册..."];
            [self registerWithUserName:username passWord:password];
        }
    }else{
        [MBProgressHUD showError:cavanError];
    }
}

-(void)registerWithUserName:(NSString *)userName passWord:(NSString *)password{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        EMError *error = [[EMClient sharedClient] registerWithUsername:userName password:password];
        dispatch_async(dispatch_get_main_queue(), ^{
        if (error==nil) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showSuccess:@"注册成功"];
            [self loginWithUserName:userName password:password];
        }else{
            NSLog(@"%@",error.errorDescription);
        }
        });
    });
}

-(void)loginWithUserName:(NSString *)userName password:(NSString *)password{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        EMError *error = [[EMClient sharedClient] loginWithUsername:userName password:password];
            dispatch_async(dispatch_get_main_queue(), ^{
            if (error==nil) {
                [MBProgressHUD hideHUD];
                [[EMClient sharedClient].options setIsAutoLogin:YES];
                [MBProgressHUD showSuccess:@"登录成功"];
                self.view.window.rootViewController = [[CavanTbaController alloc]init];
            }else{
                NSLog(@"%@",error.errorDescription);
            }
        });
    });
}

- (void)didConnectionStateChanged:(EMConnectionState)aConnectionState{
    if (aConnectionState == EMConnectionConnected) {
        NSLog(@"网络连接成功");
    }else{
        NSLog(@"网络连接失败");
    }
}
- (void)didLoginFromOtherDevice{
    NSLog(@"你的账号在其他设备上登录");
}
- (void)didAutoLoginWithError:(EMError *)aError{
    if (!aError) {
        NSLog(@"自动登录成功-");
    }else{
        NSLog(@"自动登录失败-");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
StatusBar
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
