//
//  UIImageView+Async.m
//  AsyncImageViewLoader+Circle
//
//  Created by yangjie on 15/4/19.
//  Copyright (c) 2015年 yangjie. All rights reserved.
//

#import "UIImageView+Async.h"

@implementation UIImageView (Async)

- (void)setImageURL:(NSURL *)url placeholder:(UIImage *)placeholderImage {
    
    self.image = placeholderImage;
    
    [AFURLConnection request:url succ:^(NSData *data) {
        self.image = [[UIImage alloc] initWithData:data];
    } fail:^(NSError *error) {
        //
    } progress:^(long long allSize, long long fetchedSize) {
        //
    }];
}

@end
