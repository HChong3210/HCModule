//
//  HCViewController1.m
//  HCModule_Example
//
//  Created by HChong on 2017/9/29.
//  Copyright © 2017年 HChong3210. All rights reserved.
//

#import "HCViewController1.h"
#import "HCModule.h"

@interface HCViewController1 ()<HCModuleProtocol>

@end

@implementation HCViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.4 green:1 blue:0.8 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - HCModuleProtocol
+ (NSString *)moduleName {
    return @"controller1";
}

- (id)open:(NSDictionary *)params callback:(void(^)(NSDictionary *))callback {
    callback(params[@"key"]);
    return self;
}

@end
