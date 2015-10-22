//
//  CustomCheckbox.m
//  WinControls
//
//  Created by Eduard Tomàs on 21/10/15.
//  Copyright © 2015 Hel10. All rights reserved.
//


#import "CustomCheckbox.h"

#ifdef WINOBJC
@implementation CustomCheckbox
- (void)onToggle {
    NSLog(@"Our custom checkbox has been toggled!");
    [super onToggle];
}
@end

#endif
