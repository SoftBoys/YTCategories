//
//  UIControl+YTMore.m
//  YTCategoriesDemo
//
//  Created by guojunwei on 2019/2/12.
//  Copyright © 2019年 guojunwei. All rights reserved.
//

#import "UIControl+YTMore.h"
#import <objc/message.h>

static const int ytcontrol_block;

@interface _YTUIControlBlockTarget : NSObject
@property (nonatomic, copy) void (^block)(void);
@property (nonatomic, assign) UIControlEvents events;

- (void)invoke:(id)sender;
@end
@implementation _YTUIControlBlockTarget

- (void)invoke:(id)sender {
    if (self.block) {
        self.block();
    }
}
@end

@implementation UIControl (YTMore)

- (void)yt_setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    if (!target || !action || !controlEvents) return;
    NSSet *targets = [self allTargets];
    for (id currentTarget in targets) {
        NSArray *actions = [self actionsForTarget:currentTarget forControlEvent:controlEvents];
        for (NSString *currentAction in actions) {
            [self removeTarget:currentTarget action:NSSelectorFromString(currentAction)
              forControlEvents:controlEvents];
        }
    }
    [self addTarget:target action:action forControlEvents:controlEvents];
}
- (void)yt_setBlockForControlEvents:(UIControlEvents)controlEvents block:(void(^)(void))block {
    [self yt_removeAllBlocksForControlEvents:controlEvents];
    [self yt_addBlockForControlEvents:controlEvents block:block];
}
- (void)yt_addBlockForControlEvents:(UIControlEvents)controlEvents block:(void(^)(void))block {
    if (!controlEvents) return;
    _YTUIControlBlockTarget *target = [_YTUIControlBlockTarget new];
    target.block = block;
    target.events = controlEvents;
    
    [self addTarget:target action:@selector(invoke:) forControlEvents:controlEvents];
    NSMutableArray *targets = [self _yt_allUIControlBlockTargets];
    [targets addObject:target];
}

- (void)yt_removeAllBlocksForControlEvents:(UIControlEvents)controlEvents {
    if (!controlEvents) return;
    
    NSMutableArray *targets = [self _yt_allUIControlBlockTargets];
    NSMutableArray *removes = @[].mutableCopy;
    [targets enumerateObjectsUsingBlock:^(_YTUIControlBlockTarget *target, NSUInteger idx, BOOL * _Nonnull stop) {
        if (target.events & controlEvents) {
            UIControlEvents newEvent = target.events & (~controlEvents);
            if (newEvent) {
                [self removeTarget:target action:@selector(invoke:) forControlEvents:target.events];
                target.events = newEvent;
                [self addTarget:target action:@selector(invoke:) forControlEvents:target.events];
            } else {
                [self removeTarget:target action:@selector(invoke:) forControlEvents:target.events];
                [removes addObject:target];
            }
        }
    }];
    [targets removeObjectsInArray:removes];
}

- (void)yt_removeAllTargets {
    [self.allTargets enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        [self removeTarget:obj action:NULL forControlEvents:UIControlEventAllEvents];
    }];
    [[self _yt_allUIControlBlockTargets] removeAllObjects];
}

- (NSMutableArray *)_yt_allUIControlBlockTargets {
    NSMutableArray *targets = objc_getAssociatedObject(self, &ytcontrol_block);
    if (targets == nil) {
        targets = @[].mutableCopy;
        objc_setAssociatedObject(self, &ytcontrol_block, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}

@end
