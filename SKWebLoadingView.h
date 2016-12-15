//
//  SKWebLoadingView.h
//  Sinfo
//
//  Created by YaoZhong on 15/7/16.
//  Copyright (c) 2015年 YaoZhong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKWebLoadingView : UIView

@property (nonatomic, strong) UIImageView *sekorm;
@property (nonatomic, strong) UILabel *loadingStatusLabel;
@property (nonatomic, strong) UIActivityIndicatorView *loadActivityView;

//1:初始加载  2:重新加载
@property (nonatomic, assign) char loadStatus;

@end
