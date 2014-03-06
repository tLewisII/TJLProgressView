//
//  TJLProgressView.h
//  TJLProgressView
//
//  Created by Terry Lewis II on 3/5/14.
//  Copyright (c) 2014 Blue Plover Productions LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TJLProgressView : UIView
- (instancetype)initWithProgress:(NSProgress *)progress;

- (void)showInNavigationBar:(UINavigationController *)controller;
@end
