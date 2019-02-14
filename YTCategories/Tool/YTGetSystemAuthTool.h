//
//  YTGetSystemAuthTool.h
//  YTCategoriesDemo
//
//  Created by guojunwei on 2019/2/14.
//  Copyright © 2019年 guojunwei. All rights reserved.
//
//  需在Info文件中做如下配置
//  1.<key>NSCameraUsageDescription</key> <string>需要使用您的相机拍照</string>
//  2.<key>NSPhotoLibraryUsageDescription</key>  <string>需要访问您的相册</string>
//    <key>NSPhotoLibraryAddUsageDescription</key>  <string>需要使用您的相册保存图片</string>
//  3.<key>NSMicrophoneUsageDescription</key> <string>需要使用您的麦克风录音</string>
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, YTSystemAuthType) {
    YTSystemAuthCamera,         // 相机
    YTSystemAuthPhotoLibrary,   // 相册
    YTSystemAuthMicrophone,     // 麦克风
};

@interface YTGetSystemAuthTool : NSObject
+ (void)requestAuthorizationWithType:(YTSystemAuthType)authType completionHandle:(void(^)(BOOL granted))completion;
@end


