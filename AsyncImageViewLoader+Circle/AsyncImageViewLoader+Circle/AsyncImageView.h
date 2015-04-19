//
//  AsyncImageView.h
//  AsyncImageViewLoader+Circle
//
//  Created by yangjie on 15/4/19.
//  Copyright (c) 2015年 yangjie. All rights reserved.
//

#import <UIKit/UIKit.h>

// Loading Style
typedef enum _LoadingStyle {
    kLoadingStyleLine = 0,
    kLoadingStyleCircle,
} LoadingStyle;

@interface AsyncImageView : UIImageView {
 @private
    UIView *progressBkView;
    UIView *progressView;
    
    LoadingStyle loadingStyle;
}

- (void)setImageURL:(NSURL *)url placeholder:(UIImage *)placeholderImage;
@end
