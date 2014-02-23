//
//  ZnfzMainViewController.m
//  hy_Iphone
//
//  Created by zengfx on 14-2-20.
//  Copyright (c) 2014年 zengfx All rights reserved.
//

#import "ZnfzMainViewController.h"

//#define frontViewLocal  CGRectMake(0,0,320,416)


@interface ZnfzMainViewController ()

@end

@implementation ZnfzMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // add navigation
    [self installNavigationInfo];
    
    CGRect bounds = self.view.frame;  //获取界面区域
    NSLog(@"self.view.width: 0%f, self.view.high: 0%f",bounds.size.width,bounds.size.height);
    
    //创建UIScrollView
    [_scrviewWithznfz setContentSize:CGSizeMake(bounds.size.width * 2, bounds.size.height)];  //设置全部内容的尺寸，这里帮助图片是3张，所以宽度设为界面宽度*3，高度和界面一致。
    _scrviewWithznfz.pagingEnabled = YES;  //设为YES时，会按页滑动
    _scrviewWithznfz.bounces = NO; //取消UIScrollView的弹性属性，这个可以按个人喜好来定
    [_scrviewWithznfz setDelegate:self];//UIScrollView的delegate函数在本类中定义
    _scrviewWithznfz.showsHorizontalScrollIndicator = NO;  //因为我们使用UIPageControl表示页面进度，所以取消UIScrollView自己的进度条。
    
    [_scrviewWithznfz addSubview:_frontView];//将UIImageView添加到UIScrollView中。
    [self.view addSubview:_scrviewWithznfz]; //将UIScrollView添加到主界面上。
    
    //创建UIPageControl
    _yqPage = [[YqPageControl alloc] initWithFrame:CGRectMake(0, bounds.size.height - 20, bounds.size.width, 20)];  //创建UIPageControl，位置在屏幕最下方。
    _yqPage.userInteractionEnabled = NO;
    _yqPage.numberOfPages = 2;//总的图片页数
    _yqPage.currentPage = 0; //当前页
    [_yqPage addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];  //用户点击UIPageControl的响应函数
    [self.view addSubview:_yqPage];  //将UIPageControl添加到主界面上
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -设置导航栏
-(void)installNavigationInfo{
    // 设置背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"dingBuBeiJing.png"] forBarMetrics:UIBarMetricsDefault];
    
    //设置菜单栏左边的返回按钮
    UIButton *backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame=CGRectMake(0, 0, 40, 40);
    [backButton setImage:[UIImage imageNamed:@"fanHuiButton.png"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"fanHuiButton_bg.png"] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem=[[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem=backButtonItem;
    
    // 设置rightBarItem
    UIButton *rightBackButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightBackButton.frame=CGRectMake(280, 0, 40, 40);
    [rightBackButton setImage:[UIImage imageNamed:@"fangZi.png"] forState:UIControlStateNormal];
    [rightBackButton setImage:[UIImage imageNamed:@"fangZiHou.png"] forState:UIControlStateHighlighted];
    [rightBackButton addTarget:self action:@selector(rightBackButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButtonItem1=[[UIBarButtonItem alloc]initWithCustomView:rightBackButton];
    self.navigationItem.rightBarButtonItem=backButtonItem1;
    //设置表头的信息
    self.navigationItem.title = @"疾病百科";
}

#pragma mark -导航栏返回按钮的方法
-(void)backButtonClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightBackButtonClick{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //更新UIPageControl的当前页
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    [_yqPage setCurrentPage:offset.x / bounds.size.width];
    //    NSLog(@"%f",offset.x / bounds.size.width);
}

//然后是点击UIPageControl时的响应函数pageTurn
- (void)pageTurn:(UIPageControl*)sender
{
    //令UIScrollView做出相应的滑动显示
    CGSize viewSize = _scrviewWithznfz.frame.size;
    //    NSLog(@"h: 0.0%f,w: 0.0%f",viewSize.height,viewSize.width);
    CGRect rect = CGRectMake(sender.currentPage * viewSize.width, 0, viewSize.width, viewSize.height);
    [_scrviewWithznfz scrollRectToVisible:rect animated:YES];
}

- (IBAction)clickToBack:(id)sender {
    NSLog(@"点击了前照");
    [UIView beginAnimations:nil context:nil];
    //指定动画的持续时间
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:_frontView.superview cache:YES];
    
    [_frontView.superview addSubview:_backView];
    [UIView commitAnimations];
}

- (IBAction)clickToFront:(id)sender {
    NSLog(@"点击了后照");
    [UIView beginAnimations:nil context:nil];
    //指定动画的持续时间
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:_backView.superview cache:YES];
    
    [_backView.superview addSubview:_frontView];
    [UIView commitAnimations];
}

- (IBAction)clickWomanWithFront:(id)sender {
    [UIView beginAnimations:nil context:nil];
    //指定动画的持续时间
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    _frontViewWithWoman.alpha = 0;
    [_frontView.superview addSubview:_frontViewWithWoman];
    _frontViewWithWoman.alpha = 1;
    [UIView commitAnimations];
}

- (IBAction)clickManWithFront:(id)sender {
    [UIView beginAnimations:nil context:nil];
    //指定动画的持续时间
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    _frontView.alpha = 0;
    [_frontViewWithWoman.superview addSubview:_frontView];
    _frontView.alpha = 1;
    [UIView commitAnimations];
}

- (IBAction)clickToBackWithWoman:(id)sender {
    [UIView beginAnimations:nil context:nil];
    //指定动画的持续时间
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:_frontViewWithWoman.superview cache:YES];
    
    [_frontViewWithWoman.superview addSubview:_backViewWithWoman];
    [UIView commitAnimations];
}

- (IBAction)clickToFrontWithWoman:(id)sender {
    [UIView beginAnimations:nil context:nil];
    //指定动画的持续时间
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:_backViewWithWoman.superview cache:YES];
    
    [_backViewWithWoman.superview addSubview:_frontViewWithWoman];
    [UIView commitAnimations];
}

- (IBAction)clickManWithBack:(id)sender {
    [UIView beginAnimations:nil context:nil];
    //指定动画的持续时间
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    _backView.alpha = 0;
    [_backViewWithWoman.superview addSubview:_backView];
    _backView.alpha = 1;
    [UIView commitAnimations];
}

- (IBAction)clickWomanWithBack:(id)sender {
    [UIView beginAnimations:nil context:nil];
    //指定动画的持续时间
    [UIView setAnimationDuration:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    _backViewWithWoman.alpha = 0;
    [_backView.superview addSubview:_backViewWithWoman];
    _backViewWithWoman.alpha = 1;
    [UIView commitAnimations];
}
@end
