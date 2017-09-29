//
//  UINavigationController+HCModuleCore.h
//  HCModule
//
//  Created by HChong on 2017/9/26.
//

#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonCryptor.h>

@interface UINavigationController (HCModuleCore)

- (BOOL)pushModule:(NSString *)moduleName animated:(BOOL)animated withParams:(NSDictionary *)params callback:(void(^)(NSDictionary *moduleInfo))callback;

@end
