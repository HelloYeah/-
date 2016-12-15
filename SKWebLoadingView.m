//
//  SKWebLoadingView.m
//  Sinfo
//
//  Created by YaoZhong on 15/7/16.
//  Copyright (c) 2015年 YaoZhong. All rights reserved.
//

#import "SKWebLoadingView.h"
#import "CommonFunction.h"
#import "UIView+Frame.h"

@interface SKWebLoadingView()
{
    CGFloat _viewWidht;
    CGFloat _viewHeight;
}
@end

@implementation SKWebLoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [CommonFunction getColorFromHexColor:@"E6E6E6"];
        _viewWidht = self.frame.size.width;
        _viewHeight = self.frame.size.height;
        
        [self addSubview:self.sekorm];
        [self addSubview:self.loadingStatusLabel];
        [self addSubview:self.loadActivityView];
    }
    return self;
}

- (UIImageView *)sekorm
{
    if (_sekorm) {
        return _sekorm;
    }
    _sekorm = [[UIImageView alloc] init];
    _sekorm.backgroundColor = [UIColor clearColor];
    _sekorm.center = CGPointMake(_viewWidht / 2, _viewHeight / 2 - 55);
    if (BELOW_IPHONE6) {
        _sekorm.bounds = CGRectMake(0, 0, 160, 30);
    } else if (IPHONE6) {
        _sekorm.bounds = CGRectMake(0, 0, ceilf(160 * 1.18), ceilf(30 * 1.18));
    } else {
        _sekorm.bounds = CGRectMake(0, 0, ceilf(160 * 1.3), ceilf(30 * 1.3));
    }
    _sekorm.image = [UIImage imageNamed:@"info_sekorm.png"];
    
    return _sekorm;
}

- (UILabel *)loadingStatusLabel
{
    if (_loadingStatusLabel) {
        return _loadingStatusLabel;
    }
    _loadingStatusLabel = [[UILabel alloc] init];
    _loadingStatusLabel.frame = CGRectMake(0, CGRectGetMaxY(_sekorm.frame) + 10, _viewWidht, 25);
    _loadingStatusLabel.backgroundColor = [UIColor clearColor];
    _loadingStatusLabel.textColor = [CommonFunction getColorFromHexColor:@"b3b3b3"];
    _loadingStatusLabel.textAlignment = NSTextAlignmentCenter;
    _loadingStatusLabel.numberOfLines = 0;
    if (BELOW_IPHONE6) {
        _loadingStatusLabel.font = [UIFont boldSystemFontOfSize:16];
    } else {
        _loadingStatusLabel.font = [UIFont boldSystemFontOfSize:18];
    }
    _loadingStatusLabel.text = @"  正在加载...";
    
    return _loadingStatusLabel;
}

- (UIActivityIndicatorView *)loadActivityView
{
    if (_loadActivityView) {
        return _loadActivityView;
    }
    _loadActivityView = [[UIActivityIndicatorView alloc] init];
    _loadActivityView.backgroundColor = [UIColor clearColor];
    if (BELOW_IPHONE6) {
        _loadActivityView.center = CGPointMake(SCREEN_WIDTH / 2 - 50, _loadingStatusLabel.center.y);
    } else {
        _loadActivityView.center = CGPointMake(SCREEN_WIDTH / 2 - 55, _loadingStatusLabel.center.y);
    }
    _loadActivityView.bounds = CGRectMake(0, 0, 30, 30);
    _loadActivityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    _loadActivityView.hidesWhenStopped = YES;
    [_loadActivityView startAnimating];
    
    return _loadActivityView;
}

- (void)setLoadStatus:(char)loadStatus
{
    if (_loadStatus == loadStatus) {
        return;
    }
    
    _loadStatus = loadStatus;
    if (_loadStatus == 1) {
        [_loadActivityView startAnimating];
        _loadingStatusLabel.text = @"  正在加载...";
    
    } else if (_loadStatus == 2) {
        [_loadActivityView stopAnimating];
        _loadingStatusLabel.text = @"亲，网络不给力哦\n点击屏幕，重新加载";
        [_loadingStatusLabel sizeToFit];
        _loadingStatusLabel.centerX = self.centerX;
    }
}

@end
