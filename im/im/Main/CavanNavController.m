//
//  CavanNavController.m
//  im
//
//  Created by 历成栋 on 2017/2/18.
//  Copyright © 2017年 cavan. All rights reserved.
//

#import "CavanNavController.h"

@interface CavanNavController ()
@property (nonatomic,strong) UIButton *backBtn;
@end

@implementation CavanNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
/**
 在子类中可以随意修改状态栏的颜色
 
 @return <#return value description#>
 */
- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}

//拦截push进来的控制器
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count) {
        //        [self.navigationBar snapshotViewAfterScreenUpdates:NO];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
        //        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    //如果在控制器有设置，就可以让后面设置的按钮可以覆盖它
    [super pushViewController:viewController animated:animated];
}


- (UIButton *)backBtn{
    
    if (_backBtn == nil) {
        _backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];;
        [_backBtn setImage:[UIImage imageNamed:@"navbar_back_item"] forState:UIControlStateNormal];
        //        [_backBtn setTitle:@"返回" forState:UIControlStateNormal];
        //        _backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        //        [_backBtn sizeToFit];
        [_backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
- (void)backBtnClick:(UIButton *)Backbtn{
    [self popViewControllerAnimated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
