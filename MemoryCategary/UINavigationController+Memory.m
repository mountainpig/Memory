//
//  UINavigationController+Memory.m
//  Memory
//
//  Created by 黄敬 on 2018/7/26.
//  Copyright © 2018年 hj. All rights reserved.
//

#import "UINavigationController+Memory.h"
#import "UIViewController+Memory.h"
#import <objc/runtime.h>

@implementation UINavigationController (Memory)
+ (void)load
{
#ifdef DEBUG
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(popViewControllerAnimated:)), class_getInstanceMethod([self class], @selector(memory_popViewControllerAnimated:)));
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(popToViewController:animated:)), class_getInstanceMethod([self class], @selector(memory_popToViewController:animated:)));
    method_exchangeImplementations(class_getInstanceMethod([self class], @selector(popToRootViewControllerAnimated:)), class_getInstanceMethod([self class], @selector(memory_popToRootViewControllerAnimated:)));
#endif
}

- (UIViewController *)memory_popViewControllerAnimated:(BOOL)animated
{
    UIViewController *viewController = [self memory_popViewControllerAnimated:animated];
    [viewController checkMemory];
    return viewController;
}

- (nullable NSArray<__kindof UIViewController *> *)memory_popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSArray *arr = [self memory_popToViewController:viewController animated:animated];
    [arr enumerateObjectsUsingBlock:^(UIViewController *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj checkMemory];
    }];
    return arr;
}

- (nullable NSArray<__kindof UIViewController *> *)memory_popToRootViewControllerAnimated:(BOOL)animated
{
    NSArray *arr = [self memory_popToRootViewControllerAnimated:animated];
    [arr enumerateObjectsUsingBlock:^(UIViewController *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj checkMemory];
    }];
    return arr;
}
@end
