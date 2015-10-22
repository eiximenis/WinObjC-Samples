//
//  ViewController.m
//  WinControls
//
//  Created by Eduard Tomàs on 21/10/15.
//  Copyright © 2015 Hel10. All rights reserved.
//

#import "ViewController.h"
#import "UiCreatorHelper.h"
#import "CustomCheckbox.h"

@interface ViewController ()
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSString* lastMessage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lastMessage = @"";
    // Do any additional setup after loading the view, typically from a nib.
    CGRect gc = [self.view bounds];
    _tableView = [UiCreatorHelper tableView:10 top:70 withWidth:gc.size.width - 20 andHeight:gc.size.height - 80];
    _tableView.dataSource = self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"xamlcell"];
    [self.view addSubview:_tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"xamlcell" forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"iOS Segmented Control";
            break;
        case 1:
        {
            UISegmentedControl* seg = [UiCreatorHelper segmented:5 top:5 withWidth:100 andHeight:30];
            [seg addTarget:self action:@selector(segmentedChanged:) forControlEvents:UIControlEventValueChanged];
            [cell addSubview:seg];
        }
            break;
        case 2:
            cell.textLabel.text = @"Xaml checkbox";
            break;
        case 3:
        {
#ifndef WINOBJC
            cell.textLabel.text = @"Only available in Win10";
#else
            WXCCheckBox *checkBox = [CustomCheckbox create];
            checkBox.requestedTheme = WXApplicationThemeDark;
            checkBox.content = [WFPropertyValue createString:@"Check"];
            UIView *checkBoxView = [[UIView alloc] initWithFrame: CGRectMake(0.0f, 0.0f, 100.0f, cell.frame.size.height)];
            [checkBoxView setNativeElement:checkBox];
            [checkBox addCheckedEvent:^(RTObject* sender, WXRoutedEventArgs* e) {
                _lastMessage = @"Check Checked (W10)";
                [self refreshTableView];
            }];
            [checkBox addUncheckedEvent:^(RTObject* sender, WXRoutedEventArgs* e) {
                _lastMessage = @"Check Unchecked (W10)";
                [self refreshTableView];
            }];
            [cell addSubview:checkBoxView];
#endif
        }
            break;
        case 4:
        {
            cell.textLabel.text = _lastMessage;
        }
            
    }
    return cell;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
-(void) segmentedChanged:(id)sender {
    UISegmentedControl* ctl = (UISegmentedControl*)sender;
    if (ctl.selectedSegmentIndex == 0) {
        _lastMessage = @"Yes (Segmented)";
    }
    else {
        _lastMessage = @"No (Segmented)";
    }
    
    [self refreshTableView];
    
}

-(void) refreshTableView {
    NSUInteger indexes[] = {0,4};
    NSArray* paths = [[NSArray alloc] initWithObjects:[[NSIndexPath alloc] initWithIndexes:indexes length:2], nil] ;
    [_tableView reloadRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationNone];
}

@end
