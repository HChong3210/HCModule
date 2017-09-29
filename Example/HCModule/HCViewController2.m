//
//  HCViewController2.m
//  HCModule_Example
//
//  Created by HChong on 2017/9/29.
//  Copyright © 2017年 HChong3210. All rights reserved.
//

#import "HCViewController2.h"
#import "HCModule.h"

@interface HCViewController2 ()<HCModuleProtocol>

@end

@implementation HCViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.9 green:0.7 blue:0.3 alpha:1];
    [self addBackButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addBackButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    [button setTitle:@"关闭" forState:UIControlStateNormal];
    [self defaultFontForButton:button];
    [button addTarget:self action:@selector(barCloseAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItems = @[buttonItem];
}

- (void)defaultFontForButton:(UIButton*)button{
    if (![button isKindOfClass:[UIButton class]]) {
        return;
    }
    button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    if (CGRectEqualToRect(button.bounds, CGRectZero)) {
        button.frame = CGRectMake(0, 0, 35, 30);
    }
}

- (void)barCloseAction {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - HCModuleProtocol
+ (NSString *)moduleName {
    return @"controller2";
}

- (id)open_present:(NSDictionary *)params callback:(void(^)(NSDictionary *))callback {
    callback(params[@"key"]);
    return self;
}

@end
