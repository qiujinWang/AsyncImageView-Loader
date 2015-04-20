//
//  AsyncImageView.m
//  AsyncImageViewLoader+Circle
//
//  Created by yangjie on 15/4/19.
//  Copyright (c) 2015年 yangjie. All rights reserved.
//

#import "AsyncImageView.h"
#import "AFURLConnection.h"
#import "ProgressCircleView.h"

@implementation AsyncImageView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        progressBkView = [[UIView alloc] initWithFrame:CGRectMake((frame.size.width - 100)/2, (frame.size.height - 6)/2, 100, 6)];
        progressBkView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.85];
        progressBkView.layer.cornerRadius = 2;
        progressBkView.layer.masksToBounds = YES;
        [self addSubview:progressBkView];
        
        progressView = [[UIView alloc] initWithFrame:CGRectMake(0, 1, 0, 4)];
        progressView.backgroundColor = [UIColor whiteColor];
        progressView.layer.cornerRadius = 1.0;
        progressView.layer.masksToBounds = YES;
        [progressBkView addSubview:progressView];
        
        circleView = [[ProgressCircleView alloc] initWithFrame:CGRectMake((frame.size.width - 100)/2, (frame.size.height - 100)/2, 100, 100)];
        circleView.backgroundColor = [UIColor clearColor];
        [self addSubview:circleView];
        
        progressBkView.hidden = YES;
        progressView.hidden = YES;
        circleView.hidden = YES;
        
        loadingStyle = kLoadingStyleLine;
    }
    return self;
}

- (void)setImageURL:(NSURL *)url placeholder:(UIImage *)placeholderImage {

    self.image = placeholderImage;
    
    [self initLoading];
    
    [AFURLConnection request:url succ:^(NSData *data) {
        
        dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, 0.25f * NSEC_PER_SEC);
        dispatch_after(delay, dispatch_get_main_queue(), ^{
            [self endLoading];
            self.image = [[UIImage alloc] initWithData:data];
        });
    } fail:^(NSError *error) {
        //
    } progress:^(long long allSize, long long fetchedSize) {
        
        CGFloat progress = fetchedSize * 1.0 / allSize;
        [self loadingProgress:progress];
    }];
}

- (void)setImageURL:(NSURL *)url placeholder:(UIImage *)placeholderImage loadingStyle:(LoadingStyle)style {
    
    loadingStyle = style;
    
    [self setImageURL:url placeholder:placeholderImage];
}

- (void)initLoading {
    
    if (loadingStyle == kLoadingStyleLine) {
        
        progressBkView.hidden = NO;
        progressView.hidden = NO;
        progressView.frame = CGRectMake(0, 0, 0, 4);
        
        circleView.hidden = YES;
    } else if (loadingStyle == kLoadingStyleCircle) {
        
        circleView.hidden = NO;
        
        progressBkView.hidden = YES;
        progressView.hidden = YES;
    }
}

- (void)loadingProgress:(CGFloat)progress {
    
    if (loadingStyle == kLoadingStyleLine) {
        
        progressView.frame = CGRectMake(0, 1, 100 * progress, 4);
    } else if (loadingStyle == kLoadingStyleCircle) {
        
        circleView.progress = progress;
        [circleView setNeedsDisplay];
    }
}

- (void)endLoading {
    
    progressBkView.hidden = YES;
    progressView.hidden = YES;
    circleView.hidden = YES;
}

@end












