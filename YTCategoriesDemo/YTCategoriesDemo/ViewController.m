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
#import "UIDevice+YTMore.h"

#import "CALayer+YTMore.h"
#import "YTSavePhotosTool.h"
#import "UIScrollView+YTMore.h"

@interface ViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIScrollView *scrollView = [UIScrollView new];
    scrollView.frame = self.view.bounds;
    [self.view insertSubview:scrollView atIndex:0];
    _scrollView = scrollView;
    
    scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds), 2000);
    scrollView.backgroundColor = [UIColor redColor];
    
    UILabel *label = [UILabel new];
    label.font = [UIFont systemFontOfSize:18];
    label.textColor = [UIColor blackColor];
    label.text = @"哈哈哈111";
    label.backgroundColor = [UIColor orangeColor];
    [scrollView addSubview:label];
    
    UILabel *label2 = [UILabel new];
    label2.font = [UIFont systemFontOfSize:18];
    label2.textColor = [UIColor blackColor];
    label2.text = @"哈哈哈222";
    label2.backgroundColor = [UIColor orangeColor];
    [scrollView addSubview:label2];
    
    label.frame = CGRectMake(10, 0, 200, 30);
    label2.frame = CGRectMake(10, 1970, 200, 30);
    
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
- (IBAction)saveImage:(id)sender {
    
    UIImage *image = [self.scrollView snapshotLongImage];
    [YTSavePhotosTool writeToPhotosAlbumWithImage:image];
    
}

@end
