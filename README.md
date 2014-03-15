TJLProgressView
===========
A subclass of UIProgressView that takes a NSProgress which it monitors and updates automatically. Also can be show vertically rather than just horizontally. Will be automatically removed when progress is complete.

Usage
===========
Works just like a normal UIProgressView, except you initialize it with an NSProgress object like so:
`[[TJLProgressView alloc] initWithProgress:self.progressIndicator progressViewStyle:UIProgressViewStyleBar];`

It will then automatically update itself as the given NSProgress object updates.

There are also convenience methods for showing it from a view such as:
```
TJLProgressView *navBarProgress = [[TJLProgressView alloc] initWithProgress:self.progressIndicator progressViewStyle:UIProgressViewStyleBar];
    [navBarProgress showFromBottomOfNavigationController:self.navigationController];

TJLProgressView *bottomProgress = [[TJLProgressView alloc] initWithProgress:self.progressIndicator progressViewStyle:UIProgressViewStyleBar];
[bottomProgress showFromBottomOfView:self.view];

    TJLProgressView *leftSideProgress = [[TJLProgressView alloc] initWithProgress:self.progressIndicator progressViewStyle:UIProgressViewStyleBar];
    [leftSideProgress showVerticallyOnLeftSideOfView:self.view havingNavigationBar:YES];


    TJLProgressView *rightProgress = [[TJLProgressView alloc] initWithProgress:self.progressIndicator progressViewStyle:UIProgressViewStyleBar];
    [rightProgress showVerticallyOnRightSideOfView:self.view havingNavigationBar:YES];
```
and yes, you did read that right, it can be shown vertically as well.

Installation
===========
TJLProgressView uses [cocoapods](http://cocoapods.org), so just put `pod 'TJLProgressView' 'version'` into your podfile and install like normal. then just `#import <TJLProgressView/TJLProgressView.h>` wherever you want to use it.

<h1>License</h1>
If you use TJLProgressView and you like it, feel free to let me know, <terry@ploverproductions.com>. If you have any issue or want to make improvements, submit a pull request.<br><br>

The MIT License (MIT)
Copyright (c) 2014 Terry Lewis II

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
<br><br>
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
<br><br>
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
