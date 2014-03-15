//
//  TJLProgressView.m
//  TJLProgressView
//
//  Created by Terry Lewis II on 3/5/14.
//  Copyright (c) 2014 Blue Plover Productions LLC. All rights reserved.
//

#import "TJLProgressView.h"

void *observerContext = &observerContext;

@interface TJLProgressView ()
@property(strong, nonatomic) NSProgress *progressIndicator;
@end

@implementation TJLProgressView

- (instancetype)initWithProgress:(NSProgress *)progress progressViewStyle:(UIProgressViewStyle)style {
    self = [super initWithProgressViewStyle:style];
    if(!self) {
        return nil;
    }

    _progressIndicator = progress;
    [self addObserver:self forKeyPath:@"progressIndicator.fractionCompleted" options:NSKeyValueObservingOptionNew context:observerContext];

    return self;
}

- (void)showFromBottomOfNavigationController:(UINavigationController *)controller {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [controller.view addSubview:self];
    [controller.view addConstraints:@[
            [NSLayoutConstraint
                    constraintWithItem:self
                             attribute:NSLayoutAttributeTop
                             relatedBy:NSLayoutRelationEqual
                                toItem:controller.navigationBar
                             attribute:NSLayoutAttributeBottom
                            multiplier:1.0
                              constant:0],
            [NSLayoutConstraint
                    constraintWithItem:self
                             attribute:NSLayoutAttributeLeading
                             relatedBy:NSLayoutRelationEqual
                                toItem:controller.navigationBar
                             attribute:NSLayoutAttributeLeading
                            multiplier:1.0
                              constant:0],
            [NSLayoutConstraint
                    constraintWithItem:self
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                                toItem:controller.navigationBar
                             attribute:NSLayoutAttributeWidth
                            multiplier:1.0
                              constant:0]
    ]];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if(observerContext == context) {
        NSNumber *num = change[NSKeyValueChangeNewKey];
        CGFloat fractionComplete = num.floatValue;

        if(fractionComplete <= 1) {
            [self setProgress:fractionComplete animated:YES];
        }
        if(fractionComplete == 1) {
            [UIView animateWithDuration:.227 delay:.227 options:UIViewAnimationOptionCurveLinear animations:^{
                self.alpha = 0;
            }                completion:^(BOOL finished) {
                if(finished) {
                    [self removeObserver:self forKeyPath:@"progressIndicator.fractionCompleted"];
                    [self removeFromSuperview];
                }
            }];
        }
    }
}

@end
