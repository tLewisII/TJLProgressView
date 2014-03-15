//
//  TJLProgressView.h
//  TJLProgressView
//
//  Created by Terry Lewis II on 3/5/14.
//  Copyright (c) 2014 Blue Plover Productions LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TJLProgressView : UIProgressView

/**
* Initializes the UIProgressView with an NSProgress object that will be observed in order
* to update the progress and a style for for the view.
*
* @param progressIndicator An NSProgress object that you update in order to update the
* visible progress of the view. You use the NSProgress object like you normally would,
* and the view will observe the fractionComplete key-path in order to update itself.
* @param style The style of the progress view.
* @return An instance of the class that can either be added manually to another view
* or added with one of the `-showFrom..` convenience methods provided.
*/
- (instancetype)initWithProgress:(NSProgress *)progress progressViewStyle:(UIProgressViewStyle)style;

/**
* Shows the progress view just below the navigation bar, much like progress is shown
* in safari.
*
* @param controller The navigation controller to show the view in.
*/
- (void)showFromNavigationBar:(UINavigationController *)controller;

@end
