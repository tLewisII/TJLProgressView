//
//  TJLViewController.m
//  TJLProgressView
//
//  Created by Terry Lewis II on 3/5/14.
//  Copyright (c) 2014 Blue Plover Productions LLC. All rights reserved.
//

#import "TJLViewController.h"
#import "TJLProgressView.h"

@interface TJLViewController ()
@property(strong, nonatomic) NSProgress *progressIndicator;
@property(nonatomic) NSUInteger count;
@end

@implementation TJLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.progressIndicator = [NSProgress progressWithTotalUnitCount:10];
    self.count = 0;
    TJLProgressView *navBarProgress = [[TJLProgressView alloc] initWithProgress:self.progressIndicator progressViewStyle:UIProgressViewStyleDefault];
    [navBarProgress showFromBottomOfNavigationController:self.navigationController];

    TJLProgressView *leftSideProgress = [[TJLProgressView alloc] initWithProgress:self.progressIndicator progressViewStyle:UIProgressViewStyleDefault];
    [leftSideProgress showVerticallyOnLeftSideOfView:self.view havingNavigationBar:YES];

    TJLProgressView *bottomProgress = [[TJLProgressView alloc] initWithProgress:self.progressIndicator progressViewStyle:UIProgressViewStyleDefault];
    [bottomProgress showFromBottomOfView:self.view];
    [[NSRunLoop mainRunLoop] addTimer:[NSTimer timerWithTimeInterval:.5 target:self selector:@selector(incrementProgress:) userInfo:nil repeats:YES] forMode:NSDefaultRunLoopMode];
}

- (IBAction)incrementProgress:(id)sender {
    [self.progressIndicator setCompletedUnitCount:++self.count];
}

@end
