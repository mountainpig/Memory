//
//  ThirdViewController.m
//  Memory
//
//  Created by 黄敬 on 2018/7/26.
//  Copyright © 2018年 hj. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdView : UIView
@property (nonatomic, strong) UIView *ownView;
@property (nonatomic, strong) UIViewController *ownViewController;
@end

@implementation ThirdView

@end

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self addTestView];
}

- (void)addTestView
{
    
    ThirdView *view = [ThirdView new];
    view.ownView = self.view;
//    view.ownViewController = self;
    [self.view addSubview:view];
    
    UIButton *popBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    popBtn.frame = CGRectMake(100, 180, 100, 40);
    popBtn.backgroundColor = [UIColor greenColor];
    [popBtn setTitle:@"popRoot" forState:UIControlStateNormal];
    [self.view addSubview:popBtn];
    [popBtn addTarget:self action:@selector(popBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)popBtnClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
