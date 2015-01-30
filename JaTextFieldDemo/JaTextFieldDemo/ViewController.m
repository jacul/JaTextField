//
//  ViewController.m
//  JaTextFieldDemo
//
//  Created by zxd on 15/1/29.
//  Copyright (c) 2015 Jacul. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.lastJaText setBehaviorForReturnKey:^{
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"This is the last text field" message:@"And this is a pre-defined action" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
