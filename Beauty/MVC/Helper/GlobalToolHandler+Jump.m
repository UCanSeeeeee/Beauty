//
//  GlobalToolHandler+Jump.m
//  Beauty
//
//  Created by Chieh on 2025/8/16.
//

#import "GlobalToolHandler+Jump.h"
#import "CWViewsFoundation.h"

@implementation GlobalToolHandler (Jump)

+ (void)pushConclusionVC {
    ConclusionViewController *vc = [ConclusionViewController new];
    vc.dataModel = GlobalToolHandler.fetchGlobalModel.conclusionModel;
    
    UIWindow *keyWindow = UIApplication.sharedApplication.windows.firstObject;
    for (UIWindow *window in UIApplication.sharedApplication.windows) {
        if (window.isKeyWindow) {
            keyWindow = window;
            break;
        }
    }
    UIViewController *rootVC = keyWindow.rootViewController;
    UINavigationController *nav = (UINavigationController *)rootVC;
    
    // 跳转到结论页面
    [nav pushViewController:vc animated:YES];
    
    // 从导航栈中移除 TakePhotosViewController
    NSMutableArray *viewControllers = [nav.viewControllers mutableCopy];
    NSMutableArray *controllersToRemove = [NSMutableArray array];
    
    for (UIViewController *controller in viewControllers) {
        if ([controller isKindOfClass:NSClassFromString(@"TakePhotosViewController")]) {
            [controllersToRemove addObject:controller];
        }
    }
    
    if (controllersToRemove.count > 0) {
        [viewControllers removeObjectsInArray:controllersToRemove];
        [nav setViewControllers:viewControllers animated:NO];
        NSLog(@"✅ 已从导航栈中移除 %lu 个 TakePhotosViewController", (unsigned long)controllersToRemove.count);
    }
}

+ (void)pushResultDetailVC {
    ResultDetailController *vc = [[ResultDetailController alloc] init];
    if (GlobalToolHandler.fetchGlobalModel.canShowPanelInfo) {
        UIWindow *keyWindow = UIApplication.sharedApplication.windows.firstObject;
        for (UIWindow *window in UIApplication.sharedApplication.windows) {
            if (window.isKeyWindow) {
                keyWindow = window;
                break;
            }
        }
        UIViewController *rootVC = keyWindow.rootViewController;
        UINavigationController *nav = (UINavigationController *)rootVC;
        [nav pushViewController:vc animated:YES];
    } else {
        [CenterToastView showWithText:@"正在分析，请稍后"];
    }
}

@end
