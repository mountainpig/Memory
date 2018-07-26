//
//  TestViewController.m
//  Memory
//
//  Created by 黄敬 on 2018/7/26.
//  Copyright © 2018年 hj. All rights reserved.
//

#import "TestViewController.h"
#import "ThirdViewController.h"

@interface TestView : UIView
@property (nonatomic, strong) UIView *ownView;
@property (nonatomic, strong) UIViewController *ownViewController;
@end

@implementation TestView

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    [self addTestView];
}

- (void)addTestView
{
    TestView *view = [TestView new];
    view.ownView = self.view;
    view.ownViewController = self;
    [self.view addSubview:view];
    
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pushBtn.backgroundColor = [UIColor redColor];
    pushBtn.frame = CGRectMake(100, 100, 80, 40);
    [pushBtn setTitle:@"push" forState:UIControlStateNormal];
    [self.view addSubview:pushBtn];
    [pushBtn addTarget:self action:@selector(pushBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *dismissBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dismissBtn.frame = CGRectMake(100, 180, 100, 40);
    dismissBtn.backgroundColor = [UIColor greenColor];
    [dismissBtn setTitle:@"dismissBtn" forState:UIControlStateNormal];
    [self.view addSubview:dismissBtn];
    [dismissBtn addTarget:self action:@selector(dismissBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pushBtnClick
{
    [self.navigationController pushViewController:[ThirdViewController new] animated:YES];
}

- (void)dismissBtnClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
