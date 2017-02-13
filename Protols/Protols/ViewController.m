//
//  ViewController.m
//  Protols
//
//  Created by zhz on 13/02/2017.
//  Copyright © 2017 zhz. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    FirstViewController *f = [FirstViewController new];
    [self.navigationController pushViewController:f animated:YES];
}

@end
