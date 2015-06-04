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

- (void)testLocalizationLabel
{
    UILabel *label = [[UILabel alloc] init];
    label.text = @"pompeu_test_label";
    [label pmp_localizate];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.00 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        XCTAssertEqualObjects(label.text, @"label text");
    });
}

- (void)testLocalizationButton
{
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"pompeu_test_button_default" forState:UIControlStateNormal];
    [button setTitle:@"pompeu_test_button_highlighted" forState:UIControlStateHighlighted];
    [button setTitle:@"pompeu_test_button_selected" forState:UIControlStateSelected];
    [button setTitle:@"pompeu_test_button_disabled" forState:UIControlStateDisabled];
    
    [button pmp_localizate];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.00 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        XCTAssertEqualObjects([button titleForState:UIControlStateNormal], @"default button title");
        XCTAssertEqualObjects([button titleForState:UIControlStateHighlighted], @"highlighted button title");
        XCTAssertEqualObjects([button titleForState:UIControlStateSelected], @"selected button title");
        XCTAssertEqualObjects([button titleForState:UIControlStateDisabled], @"disabled button title");
    });
}

- (void)testLocalizationTextView
{
    UITextView *textView = [[UITextView alloc] init];
    textView.text = @"pompeu_test_textview";
    [textView pmp_localizate];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.00 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        XCTAssertEqualObjects(textView.text, @"text view text");
    });
}

- (void)testLocalizationTextField
{
    UITextField *textField = [[UITextField alloc] init];
    textField.text = @"pompeu_test_textfield";
    [textField pmp_localizate];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.00 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        XCTAssertEqualObjects(textField.text, @"text field text");
    });
}

- (void)testLocalizationSegmentedView
{
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"pompeu_test_segmented_first", @"pompeu_test_segmented_second", @"pompeu_test_segmented_third"]];
    
    [segmentedControl pmp_localizate];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.00 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        XCTAssertEqualObjects([segmentedControl titleForSegmentAtIndex:0], @"first segment title");
        XCTAssertEqualObjects([segmentedControl titleForSegmentAtIndex:1], @"second segment title");
        XCTAssertEqualObjects([segmentedControl titleForSegmentAtIndex:2], @"third segment title");
    });
}

- (void)testNavigationLocalization
{
    UIViewController *first = [[UIViewController alloc] init];
    UIViewController *second = [[UIViewController alloc] init];
    UIViewController *third = [[UIViewController alloc] init];
    
    first.title = @"pompeu_test_navigation_first";
    second.title = @"pompeu_test_navigation_second";
    third.title = @"pompeu_test_navigation_third";
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:first];
    [navigationController pushViewController:second animated:NO];
    [navigationController pushViewController:third animated:NO];
    
    [third pmp_localizate];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (0.00 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        XCTAssertEqualObjects(first.navigationItem.title, @"first controller");
        XCTAssertEqualObjects(second.navigationItem.title, @"second controller");
        XCTAssertEqualObjects(third.navigationItem.title, @"third controller");
    });
}

@end
