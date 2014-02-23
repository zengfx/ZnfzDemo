//
//  ViewController.m
//  ZnfzDemo
//
//  Created by qian haiyuan on 14-2-23.
//  Copyright (c) 2014年 zengfx. All rights reserved.
//

#import "ViewController.h"
#import "ZnfzMainViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickMe:(id)sender {
    ZnfzMainViewController *viewcontroller = [[ZnfzMainViewController alloc] initWithNibName:@"ZnfzMainViewController" bundle:nil];
    [self.navigationController pushViewController:viewcontroller animated:YES];
}
@end
