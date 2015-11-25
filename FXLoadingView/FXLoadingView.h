//
//  FXLoadingView.h
//  FXLoadingView
//
//  Created by Le Phuong Tien on 4/22/15.
//  Copyright (c) 2015 Le Phuong Tien. All rights reserved.
//

#import <UIKit/UIKit.h>

#define _fxLoadingViewSizeWidth  60.0f
#define _fxLoadingViewSizeHeight 60.0f

#define _fxLoadingViewAlpha      0.5f

@protocol FXLoadingViewDelegate;

@interface FXLoadingView : UIView

@property (nonatomic) BOOL isShow;
@property (nonatomic, weak) id<FXLoadingViewDelegate>delegate;

- (void) show;
- (void) stop;
- (void) hide;

@end


@protocol FXLoadingViewDelegate <NSObject>

@optional
- (void) fxLoadingView:(FXLoadingView*)loadingView isShowLoading:(BOOL)isShow;

@end
