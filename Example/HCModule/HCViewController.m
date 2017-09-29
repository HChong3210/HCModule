//
//  HCViewController.m
//  HCModule
//
//  Created by HChong3210 on 09/26/2017.
//  Copyright (c) 2017 HChong3210. All rights reserved.
//

#import "HCViewController.h"
#import "HCModule.h"
#import "UIViewController+HCModuleCore.h"

@interface HCViewController ()

@end

@implementation HCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightTextColor];
    [self uiConfig];
}

- (void)uiConfig {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 200, 100, 50);
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor lightGrayColor];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonAction:(id)action {
//    [self.navigationController pushModule:@"controller1" animated:YES withParams:@{@"key": @"value"} callback:^(NSDictionary *moduleInfo) {
//        NSLog(@"%@", moduleInfo);
//    }];
    
    [self presentModule:@"controller2" animated:YES withParams:@{@"key": @"value"} completion:nil callback:^(NSDictionary *moduleInfo) {
        
    }];
}

@end
