//
//  TJLProgressView.m
//  TJLProgressView
//
//  Created by Terry Lewis II on 3/5/14.
//  Copyright (c) 2014 Blue Plover Productions LLC. All rights reserved.
//

#import "TJLProgressView.h"
@interface TJLProgressView()
@property(strong, nonatomic) UINavigationController *controller;
@property(strong, nonatomic) NSProgress *progress;
@end
@implementation TJLProgressView

- (instancetype)initWithProgress:(NSProgress *)progress {
    self = [super initWithFrame:CGRectZero];
    if (!self) {
        return nil;
    }
    
    _progress = progress;
    [self addObserver:self forKeyPath:@"progress.fractionCompleted" options:NSKeyValueObservingOptionNew context:NULL];
    self.backgroundColor = [UIColor redColor];
    return self;
}

- (void)showInNavigationBar:(UINavigationController *)controller {
    self.controller = controller;
    self.frame = (CGRect){.origin.x = 0, .origin.y = CGRectGetMaxY(self.controller.navigationBar.frame) + 1, .size.width = 0, .size.height = 0};
    [self.controller.view addSubview:self];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSNumber *num = change[NSKeyValueChangeNewKey];
    CGFloat progress = num.floatValue;
    CGFloat width = CGRectGetWidth(self.controller.view.frame);
    CGFloat prog = (width * progress);
    [UIView animateWithDuration:.227 animations:^{
        self.frame = (CGRect){.origin.x = 0, .origin.y = CGRectGetMaxY(self.controller.navigationBar.frame) + 1, .size.width = prog, .size.height = 1};
    }];
}
@end
