//
//  UiCreatorHelper.h
//  beerhunter
//
//  Created by Eduard Tomàs on 16/10/15.
//  Copyright © 2015 Hel10. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UiKit.h>

@interface UiCreatorHelper : NSObject

+(UITextField*)textFieldLeft:(int)x top:(int)y withWidth:(int)w andheight:(int)h;
+(UILabel*)labelLeft:(int)x top:(int)y withWidth:(int)w andheight:(int)h andText:(NSString*) txt;
+(UIButton*)buttonLeft:(int)x top:(int)y withWidth:(int)w andheight:(int)h andText:(NSString*) txt onClickCall:(SEL) target ofObject:(id) targetObj;
+(UIActivityIndicatorView*) activityIndicatorLeft:(int)x top:(int)y;
+(void)setView:(UIView*)view gradientFrom:(UIColor*)c1 to:(UIColor*)c2;
@end
