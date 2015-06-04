//
//  PompeuTests.m
//  PompeuTests
//
//  Created by Joan Martin on 01/06/15.
//  Copyright (c) 2015 Mobile Jazz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PompeuTestViewController.h"
#import "UIView+Pompeu.h"
#import "UIViewController+Pompeu.h"

@interface PompeuTests : XCTestCase

@end

@implementation PompeuTests

- (void)setUp
{
    [super setUp];
    
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testViewController
{
    PompeuTestViewController *testController = [[PompeuTestViewController alloc] initWithNibName:@"PompeuTestViewController" bundle:[NSBundle bundleForClass:[PompeuTestViewController class]]];
    
    XCTAssertNotNil(testController.view);
    
    //Execute the test after tha actual runloop since Pompeu is updating the view after that
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.00 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        XCTAssertTrue([testController.testLabel.text isEqualToString:@"label text"]);
        
        XCTAssertTrue([[testController.testButton titleForState:UIControlStateNormal] isEqualToString:@"default button title"]);
        XCTAssertTrue([[testController.testButton titleForState:UIControlStateHighlighted] isEqualToString:@"highlighted button title"]);
        XCTAssertTrue([[testController.testButton titleForState:UIControlStateSelected] isEqualToString:@"selected button title"]);
        XCTAssertTrue([[testController.testButton titleForState:UIControlStateDisabled] isEqualToString:@"disabled button title"]);
        
        XCTAssertTrue([testController.testTextView.text isEqualToString:@"text view text"]);
        
        XCTAssertTrue([testController.testTextField.text isEqualToString:@"text field text"]);
        
        XCTAssertTrue([[testController.testSegmentedControl titleForSegmentAtIndex:0] isEqualToString:@"first segment title"]);
        XCTAssertTrue([[testController.testSegmentedControl titleForSegmentAtIndex:1] isEqualToString:@"second segment title"]);
        XCTAssertTrue([[testController.testSegmentedControl titleForSegmentAtIndex:2] isEqualToString:@"third segment title"]);
    });
}



@end
