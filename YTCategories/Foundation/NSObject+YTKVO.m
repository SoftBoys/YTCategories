//
//  NSObject+YTKVO.m
//  YTCategoriesDemo
//
//  Created by guojunwei on 2019/2/12.
//  Copyright © 2019年 guojunwei. All rights reserved.
//

#import "NSObject+YTKVO.h"
#import <objc/runtime.h>

static const int ytblock_key;

@interface _YTKVOBlockTarget : NSObject
@property (nonatomic, copy) void (^block)(id object, id oldVal, id newVal);
@end

@implementation _YTKVOBlockTarget

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (self.block == nil) {
        return;
    }

    BOOL isPrior = [change[NSKeyValueChangeNotificationIsPriorKey] boolValue];
    if (isPrior) return;
    
    NSKeyValueChange changeKind = [change[NSKeyValueChangeKindKey] integerValue];
    if (changeKind != NSKeyValueChangeSetting) return;
    
    id oldVal = change[NSKeyValueChangeOldKey];
    if (oldVal == [NSNull null]) oldVal = nil;
    
    id newVal = change[NSKeyValueChangeNewKey];
    if (newVal == [NSNull null]) newVal = nil;
    self.block(object, oldVal, newVal);
}

@end


@implementation NSObject (YTKVO)

- (void)yt_addObserverBlockForKeyPath:(NSString *)keyPath block:(void (^)(id _Nonnull, id _Nonnull, id _Nonnull))block {
    if (!keyPath || !block) return;
    
    _YTKVOBlockTarget *target = [[_YTKVOBlockTarget alloc] init];
    target.block = block;
    
    NSMutableDictionary *muDict = [self _yt_allObserverBlocks];
    NSMutableArray *array = muDict[keyPath];
    if (array == nil) {
        array = @[].mutableCopy;
        muDict[keyPath] = array;
    }
    [array addObject:target];
    [self addObserver:target forKeyPath:keyPath options:NSKeyValueObservingOptionOld |NSKeyValueObservingOptionNew context:nil];
}

- (void)yt_removeObserverBlocks {
    NSMutableDictionary *muDict = [self _yt_allObserverBlocks];
    
    [muDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, NSArray *array, BOOL * _Nonnull stop) {
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [self removeObserver:obj forKeyPath:key];
        }];
    }];
    
    [muDict removeAllObjects];
}
- (void)yt_removeObserverBlocksForKeyPath:(NSString *)keyPath {
    if (keyPath == nil) return;

    NSMutableDictionary *muDict = [self _yt_allObserverBlocks];
    NSArray *array = muDict[keyPath];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self removeObserver:obj forKeyPath:keyPath];
    }];
    [muDict removeObjectForKey:keyPath];
}

- (NSMutableDictionary *)_yt_allObserverBlocks {
    NSMutableDictionary *dict = objc_getAssociatedObject(self, &ytblock_key);
    if (dict == nil) {
        dict = @{}.mutableCopy;
        objc_setAssociatedObject(self, &ytblock_key, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dict;
}

@end
