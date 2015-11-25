//
//  FXLoadingView.m
//  FXLoadingView
//
//  Created by Le Phuong Tien on 4/22/15.
//  Copyright (c) 2015 Le Phuong Tien. All rights reserved.
//

#import "FXLoadingView.h"

@implementation FXLoadingView
{
    UIActivityIndicatorView *_indicator;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configViewWithFrame:frame];
    }
    return self;
}

#pragma mark - Config
- (void) configViewWithFrame:(CGRect)frame {
    UIView *viewLoading                 = [[UIView alloc] initWithFrame:CGRectMake((frame.size.width - _fxLoadingViewSizeWidth)/2,
                                                                   (frame.size.height - _fxLoadingViewSizeHeight)/2,
                                                                   _fxLoadingViewSizeWidth,
                                                                   _fxLoadingViewSizeHeight)];
    viewLoading.backgroundColor         = [UIColor clearColor];

    viewLoading.layer.cornerRadius      = 10.0f;
    viewLoading.layer.masksToBounds     = YES;

    UIView *viewLoadingMask             = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _fxLoadingViewSizeWidth, _fxLoadingViewSizeHeight)];
    viewLoadingMask.alpha               = _fxLoadingViewAlpha;
    viewLoadingMask.backgroundColor     = [UIColor blackColor];
    
    
    _indicator                      = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    _indicator.hidesWhenStopped     = YES;
    [_indicator startAnimating];
    _indicator.frame                = CGRectMake((viewLoading.frame.size.width - 37)/2,
                                                    (viewLoading.frame.size.height - 37)/2,
                                                    37,
                                                    37);
    [viewLoading addSubview:viewLoadingMask];
    [viewLoading addSubview:_indicator];
    
    [self addSubview:viewLoading];
    
    self.alpha = 0;
    
}

#pragma mark - Public

- (void) show
{
    [_indicator startAnimating];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha  = 1;
    } completion:^(BOOL finished) {
        self.isShow = YES;

        if (_delegate && [_delegate respondsToSelector:@selector(fxLoadingView:isShowLoading:)]) {
            [_delegate fxLoadingView:self isShowLoading:self.isShow];
        }

    }];
}

- (void) stop
{
    [_indicator stopAnimating];
}

- (void) hide
{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha  = 0;
    } completion:^(BOOL finished) {
        self.isShow = NO;
        
        [_indicator stopAnimating];
        
        if (_delegate && [_delegate respondsToSelector:@selector(fxLoadingView:isShowLoading:)]) {
            [_delegate fxLoadingView:self isShowLoading:self.isShow];
        }
        
    }];
}

@end
