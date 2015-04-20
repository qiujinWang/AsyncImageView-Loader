//
//  ProgressCircleView.m
//  AsyncImageViewLoader+Circle
//
//  Created by diandian on 15/4/20.
//  Copyright (c) 2015年 yangjie. All rights reserved.
//

#import "ProgressCircleView.h"

@implementation ProgressCircleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 5.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.85].CGColor);
    CGFloat startAngle = 0;
    CGFloat step = M_PI * 2  * self.progress;
    CGContextAddArc(context, self.bounds.size.width/2, self.bounds.size.height/2, 20, startAngle, startAngle+step, 0);
    CGContextStrokePath(context);
}


@end
