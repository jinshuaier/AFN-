//
//  CXNoNetWorkView.m
//  CXNotNetWorkView
//
//  Created by 洪晨希 on 15/12/21.
//  Copyright © 2015年 洪晨希. All rights reserved.
//

#import "CXNoNetWorkView.h"

#define NONetworkTip @"网络连接失败"
static const CGFloat imageW = 200.0;
static const CGFloat imageH = 150.0;
static const CGFloat labelW = 300.0;
static const CGFloat labelH = 35.0;
static const CGFloat buttonW = 100.0;
static const CGFloat buttonH = 30.0;
static const CGFloat margin = 10.0;


@interface CXNoNetWorkView()

@property (nonatomic, copy) ReloadButtonClickBlock reloadButtonClick;
@property (nonatomic, strong)UIImageView *noNetworkImageView;
@property (nonatomic, strong)UILabel *noNetworkLabel;
@property (nonatomic, strong)UIButton *noNetworkButton;

@end


@implementation CXNoNetWorkView

- (instancetype)initWithFrame:(CGRect)frame reloadBlock:(ReloadButtonClickBlock)reloadButtonClick{
    
    if(self = [super initWithFrame:frame]){
    
        self.backgroundColor = [UIColor whiteColor];
        
        self.reloadButtonClick = reloadButtonClick;
        
        [self setupView];
    }
    
    return self;
    
}


- (void)setupView{
    [self noNetworkImageView];
    [self noNetworkLabel];
    [self noNetworkButton];
}

- (UIImageView *)noNetworkImageView{
    if (_noNetworkImageView == nil) {
        _noNetworkImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"no-wifi"]];
        [_noNetworkImageView setContentMode:UIViewContentModeScaleAspectFit];
        if (![_noNetworkImageView superview]) {
            [self addSubview:_noNetworkImageView];
        }
    }
    return _noNetworkImageView;
    
}

- (UILabel *)noNetworkLabel{
    if (_noNetworkLabel == nil) {
        
        _noNetworkLabel = [[UILabel alloc]init];
        _noNetworkLabel.text = NONetworkTip;
        _noNetworkLabel.font = [UIFont systemFontOfSize:17.0];
        _noNetworkLabel.textAlignment = NSTextAlignmentCenter;
        _noNetworkLabel.textColor = [UIColor grayColor];
        if (![_noNetworkLabel superview]) {
            [self addSubview:_noNetworkLabel];
        }
    }
    return _noNetworkLabel;
}

- (UIButton *)noNetworkButton{
    
    if (_noNetworkButton == nil) {
        _noNetworkButton = [[UIButton alloc]init];
        [_noNetworkButton setTitle:@"重新加载" forState:UIControlStateNormal];
        [_noNetworkButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_noNetworkButton setBackgroundColor:[UIColor grayColor]];
        _noNetworkButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
        
        [_noNetworkButton addTarget:self action:@selector(reloadButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        if (![_noNetworkButton superview]) {
            [self addSubview:_noNetworkButton];
        }
    }
    return _noNetworkButton;
    
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGRect rectImage = CGRectZero ;
    rectImage.size = CGSizeMake(imageW, imageH) ;
    rectImage.origin.x = (self.frame.size.width - imageW) / 2.0 ;
    rectImage.origin.y = (self.frame.size.height - imageH ) / 2.0 - labelH - buttonH - margin ;
    self.noNetworkImageView.frame = rectImage;
    
    CGRect rectLabel = CGRectZero ;
    rectLabel.size = CGSizeMake(labelW, labelH) ;
    rectLabel.origin.x = (self.frame.size.width - labelW) / 2.0 ;
    rectLabel.origin.y = CGRectGetMaxY(self.noNetworkImageView.frame) + 10 ;
    self.noNetworkLabel.frame = rectLabel;
    
    CGRect rectButton = CGRectZero ;
    rectButton.size = CGSizeMake(buttonW, buttonH) ;
    rectButton.origin.x = (self.frame.size.width - buttonW) / 2.0 ;
    rectButton.origin.y = CGRectGetMaxY(self.noNetworkLabel.frame) + 10 ;
    self.noNetworkButton.frame = rectButton;
    
}

- (void)reloadButtonClicked{
    self.reloadButtonClick();
}


- (void)showNoNetWorkView:(UIView *)viewWillShow{
    [viewWillShow addSubview:self];
}

- (void)dismissNoNetWorkView{
    [self removeFromSuperview];
}


@end
