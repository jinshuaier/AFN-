//
//  CXNoNetWorkView.h
//  CXNotNetWorkView
//
//  Created by 洪晨希 on 15/12/21.
//  Copyright © 2015年 洪晨希. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ReloadButtonClickBlock)();

@interface CXNoNetWorkView : UIView

- (instancetype)initWithFrame:(CGRect)frame reloadBlock:(ReloadButtonClickBlock)reloadButtonClick;

- (void)showNoNetWorkView:(UIView *)viewWillShow;

- (void)dismissNoNetWorkView;


@end
