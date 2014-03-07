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
@property(strong, nonatomic) NSProgress *progress;
@property(nonatomic) NSUInteger count;
@property(strong, nonatomic) TJLProgressView *progView;
@end

@implementation TJLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.progress = [NSProgress progressWithTotalUnitCount:10];
    self.count = 0;
    self.progView = [[TJLProgressView alloc] initWithProgress:self.progress color:[UIColor blueColor]];
    [self.progView showFromNavigationBar:self.navigationController];
        
    [[NSRunLoop mainRunLoop]addTimer:[NSTimer timerWithTimeInterval:.5 target:self selector:@selector(incrementProgress:) userInfo:nil repeats:YES] forMode:NSDefaultRunLoopMode];

}
- (IBAction)incrementProgress:(id)sender {
    [self.progress setCompletedUnitCount:++self.count];
}

@end
