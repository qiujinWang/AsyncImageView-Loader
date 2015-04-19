//
//  AFURLConnection.h
//  AsyncImageViewLoader+Circle
//
//  Created by yangjie on 15/4/19.
//  Copyright (c) 2015年 yangjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^ fetchSucc)(NSData *data);

typedef void (^ fetchFail)(NSError *error);

typedef void (^ fetchProgress)(long long allSize, long long fetchedSize);

@interface AFURLConnection : NSURLConnection <NSURLConnectionDelegate, NSURLConnectionDataDelegate> {
 @private
    NSMutableData *afData;
    fetchSucc afFetchSuccBlock;
    fetchFail afFetchFailBlock;
    fetchProgress afFetchProgressBlock;
    
    long long allSize;
}

+ (id)request:(NSURL *)requestURL succ:(fetchSucc)fetchSuccBlock fail:(fetchFail)fetchFailBlock progress:(fetchProgress)fetchProgressBlock;

- (id)initWithURL:(NSURL *)requestURL succ:(fetchSucc)fetchSuccBlock fail:(fetchFail)fetchFailBlock progress:(fetchProgress)fetchProgressBlock;

@end
