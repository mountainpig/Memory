//
//  UIViewController+Memory.m
//  Memory
//
//  Created by 黄敬 on 2018/7/26.
//  Copyright © 2018年 hj. All rights reserved.
//

#import "UIViewController+Memory.h"
#import <objc/runtime.h>

@implementation UIViewController (Memory)
+ (void)load
{
#ifdef DEBUG
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(dismissViewControllerAnimated:completion:)), class_getInstanceMethod([self class], @selector(memory_dismissViewControllerAnimated:completion:)));
#endif
}

- (void)memory_dismissViewControllerAnimated: (BOOL)flag completion:(void (^ __nullable)(void))completion
{
    [self memory_dismissViewControllerAnimated:flag completion:completion];
    [self checkMemory];
}

- (void)checkMemory
{
    __weak __typeof (self)weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf) {
            [UIViewController alertObject:weakSelf];
        }
    });
    NSPointerArray *pointArray = [NSPointerArray weakObjectsPointerArray];
    [UIViewController addView:self.view withPointArray:pointArray];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [pointArray.allObjects enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL * _Nonnull stop) {
            [UIViewController alertObject:view];
        }];
    });
}

+ (void)addView:(UIView *)view withPointArray:(NSPointerArray *)pointArray
{
    if (!view) {
        return;
    }
    [pointArray addPointer:(__bridge void * _Nullable)(view)];
    for (UIView *sub in view.subviews) {
        [UIViewController addView:sub withPointArray:pointArray];
    }
}

+ (void)alertObject:(id)object
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"内存泄漏" message:[NSString stringWithFormat:@"%@",object] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
    [alert show];
#pragma clang diagnostic pop
}
@end
