//
//  LSTabViewController.m
//  LSBaseNav
//
//  Created by WangBiao on 2017/6/12.
//  Copyright © 2017年 LSRain. All rights reserved.
//

#import "LSTabViewController.h"
#import "LSAdditions.h"
#import "LSNavigationViewController.h"

@interface LSTabViewController ()

@end

@implementation LSTabViewController

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
    UIViewController *vc1 = [self loadChildViewControllerWithClassName:@"LSTestVC1" andTitle:@"VC1" andImageName:@"ico_foot_VC1"];
    UIViewController *vc2 = [self loadChildViewControllerWithClassName:@"LSTestVC2" andTitle:@"VC2" andImageName:@"ico_foot_VC2"];
    UIViewController *vc3 = [self loadChildViewControllerWithClassName:@"LSTestVC3" andTitle:@"VC3" andImageName:@"ico_foot_VC3"];
    UIViewController *vc4 = [self loadChildViewControllerWithClassName:@"LSTestVC4" andTitle:@"VC4" andImageName:@"ico_foot_fxs"];
    UIViewController *vc5 = [self loadChildViewControllerWithClassName:@"MeViewController" andTitle:@"VC5" andImageName:@"ico_foot_VC4"];
    
    // 给标签控制器添加子控制器
    self.viewControllers = @[vc1, vc2, vc3, vc4, vc5];
    self.tabBar.translucent = NO;
    // 设置标签栏的主题颜色"它会影响标签栏上的所有文字颜色"
    self.tabBar.tintColor = [UIColor ls_colorWithHex:0x1e82d2];
}

/**
 此方法中通过alloc方式创建及设置子控制器的内容
 
 @param className 控制器类名字符串
 @param title     标签上显示的标题
 @param imageName 标签栏上显示的图片
 */
- (UIViewController *)loadChildViewControllerWithClassName:(NSString *)className andTitle:(NSString *)title andImageName:(NSString *)imageName {
    Class class =  NSClassFromString(className);
    UIViewController *vc = [[class alloc] init];
    
    return [self setupWithViewController:vc andTitle:title andImageName:imageName];
}


/**
 此方法中通过加载sb来创建控制器及设置子控制器的内容
 
 @param sbName 控制器类名字符串
 @param title     标签上显示的标题
 @param imageName 标签栏上显示的图片
 */
- (UIViewController *)loadChildViewControllerWithStoryBoard:(NSString *)sbName andTitle:(NSString *)title andImageName:(NSString *)imageName {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    UIViewController *vc = [sb instantiateInitialViewController];
    
    return [self setupWithViewController:vc andTitle:title andImageName:imageName];
}


/**
 返回一个导航控制器
 
 @param vc        要设置内容的普通的子控制器
 @param title     控制器的标题
 @param imageName 标签栏上显示的图片
 */
- (UIViewController *)setupWithViewController:(UIViewController *)vc andTitle:(NSString *)title andImageName:(NSString *)imageName {
    // 设置控制器的标题会影响它的导航条或标签栏上的标题
    vc.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    /// 修改title间距
    [vc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -4)];
    
    // 设置 tabbarItem 选中状态下的文字颜色(不被系统默认渲染,显示文字自定义颜色)
    NSDictionary *dictHome = [NSDictionary dictionaryWithObject:[UIColor ls_colorWithHex:0x474747] forKey:NSForegroundColorAttributeName];
    [vc.tabBarItem setTitleTextAttributes:dictHome forState:UIControlStateNormal];
    
    NSDictionary *dictHomeH = [NSDictionary dictionaryWithObject:[UIColor ls_colorWithHex:0x1a68d2] forKey:NSForegroundColorAttributeName];
    [vc.tabBarItem setTitleTextAttributes:dictHomeH forState:UIControlStateSelected];
    
    NSString *selectedImageName = [imageName stringByAppendingString:@"_h"];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    LSNavigationViewController *nav = [[LSNavigationViewController alloc] initWithRootViewController:vc];
    
    return nav;
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
