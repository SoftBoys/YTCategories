//
//  UIApplication+YTMore.m
//  YTCategoriesDemo
//
//  Created by guojunwei on 2019/2/12.
//  Copyright © 2019年 guojunwei. All rights reserved.
//

#import "UIApplication+YTMore.h"

@implementation UIApplication (YTMore)

- (NSString *)documentsPath {
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
}
- (NSString *)cachesPath {
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
}
- (NSString *)libraryPath {
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject;
}

- (NSString *)appBundleName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
}

- (NSString *)appBundleDisplayName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

- (NSString *)appName {
    return [self appBundleDisplayName] ?:[self appBundleName];
}

- (NSString *)appBundleID {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

- (NSString *)appVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

- (NSString *)appBuildVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}


- (UIViewController *)topViewController {
    UIViewController *rootViewController = self.delegate.window.rootViewController;
    if (rootViewController == nil) return nil;
    UIViewController *topVC = [self private_topVC:rootViewController];
    while (topVC.presentedViewController) {
        topVC = [self private_topVC:topVC.presentedViewController];
    }
    return topVC;
}

- (UIViewController *)private_topVC:(UIViewController *)topVC {
    if ([topVC isKindOfClass:[UITabBarController class]]) {
        return [self private_topVC:[(UITabBarController*)topVC selectedViewController]];
    } else if ([topVC isKindOfClass:[UINavigationController class]]) {
        return [self private_topVC:[(UINavigationController*)topVC topViewController]];
    } else if ([topVC isKindOfClass:[UIViewController class]]) {
        return topVC;
    }
    return nil;
}

@end
