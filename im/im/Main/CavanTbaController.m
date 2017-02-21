//
//  CavanTbaController.m
//  im
//
//  Created by 历成栋 on 2017/2/18.
//  Copyright © 2017年 cavan. All rights reserved.
//

#import "CavanTbaController.h"
#import "CavanNavController.h"
#import "NearbyUserController.h"
#import "ChatController.h"
#import "FriendsController.h"
#import "MineController.h"
@interface CavanTbaController ()

@end

@implementation CavanTbaController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController];
    // Do any additional setup after loading the view.
}
+(void)initialize
{
    //        设置外观
    UITabBarItem *item=[UITabBarItem appearance];
    //    设置颜色,字体的大小
//    NSDictionary *dict=@{NSForegroundColorAttributeName:CAVANColor(102,102,102),NSFontAttributeName:[UIFont systemFontOfSize:11]};
    NSDictionary *dict=@{NSForegroundColorAttributeName:[UIColor colorWithRed:102/255 green:102/255 blue:102/255 alpha:1],NSFontAttributeName:[UIFont systemFontOfSize:11]};
    [item setTitleTextAttributes:dict forState:UIControlStateNormal];
    
    dict=@{NSForegroundColorAttributeName:[UIColor colorWithRed:57/255 green:138/255 blue:181/255 alpha:1],NSFontAttributeName:[UIFont systemFontOfSize:11]};
    
    [item setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBarTintColor:[UIColor colorWithRed:44/255 green:40/255 blue:35/255 alpha:1]];
    
    [bar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //    [bar setTranslucent:NO];
    
}

- (void)addChildViewController{
    
    [self addNavController:[[NearbyUserController alloc]init] title:@"附近人" imageName:@"tabbar_item_home" selecteImageName:@"tabbar_selected_item_home"];
    
    [self addNavController:[[ChatController alloc ]init] title:@"聊天" imageName:@"tabbar_item_chat" selecteImageName:@"tabbar_selected_item_chat"];
    
    [self addNavController:[[FriendsController alloc ]init] title:@"好友" imageName:@"tabbar_item_frendslist" selecteImageName:@"tabbar_selected_item_frendslist"];
    [self addNavController:[[MineController alloc ]init] title:@"我的" imageName:@"tabbar_item_mine" selecteImageName:@"tabbar_selected_item_mine"];
    
    
}
/**
 @param controller item所对应的控制器
 @param title item的名字
 @param imageName 未选中的item的图片的名字
 @param selecteImageName 选中的item的图片名字
 */
-(void)addNavController:(UIViewController *)controller title:(NSString *)title imageName:(NSString *)imageName selecteImageName:(NSString *)selecteImageName
{
    CavanNavController *navVc=[[CavanNavController alloc]initWithRootViewController:controller];
    //设置显示的文字
    navVc.tabBarItem.title=title;
    //    设置普通状态下的图片
    UIImage *normalImage = [UIImage imageNamed:imageName];
    //    设置选中状态下的图片
    NSString *selectedImageName=[NSString stringWithFormat:@"%@",selecteImageName];
    
    UIImage *selectedImg=[[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVc.tabBarItem.image=normalImage;
    navVc.tabBarItem.selectedImage=selectedImg;
    
    [self addChildViewController:navVc];
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
