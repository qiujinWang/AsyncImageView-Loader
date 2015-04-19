//
//  AsyncImageView.m
//  AsyncImageViewLoader+Circle
//
//  Created by yangjie on 15/4/19.
//  Copyright (c) 2015年 yangjie. All rights reserved.
//

#import "AsyncImageView.h"
#import "AFURLConnection.h"

@implementation AsyncImageView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        progressBkView = [[UIView alloc] initWithFrame:CGRectMake((frame.size.width - 100)/2, (frame.size.height - 6)/2, 100, 6)];
        progressBkView.backgroundColor = [UIColor blackColor];
        progressBkView.layer.cornerRadius = 2;
        progressBkView.layer.masksToBounds = YES;
        [self addSubview:progressBkView];
        
        progressView = [[UIView alloc] initWithFrame:CGRectMake(0, 1, 0, 4)];
        progressView.backgroundColor = [UIColor whiteColor];
        progressView.layer.cornerRadius = 1.0;
        progressView.layer.masksToBounds = YES;
        [progressBkView addSubview:progressView];
        
        progressBkView.hidden = YES;
        progressView.hidden = YES;
    }
    return self;
}

- (void)setImageURL:(NSURL *)url placeholder:(UIImage *)placeholderImage {

    self.image = placeholderImage;
    
    progressBkView.hidden = NO;
    progressView.hidden = NO;
    progressView.frame = CGRectMake(0, 0, 0, 4);
    
    [AFURLConnection request:url succ:^(NSData *data) {
        progressBkView.hidden = YES;
        progressView.hidden = YES;
        
        self.image = [[UIImage alloc] initWithData:data];
    } fail:^(NSError *error) {
        //
    } progress:^(long long allSize, long long fetchedSize) {
        
        NSLog(@"allSize -> %lli  fetchedDataSize -> %lli", allSize,fetchedSize);
        
        CGFloat progress = fetchedSize * 1.0 / allSize;
        
        NSLog(@"progress -> %lf", progress);
        
        progressView.frame = CGRectMake(0, 1, 100 * progress, 4);
    }];
}


@end












