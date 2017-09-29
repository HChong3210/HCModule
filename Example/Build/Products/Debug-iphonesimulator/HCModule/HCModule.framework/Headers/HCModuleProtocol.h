//
//  HCModuleProtocol.h
//  HCModule
//
//  Created by HChong on 2017/9/26.
//

#import <Foundation/Foundation.h>

@protocol HCModuleProtocol <NSObject>

/**
 模块名称

 @return 模块名称
 */
+ (NSString *)moduleName;

@optional
- (id)open:(NSDictionary *)params callback:(void(^)(NSDictionary *))callback;

- (id)open_present:(NSDictionary *)params callback:(void(^)(NSDictionary *))callback;
@end
