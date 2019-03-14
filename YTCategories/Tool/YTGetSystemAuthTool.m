//
//  YTGetSystemAuthTool.m
//  YTCategoriesDemo
//
//  Created by guojunwei on 2019/2/14.
//  Copyright © 2019年 guojunwei. All rights reserved.
//

#import "YTGetSystemAuthTool.h"

#import <Photos/Photos.h>
#import "UIApplication+YTMore.h"

@implementation YTGetSystemAuthTool
+ (void)requestAuthorizationWithType:(YTSystemAuthType)authType completionHandle:(void (^)(BOOL))completion {
    
    // 相机权限
    if (authType == YTSystemAuthCamera) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        
        // 第一次授权
        if (status == AVAuthorizationStatusNotDetermined) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (completion) {
                        completion(granted);
                    }
                });
            }];
        }
        // 已授权
        else if (status == AVAuthorizationStatusAuthorized) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(YES);
                }
            });
        }
        // 拒绝授权
        else {
            
            NSString *message = [self messageWithType:authType];
            [self showAlertWithMessage:message completion:^(NSInteger index) {
                if (completion) {
                    completion(NO);
                }
            }];
            
        }
        
    }
    // 相册权限
    else if (authType == YTSystemAuthPhotoLibrary) {
        
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        if (status == PHAuthorizationStatusNotDetermined) {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus authStatus) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (completion) {
                        completion(authStatus == PHAuthorizationStatusAuthorized);
                    }
                });
            }];
        }
        
        else if (status == PHAuthorizationStatusAuthorized) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(YES);
                }
            });
        }
        
        else {
            NSString *message = [self messageWithType:authType];
            [self showAlertWithMessage:message completion:^(NSInteger index) {
                if (completion) {
                    completion(NO);
                }
                
            }];
        }
        
    }
    // 麦克风权限
    else if (authType == YTSystemAuthMicrophone) {
        
        AVAudioSessionRecordPermission micPermission = [[AVAudioSession sharedInstance] recordPermission];
        if (micPermission == AVAudioSessionRecordPermissionUndetermined) {
            [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (completion) {
                        completion(granted);
                    }
                });
            }];
        }
        
        else if (micPermission == AVAudioSessionRecordPermissionGranted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion) {
                    completion(YES);
                }
            });
        }
        
        else {
            NSString *message = [self messageWithType:authType];
            [self showAlertWithMessage:message completion:^(NSInteger index) {
                if (completion) {
                    completion(NO);
                }
            }];
        }
        
    }
    
}

+ (void)showAlertWithMessage:(NSString *)message completion:(void(^)(NSInteger index))completion {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action_cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (completion) {
                completion(0);
            }
        }];
        UIAlertAction *action_set = [UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (completion) {
                completion(1);
            }
            
            // 跳转到设置页面
            NSURL *setURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if (@available(iOS 10.0, *)) {
                [[UIApplication sharedApplication] openURL:setURL options:@{@"url":@""} completionHandler:^(BOOL success) {
                    
                }];
            } else {
                // Fallback on earlier versions
                [[UIApplication sharedApplication] openURL:setURL];
            }
            
            
        }];
        
        [alertVC addAction:action_cancel];
        [alertVC addAction:action_set];
        
        [[UIApplication sharedApplication].topViewController presentViewController:alertVC animated:YES completion:nil];
        
    });
}

+ (NSString *)messageWithType:(YTSystemAuthType)type {
    NSString *appName = [UIApplication sharedApplication].appName;
    NSString *name = @"相机";
    if (type == YTSystemAuthCamera) {
        name = @"相机";
    } else if (type == YTSystemAuthPhotoLibrary) {
        name = @"相册";
    } else if (type == YTSystemAuthMicrophone) {
        name = @"麦克风";
    }
    NSString *message = [NSString stringWithFormat:@"请在iPhone的”设置-隐私-%@“选项中，允许[%@]访问你的%@", name, appName, name];
    return message;
}

@end
