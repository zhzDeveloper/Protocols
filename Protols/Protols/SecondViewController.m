//
//  SecondViewController.m
//  Protols
//
//  Created by zhz on 13/02/2017.
//  Copyright © 2017 zhz. All rights reserved.
//

#import "SecondViewController.h"
#import "User.h"

@interface SecondViewController ()<UserDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    __weak typeof(self) ws = self;
    [[User shareUser].delegate addUserDelegate:ws];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[User shareUser] run];
}

- (void)dealloc {
    [[User shareUser].delegate removeUserDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [[User shareUser].delegate removeUserDelegate:self];

}

- (void)log {
    NSLog(@"222333");
}



@end
