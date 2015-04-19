//
//  AFURLConnection.m
//  AsyncImageViewLoader+Circle
//
//  Created by yangjie on 15/4/19.
//  Copyright (c) 2015年 yangjie. All rights reserved.
//

#import "AFURLConnection.h"

@implementation AFURLConnection

+ (id)request:(NSURL *)requestURL succ:(fetchSucc)fetchSuccBlock fail:(fetchFail)fetchFailBlock progress:(fetchProgress)fetchProgressBlock {
    
    return [[self alloc] initWithURL:requestURL succ:fetchSuccBlock fail:fetchFailBlock progress:fetchProgressBlock];
}

- (id)initWithURL:(NSURL *)requestURL succ:(fetchSucc)fetchSuccBlock fail:(fetchFail)fetchFailBlock progress:(fetchProgress)fetchProgressBlock {
    
    if (self = [super initWithRequest:[NSURLRequest requestWithURL:requestURL] delegate:self]) {
        
        afData = [[NSMutableData alloc] init];
        afFetchSuccBlock = fetchSuccBlock;
        afFetchFailBlock = fetchFailBlock;
        afFetchProgressBlock = fetchProgressBlock;
        
        [self start];
    }
    return self;
}

#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    allSize = response.expectedContentLength;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    [afData appendData:data];
    
    if (afFetchProgressBlock) {
        afFetchProgressBlock(allSize, afData.length);
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    if (afFetchSuccBlock) {
        afFetchSuccBlock(afData);
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    if (afFetchFailBlock) {
        afFetchFailBlock(error);
    }
}

@end
