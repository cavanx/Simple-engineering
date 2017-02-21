//
//  LoginView.m
//  im
//
//  Created by  on 2017/2/20.
//  Copyright © 2017年 cavan. All rights reserved.
//

#import "LoginView.h"

@interface LoginView ()<UITextFieldDelegate>

@property (nonatomic,assign) CGFloat LoginView_W;

@property (nonatomic,assign) CGFloat LoginView_H;

@property (nonatomic,strong) UIImageView *BackGroundImageView;

@property (nonatomic,strong) UIButton *loginBtn;

@property (nonatomic,strong) UIButton *registerBtn;

@property (nonatomic,strong) UIButton *ackButton;

@property (nonatomic,assign) BOOL isLoginBtn;

@property (nonatomic,weak) UITextField *UserNameText;

@property (nonatomic,weak) UITextField *PassWordText;


@end


@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.LoginView_W = frame.size.width;
        self.LoginView_H = frame.size.height;
        [self s_setupViews];
    }
    return self;
}
- (void)s_setupViews{
    self.BackGroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,self.LoginView_W , self.LoginView_H)];
    
    self.BackGroundImageView.userInteractionEnabled = YES;
    self.BackGroundImageView.image = [UIImage imageNamed:@"background"];
    [self addSubview:self.BackGroundImageView];
    CGFloat BtnItemW = 33;
    CGFloat BtnItemH = 25;
    CGFloat loginX = 24;
    CGFloat loginY = 29;
    self.loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(loginX, loginY, BtnItemW, BtnItemH)];
    self.loginBtn.selected = YES;
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.BackGroundImageView addSubview:self.loginBtn];
    [self.loginBtn addTarget:self action:@selector(setLoginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    CGFloat registerBtnX = loginX + BtnItemW + 19;
    CGFloat registerBtnY = loginY;
    self.registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(registerBtnX, registerBtnY, BtnItemW, BtnItemH)];
    [self.registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.BackGroundImageView addSubview:self.registerBtn];
    [self btnSelect];
    [self.registerBtn addTarget:self action:@selector(setRegisterBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addTextField];
    [self addAckButton];
}
-(void)addTextField{
    UITextField *user = [[UITextField alloc]init];
    UITextField *pass = [[UITextField alloc]init];
    self.UserNameText = user;
    self.PassWordText = pass;
    [self settextField:self.UserNameText Parentviews:self.BackGroundImageView isPassword:NO textFieldFramex:30 textFieldFramey:100 textFieldFramew:self.frame.size.width-60 textFieldFrameh:35 textFieldBackColor:CAVANColor(242, 242, 242) PlaceHolder:@"手机号" placeHolderColor:CAVANColor(51, 51, 51) placeHolderTextFont:[UIFont systemFontOfSize:12] isleftImage:YES textFiledLiftViewImag:@"textfield_phone" distanceToLeftOfCursor:5];
    
    [self settextField:self.PassWordText Parentviews:self.BackGroundImageView isPassword:YES textFieldFramex:30 textFieldFramey:150 textFieldFramew:self.frame.size.width-60 textFieldFrameh:35 textFieldBackColor:CAVANColor(242, 242, 242) PlaceHolder:@"密码" placeHolderColor:CAVANColor(51, 51, 51) placeHolderTextFont:[UIFont systemFontOfSize:12] isleftImage:YES textFiledLiftViewImag:@"textfield_phone" distanceToLeftOfCursor:5];
}
-(void)addAckButton{
    self.ackButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.ackButton.frame = CGRectMake(60, 225, self.frame.size.width-120, 44);
    self.ackButton.clipsToBounds=YES;
    self.ackButton.layer.cornerRadius=5;
    [self.BackGroundImageView addSubview:self.ackButton];
    [self.ackButton setTitle:@"确 认" forState:UIControlStateNormal];
    [self.ackButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.ackButton setBackgroundColor:CAVANColor(61, 139, 179)];
    [self.ackButton addTarget:self action:@selector(ackButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

/*
 添加textfield的方法
 
 @param textField 要初始化的textfield
 @param ParentView textField的父视图
 @param isPassWord 是否是密码框
 @param X X坐标
 @param Y Y坐标
 @param W 宽
 @param H 高
 @param backColor textfield的背景颜色
 @param placeholdertext placeholdertext的内容
 @param color 颜色（输入的文本，placeholdertext）
 @param font 文本的大小
 @param isLeftImage
 @param imageName 左边视图的图片
 @param distance 光标右移
 */
-(void)settextField:(UITextField *)textField Parentviews:(UIView *)ParentView isPassword:(BOOL)isPassWord textFieldFramex:(CGFloat)X textFieldFramey:(CGFloat)Y textFieldFramew:(CGFloat)W textFieldFrameh:(CGFloat)H textFieldBackColor:(UIColor *)backColor PlaceHolder:(NSString *)placeholdertext placeHolderColor:(UIColor *)color  placeHolderTextFont:(UIFont *)font isleftImage:(BOOL) isLeftImage textFiledLiftViewImag:(NSString *)imageName  distanceToLeftOfCursor:(CGFloat)distance{
    textField.frame =CGRectMake(X, Y, W, H);
    textField.font = font;
    textField.delegate = self;
    textField.tintColor = [UIColor blackColor];
    textField.textColor = color;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.clearButtonMode = UITextFieldViewModeAlways;
    [ParentView addSubview:textField];
    if (isPassWord) {
        textField.secureTextEntry = YES;
        textField.clearsOnBeginEditing = YES; 
    }else{
        textField.secureTextEntry = NO;
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }
    [textField setBackgroundColor:backColor];
    NSString *placeholderText = placeholdertext;
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc]initWithString:placeholderText];
    [placeholder addAttribute:NSForegroundColorAttributeName
                        value:color
                        range:NSMakeRange(0, placeholderText.length)];
    [placeholder addAttribute:NSFontAttributeName
                        value:font
                        range:NSMakeRange(0, placeholderText.length)];
    textField.attributedPlaceholder = placeholder;
    
    UIView *clearView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, H+distance, H)];
    clearView.backgroundColor = [UIColor clearColor];
    if (isLeftImage) {
        
        UIImageView *textimg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, H, H)];
        textimg.image = [UIImage imageNamed:imageName];
        [clearView addSubview:textimg];
        textField.leftView = clearView;
    }else{
        textField.leftView = clearView;
    }
    textField.leftViewMode = UITextFieldViewModeAlways;

}
-(void)setLoginBtnClick:(UIButton *)loginBtn{
    loginBtn.selected = !self.registerBtn.selected;
    self.registerBtn.selected = NO;
    loginBtn.selected = YES;
    [self btnSelect];
}
- (void)setRegisterBtnClick:(UIButton *)registerBtn{
    registerBtn.selected = !self.loginBtn.selected;
    self.loginBtn.selected = NO;
    registerBtn.selected = YES;
    [self btnSelect];
}
-(void)btnSelect{
    if (self.loginBtn.selected) {
        self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [self.loginBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        self.registerBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        self.isLoginBtn = self.loginBtn.selected;
    }
    else{
        [self.registerBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        self.registerBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        self.isLoginBtn = self.loginBtn.selected;
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.UserNameText resignFirstResponder];
    [self.PassWordText resignFirstResponder];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField == self.UserNameText)
    {
       
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        NSInteger pointLength = existedLength - selectedLength + replaceLength;
        if (pointLength > 11)
        {
            
            return NO;
        }else{
            return YES;
        }
        
    }
    if (textField == self.PassWordText)
    {
        NSInteger existedLength = textField.text.length;
        NSInteger selectedLength = range.length;
        NSInteger replaceLength = string.length;
        NSInteger pointLength = existedLength - selectedLength + replaceLength;
        if (pointLength > 9)
        {
            return NO;
        }else{
            return YES;
        }
    }
    return self;
}
-(void)ackButtonClick:(UIButton *)ackBtn{
    
    [self.UserNameText resignFirstResponder];
    [self.PassWordText resignFirstResponder];
    NSString *CavanError = nil;
    if (self.UserNameText.text.length==11&&self.PassWordText.text.length>5) {
        BOOL isPohonNumber = [self isMobileNumber:self.UserNameText.text];
        if (isPohonNumber) {
            CavanError = nil;
        }else{
           CavanError = @"手机号格式错误";
        }
    }else{
        if (self.UserNameText.text.length!=11) {
            CavanError = @"账号为11位的手机号";
        }
        if (self.PassWordText.text.length<6) {
            CavanError = @"密码最少6位";
        }
    }
     [self.delegate ackButtonClick:ackBtn userName:self.UserNameText.text passWord:self.PassWordText.text isLogin:self.isLoginBtn CavanError:CavanError];
    
}
// 正则判断手机号码地址格式
- (BOOL)isMobileNumber:(NSString *)mobileNum {
    
    //    电信号段:133/153/180/181/189/177
    //    联通号段:130/131/132/155/156/185/186/145/176
    //    移动号段:134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
    //    虚拟运营商:170
    
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[06-8])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    return [regextestmobile evaluateWithObject:mobileNum];
}

@end
