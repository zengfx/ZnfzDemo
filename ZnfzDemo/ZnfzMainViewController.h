//
//  ZnfzMainViewController.h
//  hy_Iphone
//
//  Created by zengfx on 14-2-20.
//  Copyright (c) 2014年 zengfx All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YqPageControl.h"

@interface ZnfzMainViewController : UIViewController<UIScrollViewDelegate>
@property   (strong, nonatomic) IBOutlet UIScrollView *scrviewWithznfz;
@property   (strong,nonatomic)  YqPageControl *yqPage;

@property   (strong,nonatomic)  IBOutlet UIView *frontView;
@property   (strong,nonatomic)  IBOutlet UIView *backView;

@property   (strong,nonatomic)  IBOutlet UIView *frontViewWithWoman;
@property   (strong,nonatomic)  IBOutlet UIView *backViewWithWoman;

- (IBAction)clickToBack:(id)sender;
- (IBAction)clickToFront:(id)sender;
- (IBAction)clickWomanWithFront:(id)sender;
- (IBAction)clickManWithFront:(id)sender;
- (IBAction)clickToBackWithWoman:(id)sender;
- (IBAction)clickToFrontWithWoman:(id)sender;
- (IBAction)clickManWithBack:(id)sender;
- (IBAction)clickWomanWithBack:(id)sender;

@end
