//
//  UiCreatorHelper.m
//  beerhunter
//
//  Created by Eduard Tomàs on 16/10/15.
//  Copyright © 2015 Hel10. All rights reserved.
//

#import "UiCreatorHelper.h"

@implementation UiCreatorHelper
+(UITextField*)textFieldLeft:(int)x top:(int)y withWidth:(int)w andheight:(int)h {
    UITextField* textfield = [[UITextField alloc]
                              initWithFrame:CGRectMake(x, y, w, h)];
    
    textfield.borderStyle = UITextBorderStyleRoundedRect;
    return textfield;
}

+(UILabel*)labelLeft:(int)x top:(int)y withWidth:(int)w andheight:(int)h andText:(NSString*) txt {
    UILabel* label = [[UILabel alloc]
                              initWithFrame:CGRectMake(x, y, w, h)];
    
    label.text = txt;
    label.textAlignment = NSTextAlignmentLeft;
    return label;
    
}

+(UIButton*)buttonLeft:(int)x top:(int)y withWidth:(int)w andheight:(int)h andText:(NSString*) txt onClickCall:(SEL) target ofObject:(id) targetObj {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:targetObj
               action:target forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:txt forState:UIControlStateNormal];
    button.frame = CGRectMake(x, y, w,h);
    return button;
    
}
+(UIActivityIndicatorView*) activityIndicatorLeft:(int)x top:(int)y {

    UIActivityIndicatorView* activityIndicator = [[UIActivityIndicatorView alloc]
                     initWithFrame:CGRectMake(x,y, 20.0f, 20.0f)];
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    activityIndicator.hidesWhenStopped = YES;
    return activityIndicator;
}

+(void)setView:(UIView*)view gradientFrom:(UIColor*)c1 to:(UIColor*)c2 {
#ifndef WINOBJC
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[c1 CGColor], (id)[c2 CGColor], nil];
    [view.layer insertSublayer:gradient atIndex:0];
#endif
}

@end
