//
//  UIViewController+Pompeu.m
//  Copyright 2015 Mobile Jazz
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

#import "UIViewController+Pompeu.h"

#import "Pompeu.h"

@implementation UIViewController (MJZTranslations)

#pragma mark Public Methods

- (void)pmp_localizate
{
    [self pmp_localizateWithPompeu:nil];
}

- (void)pmp_localizateWithPompeu:(Pompeu*)pompeu
{
    if (pompeu == nil)
        pompeu = [Pompeu defaultPompeu];
    
    // ------------------------------------------------------------------------------------------------------------------------
    // Navigation Item Localization
    //
    
    self.navigationItem.title = [pompeu localizedString:self.navigationItem.title];
    [self.navigationItem.titleView pmp_localizate];
    
    [self.navigationItem.leftBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem *item, NSUInteger idx, BOOL *stop) {
        if (item.title)
            item.title = [pompeu localizedString:item.title];
    }];
    
    [self.navigationItem.rightBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem *item, NSUInteger idx, BOOL *stop) {
        if (item.title)
            item.title = [pompeu localizedString:item.title];
    }];
    
    // ------------------------------------------------------------------------------------------------------------------------
    // Toolbar Item Localization
    //
    
    [self.toolbarItems enumerateObjectsUsingBlock:^(UIBarButtonItem *item, NSUInteger idx, BOOL *stop) {
        if (item.title)
            item.title = [pompeu localizedString:item.title];
    }];
    
    // ------------------------------------------------------------------------------------------------------------------------
    // Title Localization
    //
    
    self.title = [pompeu localizedString:self.title];
    
    // ------------------------------------------------------------------------------------------------------------------------
    // Tab bar item Localization
    //
    
    UITabBarItem *item = self.tabBarItem;
    item.title = [pompeu localizedString:item.title];
    
    // ------------------------------------------------------------------------------------------------------------------------
    // TabBarController localization
    //
    [self.tabBarController pmp_localizateWithPompeu:pompeu];
    
    // ------------------------------------------------------------------------------------------------------------------------
    // View localization
    // The view localization is done on the next run loop to give a chance to the view to setup itself
    //
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.00 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view pmp_localizateWithPompeu:pompeu];
    });
}

@end

@implementation UITabBarController (Pompeu)

- (void)pmp_localizateTabs
{
    [self pmp_localizateTabsWithPompeu:nil];
}

- (void)pmp_localizateTabsWithPompeu:(Pompeu*)pompeu
{
    if (pompeu == nil)
        pompeu = [Pompeu defaultPompeu];
    
    [self.viewControllers enumerateObjectsUsingBlock:^(UIViewController *vc, NSUInteger idx, BOOL *stop) {
        vc.tabBarItem.title = [pompeu localizedString:vc.tabBarItem.title];
    }];
}

@end
