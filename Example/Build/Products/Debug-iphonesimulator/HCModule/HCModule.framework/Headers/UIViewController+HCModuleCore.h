//
//  UIViewController+HCModuleCore.h
//  HCModule
//
//  Created by HChong on 2017/9/26.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HCModuleCore)

- (BOOL)presentModule:(NSString *)moduleName animated:(BOOL)animated withParams:(NSDictionary *)params completion:(void (^)(void))completion callback:(void(^)(NSDictionary *moduleInfo))callback;

@end
