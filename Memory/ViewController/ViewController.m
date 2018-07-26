//
//  ViewController.m
//  Memory
//
//  Created by 黄敬 on 2018/7/26.
//  Copyright © 2018年 hj. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    [self addTestBtn];
}

- (void)addTestBtn
{
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pushBtn.backgroundColor = [UIColor redColor];
    pushBtn.frame = CGRectMake(100, 100, 80, 40);
    [pushBtn setTitle:@"push" forState:UIControlStateNormal];
    [self.view addSubview:pushBtn];
    [pushBtn addTarget:self action:@selector(pushBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *presentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    presentBtn.frame = CGRectMake(100, 180, 80, 40);
    presentBtn.backgroundColor = [UIColor greenColor];
    [presentBtn setTitle:@"present" forState:UIControlStateNormal];
    [self.view addSubview:presentBtn];
    [presentBtn addTarget:self action:@selector(presentBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pushBtnClick
{
    [self.navigationController pushViewController:[TestViewController new] animated:YES];
}

- (void)presentBtnClick
{
    [self.navigationController presentViewController:[TestViewController new] animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
