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
//根据moduleName返回对应注册的类
- (id)moduleName:(NSString *)moduleName openWithParams:(NSDictionary *)params callback:(void(^)(NSDictionary *moduleInfo))callback {
    NSCAssert(moduleName != nil, @"moduleName can not be nil!");
    id module = [self moduleName:moduleName performSelectorName:@"open:callback:" withParams:params callback:callback];
    if (module == nil) {
        module = [self moduleName:moduleName performSelectorName:@"open_present:callback:" withParams:params callback:callback];
    }
    return module;
}

#pragma mark - Private
/**
 把遵守HCModuleProtocol的类缓存起来
 */
- (void)cacheModuleProrocolClasses {
    if (_cache.count != 0) {
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
            //重复检查
            NSCAssert([tmpCache objectForKey:moduleName] == nil, @"in class %@, module %@ has defined, please check!", NSStringFromClass(class), moduleName);
            [tmpCache setObject:NSStringFromClass(class) forKey:moduleName];
        }
    }
    free(classes);
    self.cache = [tmpCache copy];
}

//获取缓存起来的响应相应协议方法的类
- (id)moduleName:(NSString *)moduleName performSelectorName:(NSString *)selectorName withParams:(NSDictionary *)params callback:(void(^)(NSDictionary *moduleInfo))callback {
    NSCAssert(moduleName != nil && selectorName != nil, @"moduleName and selectorName can not be nil!");
    id module;
    NSString *clsName = self.cache[moduleName];
    if (clsName.length) {
        Class class = NSClassFromString(clsName);//根据缓存的类名字创建类
        SEL selec = NSSelectorFromString(selectorName);
        if (class) {
            id target = [[class alloc] init];//初始化一个类的对象
            if ([target respondsToSelector:selec]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                module = [target performSelector:selec withObject:params withObject:callback];
#pragma clang diagnostic pop
            }
        }
    }
    return module;
}

@end
