//
//  FirstViewController.m
//  Protols
//
//  Created by zhz on 13/02/2017.
//  Copyright © 2017 zhz. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "User.h"

@interface FirstViewController () <UserDelegate>

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    [[User shareUser].delegate addUserDelegate:self];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[User shareUser] run];
    
}

//- (void)viewWillDisappear:(BOOL)animated  {
//    [super viewWillDisappear:animated];
//    [[User shareUser].delegate removeUserDelegate:self];
//}

- (void)dealloc {
    [[User shareUser].delegate removeUserDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    SecondViewController *f = [SecondViewController new];
    [self.navigationController pushViewController:f animated:YES];
}

- (void)log {
    NSLog(@"11111111");
}

@end
