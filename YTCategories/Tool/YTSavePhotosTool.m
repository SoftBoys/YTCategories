//
//  YTSavePhotosTool.m
//  YTCategoriesDemo
//
//  Created by guojunwei on 2019/3/14.
//  Copyright © 2019年 guojunwei. All rights reserved.
//

#import "YTSavePhotosTool.h"
#import "YTGetSystemAuthTool.h"

#import <Photos/Photos.h>

@implementation YTSavePhotosTool

+ (void)writeToPhotosAlbumWithImage:(UIImage *)image {
    
    NSMutableArray *localImageIds = @[].mutableCopy;
    // 获取权限
    [YTGetSystemAuthTool requestAuthorizationWithType:YTSystemAuthPhotoLibrary completionHandle:^(BOOL granted) {
        
        [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
            
            // 写入图片到相册
            PHAssetChangeRequest *request = [PHAssetChangeRequest creationRequestForAssetFromImage:image];
            
            NSString *localIdentifier = request.placeholderForCreatedAsset.localIdentifier;
            [localImageIds addObject:localIdentifier];
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                // 从相册中选出图片对象
                PHFetchResult<PHAsset *> *result = [PHAsset fetchAssetsWithLocalIdentifiers:localImageIds options:nil];
                PHAsset *imageAsset =  result.firstObject;
                // 加载图片数据
                [[PHImageManager defaultManager] requestImageDataForAsset:imageAsset options:nil resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
                    
                }];
                
            }
        }];
        
        
    }];
}

@end
