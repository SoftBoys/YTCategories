//
//  ViewController.m
//  YTCategoriesDemo
//
//  Created by guojunwei on 2019/2/12.
//  Copyright © 2019年 guojunwei. All rights reserved.
//

#import "ViewController.h"
#import "UIDevice+YTMore.h"

#import "UIApplication+YTMore.h"
#import "YTGetSystemAuthTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    
    NSLog(@"info:%@", info);
    
    
}
- (IBAction)cameraClick:(id)sender {
    [YTGetSystemAuthTool requestAuthorizationWithType:YTSystemAuthCamera completionHandle:^(BOOL granted) {
        
    }];
}
- (IBAction)photoClick:(id)sender {
    [YTGetSystemAuthTool requestAuthorizationWithType:YTSystemAuthPhotoLibrary completionHandle:^(BOOL granted) {
        
    }];
}

- (IBAction)micClick:(id)sender {
    [YTGetSystemAuthTool requestAuthorizationWithType:YTSystemAuthMicrophone completionHandle:^(BOOL granted) {
        
    }];
}

@end
