//
//  UINavigationController+HCModuleCore.m
//  HCModule
//
//  Created by HChong on 2017/9/26.
//

#import "UINavigationController+HCModuleCore.h"
#import "HCModuleCore.h"

@implementation UINavigationController (HCModuleCore)

- (BOOL)pushModule:(NSString *)moduleName animated:(BOOL)animated withParams:(NSDictionary *)params callback:(void(^)(NSDictionary *moduleInfo))callback {
    BOOL suc = NO;
    UIViewController *moduleVC = [[HCModuleCore moduleCore] moduleName:moduleName openWithParams:params callback:callback];
    if ([moduleVC isKindOfClass:[UIViewController class]]) {
        [self pushViewController:moduleVC animated:animated];
        suc = YES;
    }
    return suc;
}
@end
