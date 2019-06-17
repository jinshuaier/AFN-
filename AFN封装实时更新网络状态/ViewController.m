//
//  ViewController.m
//  AFN封装实时更新网络状态
//
//  Created by 李堪阶 on 15/11/8.
//  Copyright © 2015年 LG. All rights reserved.
//

#import "ViewController.h"
#import "LGReachability.h"
#import "CXNoNetWorkView.h"


@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *webView;

@property (nonatomic,copy) NSString *status;
@property (nonatomic, strong) CXNoNetWorkView *noNetWorkView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.noNetWorkView = [[CXNoNetWorkView alloc]initWithFrame:self.view.frame reloadBlock:^{
        NSLog(@"点击了重试");
        
    }];
    //真机测试时在同一个页面测试不同的网络的状态
    [LGReachability LGwithSuccessBlock:^(NSString *status) {
        
        NSLog(@"网络状态%@",status);
        self.status = status;
        
        if ([status isEqualToString:@"无连接"]) {

            [self.noNetWorkView showNoNetWorkView:self.view];
            
        } else if ([status isEqualToString:@"3G/4G网络"]){
            [self.noNetWorkView dismissNoNetWorkView];
            
        }else if ([status isEqualToString:@"wifi状态下"]){
            [self.noNetWorkView dismissNoNetWorkView];
        }
        
    }] ;
    
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
