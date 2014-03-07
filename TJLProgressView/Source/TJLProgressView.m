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
@property(strong, nonatomic) UINavigationController *controller;
@property(strong, nonatomic) NSProgress *progress;
@property(strong, nonatomic) NSLayoutConstraint *width;
@end

@implementation TJLProgressView

- (instancetype)initWithProgress:(NSProgress *)progress color:(UIColor *)color {
    self = [super initWithFrame:CGRectZero];
    if(!self) {
        return nil;
    }

    _progress = progress;
    [self addObserver:self forKeyPath:@"progress.fractionCompleted" options:NSKeyValueObservingOptionNew context:observerContext];
    self.backgroundColor = color;
    return self;
}

- (void)showFromNavigationBar:(UINavigationController *)controller {
    self.controller = controller;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self.controller.view addSubview:self];
    [self.controller.view addConstraints:@[
            [NSLayoutConstraint
                    constraintWithItem:self
                             attribute:NSLayoutAttributeTop
                             relatedBy:NSLayoutRelationEqual
                                toItem:self.controller.navigationBar
                             attribute:NSLayoutAttributeBottom
                            multiplier:1.0
                              constant:1],
            [NSLayoutConstraint
                    constraintWithItem:self
                             attribute:NSLayoutAttributeLeading
                             relatedBy:NSLayoutRelationEqual
                                toItem:self.controller.navigationBar
                             attribute:NSLayoutAttributeLeading
                            multiplier:1.0
                              constant:0],
            self.width = [NSLayoutConstraint
                    constraintWithItem:self
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                                toItem:nil
                             attribute:NSLayoutAttributeNotAnAttribute
                            multiplier:1.0
                              constant:0],
            [NSLayoutConstraint
                    constraintWithItem:self
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                                toItem:nil
                             attribute:NSLayoutAttributeNotAnAttribute
                            multiplier:1.0
                              constant:2],
    ]];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if(observerContext == context) {
        NSNumber *num = change[NSKeyValueChangeNewKey];
        CGFloat fractionComplete = num.floatValue;
        CGFloat width = CGRectGetWidth(self.controller.view.bounds);
        CGFloat newWidth = (width * fractionComplete);

        if(fractionComplete <= 1) {
            self.width.constant = newWidth;
            [UIView animateWithDuration:.227 animations:^{
                [self setNeedsLayout];
            }];
        }
        else {
            [UIView animateWithDuration:.227 animations:^{
                self.alpha = 0;
            }                completion:^(BOOL done) {
                [self removeObserver:self forKeyPath:@"progress.fractionCompleted"];
                [self removeFromSuperview];
            }];
        }
    }
}

@end
