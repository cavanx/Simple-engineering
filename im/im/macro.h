//
//  macro.h
//  im
//
//  Created by 历成栋 on 2017/2/19.
//  Copyright © 2017年 cavan. All rights reserved.
//

#ifndef macro_h
#define macro_h
#define CAVANColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define CAVAN_SCRWIDTH  [UIScreen mainScreen].bounds.size.width
#define CAVAN_SCRHEIGTH [UIScreen mainScreen].bounds.size.height
/**
 修改状态栏变为白色
 */
#define StatusBar  - (UIStatusBarStyle)preferredStatusBarStyle{\
return UIStatusBarStyleLightContent;\
}
/**
 修改view的backgroundColor为白色
 */
#define ViewBackWhiteColor  self.view.backgroundColor = [UIColor whiteColor];


#endif /* macro_h */
