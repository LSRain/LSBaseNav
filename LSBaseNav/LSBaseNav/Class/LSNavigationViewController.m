//
//  LSNavigationViewController.m
//  LSBaseNav
//
//  Created by WangBiao on 2017/6/12.
//  Copyright © 2017年 LSRain. All rights reserved.
//

#import "LSNavigationViewController.h"
#import "LSAdditions.h"

@interface LSNavigationViewController ()

@end

@implementation LSNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

# pragma mark -
/**
 UI: setup
 */
- (void)setupUI{
    /************* 以下两行代码才能把导航条下面的黑线去掉  *********/
    // 把导航条自带的背景图片清空
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    // 给导航条下面的阴影图片清空
    self.navigationBar.shadowImage = [[UIImage alloc] init];
    // 让导航条没有半透明效果
    self.navigationBar.translucent = NO;
    // 设置导航条的背景颜色"包括状态栏后面的颜色也一起改了"
    self.navigationBar.barTintColor = [UIColor ls_colorWithHex:0x1e82d2];
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:16], NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    // 设置导航条上的主题颜色
    self.navigationBar.tintColor = [UIColor whiteColor];

}


// 让状态栏为白色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - 重写此方法拦截到导航控制器的push操作在里面来判断是否要隐藏tabBar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 只要不是导航控制器的根控制器就让tabBar隐藏
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
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
