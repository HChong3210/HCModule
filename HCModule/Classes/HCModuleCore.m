//
//  HCModuleCore.m
//  HCModule
//
//  Created by HChong on 2017/9/26.
//

#import "HCModuleCore.h"
#import <objc/runtime.h>
#import "HCModuleProtocol.h"

@interface HCModuleCore()

@property (nonatomic, strong) NSMutableDictionary *cache;
@end

@implementation HCModuleCore

+ (instancetype)moduleCore {
    static HCModuleCore *moduleCore;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        moduleCore = [[HCModuleCore alloc] init];
    });
    return moduleCore;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self cacheModuleProrocolClasses];
    }
    return self;
}

#pragma mark - Public
- (id)moduleName:(NSString *)moduleName openWithParams:(NSDictionary *)params callback:(void(^)(NSDictionary *moduleInfo))callback {
    NSCAssert(moduleName != nil, @"moduleName can not be nil!");
    id module;
    
    return nil;
}

#pragma mark - Private
/**
 把遵守HCModuleProtocol的类缓存起来
 */
- (void)cacheModuleProrocolClasses {
    if (_cache.count == 0) {
        return;
    }
    NSMutableDictionary *tmpCache = [NSMutableDictionary dictionary];
    Class *classes;
    unsigned int outCount;
    classes = objc_copyClassList(&outCount);//获取全部类
    for (int i = 0; i < outCount; i++) {
        Class class = classes[i];
        
        //实现了HCModuleProtocol的类
        if (class_conformsToProtocol(class, @protocol(HCModuleProtocol))) {
            NSString *moduleName = [class moduleName];
            [tmpCache setObject:class forKey:moduleName];
            //重复检查
            NSCAssert([tmpCache objectForKey:moduleName] == nil, @"in class %@, module %@ has defined, please check!", NSStringFromClass(class), moduleName);
        }
    }
    free(classes);
    self.cache = [tmpCache copy];
}

@end
