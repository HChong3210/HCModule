//
//  UIViewController+HCModuleCore.m
//  HCModule
//
//  Created by HChong on 2017/9/26.
//

#import "UIViewController+HCModuleCore.h"
#import "HCModuleCore.h"

@implementation UIViewController (HCModuleCore)

- (BOOL)presentModule:(NSString *)moduleName animated:(BOOL)animated withParams:(NSDictionary *)params completion:(void (^)(void))completion callback:(void(^)(NSDictionary *moduleInfo))callback {
    BOOL suc = NO;
    UIViewController *moduleVC = [[HCModuleCore moduleCore] moduleName:moduleName openWithParams:params callback:callback];
    if ([moduleVC isKindOfClass:[UIViewController class]]) {
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:moduleVC];
        [self presentViewController:navi animated:animated completion:completion];
        suc = YES;
    }
    return suc;
}

@end
