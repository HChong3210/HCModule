//
//  HCModuleCore.h
//  HCModule
//
//  Created by HChong on 2017/9/26.
//

#import <Foundation/Foundation.h>

@interface HCModuleCore : NSObject


/**
 获取Module对象

 @return moduleCore
 */
+ (instancetype)moduleCore;

/**
 *  设置module scheme 和该scheme不符的URL请不会被执行。
 */
@property (nonatomic, copy) NSString *moduleScheme;

/**
 *  根据moduleName返回对应的类
 *
 *  @param moduleName 模块名
 *  @param params     模块参数
 *  @param callback   模块回调
 *
 *  @return 模块对象
 */
- (id)moduleName:(NSString *)moduleName openWithParams:(NSDictionary *)params callback:(void(^)(NSDictionary *moduleInfo))callback;
@end
