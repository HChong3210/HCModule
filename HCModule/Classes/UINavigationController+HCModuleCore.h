//
//  UINavigationController+HCModuleCore.h
//  HCModule
//
//  Created by HChong on 2017/9/26.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (HCModuleCore)

- (BOOL)scc_pushModule:(NSString *)moduleName animated:(BOOL)animated withParams:(NSDictionary *)params callback:(void(^)(NSDictionary *moduleInfo))callback;
@end
