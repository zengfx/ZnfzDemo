//
//  YqPageControl.m
//  hy_Iphone
//
//  Created by zengfx on 14-2-20.
//  Copyright (c) 2014年 zengfx All rights reserved.
//

#import "YqPageControl.h"

@implementation YqPageControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        activeImage = [UIImage imageNamed:@"page_selected"];
        inactiveImage = [UIImage imageNamed:@"page"] ;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void) updateDots
{
    for (int i = 0; i < [self.subviews count]; i++)
    {
        UIImageView* dot = [self.subviews objectAtIndex:i];
        CGSize size;
        
        size.height = 10;     //自定义圆点的大小
        
        size.width = 10;      //自定义圆点的大小
        [dot setFrame:CGRectMake(dot.frame.origin.x, dot.frame.origin.y, size.width, size.width)];
        
        if (i == self.currentPage){
            dot.image = activeImage;
        }else{
            dot.image = inactiveImage;
        }
        
    }
}

-(void) setCurrentPage:(NSInteger)page
{
    [super setCurrentPage:page];
    
    [self updateDots];
}

@end
