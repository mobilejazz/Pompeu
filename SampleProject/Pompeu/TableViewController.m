//
//  TableViewController.m
//  Pompeu
//
//  Created by Joan Martin on 01/06/15.
//  Copyright (c) 2015 Mobile Jazz. All rights reserved.
//

#import "TableViewController.h"

#import "Pompeu.h"

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Localizing the controller
    [self pmp_localizate];
}

// Translating the XIB header text
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title = [super tableView:tableView titleForHeaderInSection:section];
    return [[Pompeu defaultPompeu] localizedString:title];
}

// Translating the XIB footer text
- (NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSString *title = [super tableView:tableView titleForFooterInSection:section];
    return [[Pompeu defaultPompeu] localizedString:title];
}

// Translating the header view. This do not apply on xibs.
//- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *view = [super tableView:tableView viewForHeaderInSection:section];
//    [view pmp_localizate];
//    return view;
//}

// Translating the footer view. This do not apply on xibs.
//- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    UIView *view = [super tableView:tableView viewForFooterInSection:section];
//    [view pmp_localizate];
//    return view;
//}

// Translating the cell content
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    [cell pmp_localizate];
    return cell;
}

@end
