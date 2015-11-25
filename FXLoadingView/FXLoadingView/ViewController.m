//
//  ViewController.m
//  FXLoadingView
//
//  Created by Le Phuong Tien on 4/22/15.
//  Copyright (c) 2015 Le Phuong Tien. All rights reserved.
//

#import "ViewController.h"
#import "FXLoadingView.h"

@interface ViewController () {
    FXLoadingView *loadingView;
    
    
    //test 1
    //
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    loadingView = [[FXLoadingView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:loadingView];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)start:(id)sender {
    [loadingView show];
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:loadingView selector:@selector(hide) userInfo:nil repeats:NO];
}
- (IBAction)stop:(id)sender {
    [loadingView stop];
}
- (IBAction)hide:(id)sender {
    [loadingView hide];
}

@end
