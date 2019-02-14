//
//  UIApplication+YTMore.h
//  YTCategoriesDemo
//
//  Created by guojunwei on 2019/2/12.
//  Copyright © 2019年 guojunwei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (YTMore)
/** Documents */
@property (nonatomic, copy, readonly) NSString *documentsPath;
/** Caches */
@property (nonatomic, copy, readonly) NSString *cachesPath;
/** Library */
@property (nonatomic, copy, readonly) NSString *libraryPath;

/// Application's Bundle Name (show in SpringBoard).
@property (nonatomic, copy, readonly) NSString *appBundleName;
/// Application's BundleDisplay Name .
@property (nonatomic, copy, readonly) NSString *appBundleDisplayName;
/// Application's Name (default BundleDisplay when BundleDisplayName is nil, is BundleName).
@property (nonatomic, copy, readonly) NSString *appName;

/// Application's Bundle ID.  e.g. "com.ibireme.MyApp"
@property (nonatomic, copy, readonly) NSString *appBundleID;

/// Application's Version.  e.g. "1.2.0"
@property (nonatomic, copy, readonly) NSString *appVersion;

/// Application's Build number. e.g. "123"
@property (nonatomic, copy, readonly) NSString *appBuildVersion;

/// Application's topViewController
@property (nonatomic, strong, readonly) UIViewController *topViewController;

@end

NS_ASSUME_NONNULL_END
