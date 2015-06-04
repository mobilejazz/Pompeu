//
//  PompeuTestViewController.h
//  Pompeu
//
//  Created by Paolo Tagliani on 6/4/15.
//  Copyright (c) 2015 Mobile Jazz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PompeuTestViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UIButton *testButton;
@property (weak, nonatomic) IBOutlet UITextView *testTextView;
@property (weak, nonatomic) IBOutlet UITextField *testTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *testSegmentedControl;

@end
