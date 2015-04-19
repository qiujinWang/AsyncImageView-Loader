//
//  ViewController.m
//  AsyncImageViewLoader+Circle
//
//  Created by yangjie on 15/4/19.
//  Copyright (c) 2015年 yangjie. All rights reserved.
//

#import "ViewController.h"

#import "AFURLConnection.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *url = @"http://attach.bbs.miui.com/forum/201305/19/105103v0p44upp5a4ll547.jpg";
    
    imgView = [[AsyncImageView alloc] initWithFrame:CGRectMake(10, 100, 300, 300)];
    [self.view addSubview:imgView];
    
    [imgView setImageURL:[NSURL URLWithString:url] placeholder:[UIImage imageNamed:@"1.jpg"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
