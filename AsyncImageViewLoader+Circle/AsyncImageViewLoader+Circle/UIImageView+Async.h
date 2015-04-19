//
//  UIImageView+Async.h
//  AsyncImageViewLoader+Circle
//
//  Created by yangjie on 15/4/19.
//  Copyright (c) 2015年 yangjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFURLConnection.h"

@interface UIImageView (Async)

- (void)setImageURL:(NSURL *)url placeholder:(UIImage *)placeholderImage;

@end
