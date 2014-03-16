//
//  TJLProgressView.m
//  TJLProgressView
//
//  Created by Terry Lewis II on 3/5/14.
//  Copyright (c) 2014 Blue Plover Productions LLC. All rights reserved.
//

#import "TJLProgressView.h"

#define tjl_degToRadians(x) ((x)/180.0*M_PI)

void *observerContext = &observerContext;

@interface TJLProgressView ()

@end

@implementation TJLProgressView

- (instancetype)initWithProgress:(NSProgress *)progress progressViewStyle:(UIProgressViewStyle)style {
    self = [super initWithProgressViewStyle:style];
    if(!self) {
        return nil;
    }

    [progress addObserver:self forKeyPath:@"fractionCompleted" options:NSKeyValueObservingOptionNew context:observerContext];

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
                              constant:1],
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

- (void)showFromBottomOfView:(UIView *)parent {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [parent addSubview:self];
    [parent addConstraints:@[
            [NSLayoutConstraint
                    constraintWithItem:self
                             attribute:NSLayoutAttributeBottom
                             relatedBy:NSLayoutRelationEqual
                                toItem:parent
                             attribute:NSLayoutAttributeBottom
                            multiplier:1.0
                              constant:-1],
            [NSLayoutConstraint
                    constraintWithItem:self
                             attribute:NSLayoutAttributeLeading
                             relatedBy:NSLayoutRelationEqual
                                toItem:parent
                             attribute:NSLayoutAttributeLeading
                            multiplier:1.0
                              constant:0],
            [NSLayoutConstraint
                    constraintWithItem:self
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                                toItem:parent
                             attribute:NSLayoutAttributeWidth
                            multiplier:1.0
                              constant:0]
    ]];
}

- (void)showVerticallyOnLeftSideOfView:(UIView *)parent havingNavigationBar:(BOOL)havingNavBar {
    [parent addSubview:self];

    CGFloat widthOffset = havingNavBar ? 64 : 0;
    self.layer.anchorPoint = CGPointMake(0.0f, 0.5f);
    self.frame = (CGRect){
            .origin.x = 2,
            .origin.y = CGRectGetMaxY(parent.bounds) - 1,
            .size.width = CGRectGetHeight(parent.bounds) - widthOffset,
            .size.height = 0
    };

    self.transform = CGAffineTransformMakeRotation((CGFloat)tjl_degToRadians(-90));
}

- (void)showVerticallyOnRightSideOfView:(UIView *)parent havingNavigationBar:(BOOL)havingNavBar {
    [parent addSubview:self];

    CGFloat widthOffset = havingNavBar ? 64 : 0;
    self.layer.anchorPoint = CGPointMake(0.0f, 0.5f);
    self.frame = (CGRect){
            .origin.x = CGRectGetMaxX(parent.frame) - 2,
            .origin.y = CGRectGetMaxY(parent.bounds) - 1,
            .size.width = CGRectGetHeight(parent.bounds) - widthOffset,
            .size.height = 0
    };

    self.transform = CGAffineTransformMakeRotation((CGFloat)tjl_degToRadians(-90));
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if(observerContext == context) {
        NSProgress *currentProgress = (NSProgress *)object;
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
                    [currentProgress removeObserver:self forKeyPath:@"fractionCompleted"];
                    [self removeFromSuperview];
                }
            }];
        }
    }
}

@end
