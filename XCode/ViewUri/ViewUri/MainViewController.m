//
//  ViewController.m
//  ViewUri
//
//  Created by Eduard Tomàs on 20/10/15.
//  Copyright © 2015 Hel10. All rights reserved.
//

#import "MainViewController.h"
#import "UiCreatorHelper.h"

#ifdef WINOBJC
#import <UWP/WindowsFoundation.h>
#import <UWP/WindowsSystem.h>
#endif


@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:[UiCreatorHelper labelLeft:10 top:30 withWidth: 300 andheight:30 andText:@"Enter URI:"]];
    
    self.txtUri = [UiCreatorHelper textFieldLeft:40 top:70 withWidth:300 andheight:30];
    [self.view addSubview:self.txtUri];
    
    [self.view addSubview:[UiCreatorHelper buttonLeft:10 top:110 withWidth:100 andheight:30 andText:@"Browse" onClickCall:@selector(onBrowse:) ofObject:self]];
}


-(void)showError {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"invalid URL"
                                                    message:[NSString stringWithFormat:@"The URL %@ is invalid", _txtUri.text]
                                                   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

#ifndef WINOBJC
-(void) onBrowse:(id)sender {
    NSURL* url = [NSURL URLWithString:_txtUri.text];
    if (url == nil) {
        [self showError];
    }
    else {
        [self navigateToUrl:url];
    }
    
}
-(void) navigateToUrl:(NSURL*)url {
    UIApplication* appObject = [UIApplication sharedApplication];
    [appObject openURL:url];
}
#else
-(void) onBrowse:(id)sender {
    WFUri* url = [WFUri createUri:_txtUri.text];
    if (url == nil) {
        [self showError];
    }
    else {
        [self navigateToUrl:url];
    }
}
- (void)navigateToUrl:(WFUri*) url {
    [WSLauncher launchUriAsync:url success:nil failure:nil];
}

#endif

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
