//
//  TJLProgressView.h
//  TJLProgressView
//
//  Created by Terry Lewis II on 3/5/14.
//  Copyright (c) 2014 Blue Plover Productions LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TJLProgressView : UIView

/**
* Initializes the view with an NSProgress object that will be observed in order
* to update the view and a background color for the view.
*
* @param progress An NSProgress object that you update in order to update the
* visible progress of the view. You use the NSProgress object like you normally would,
* and the view will observe the fractionComplete key-path in order to update itself.
* @param color The color you wish to use for the view.
* @return An instance of the class that can either be added manually to another view
* or added with one of the `-showFrom..` convenience methods provided.
*/
- (instancetype)initWithProgress:(NSProgress *)progress color:(UIColor *)color;

/**
* Shows the progress view just below the navigation bar, much like progress is show
* in safari.
*
* @param controller The navigation controller to show the view in.
*/
- (void)showFromNavigationBar:(UINavigationController *)controller;

@end
