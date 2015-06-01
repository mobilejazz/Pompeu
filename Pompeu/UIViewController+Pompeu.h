//
//  UIViewController+Pompeu.h
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

#import <UIKit/UIKit.h>

@class Pompeu;

/**
 * UIViewController localizations.
 **/
@interface UIViewController (Pompeu)

/**
 * Localize the self.view and all its subviews. Also, the title, navigation items, toolbar items and tab bar item.
 * @discussion Typically you would call this method at the end of the viewDidLoad.
 **/
- (void)pmp_localizate;

/**
 * Localize the self.view and all its subviews. Also, the title, navigation items, toolbar items and tab bar item.
 * @param pompeu The localization to use. If nil, the defautl pompeu will be used.
 * @discussion Typically you would call this method at the end of the viewDidLoad.
 **/
- (void)pmp_localizateWithPompeu:(Pompeu*)pompeu;

@end

/**
 * Support for UITabBarController localization.
 **/
@interface UITabBarController (Pompeu)

/**
 * Localize the tabs of the controller.
 **/
- (void)pmp_localizateTabs;

/**
 * Localize the tabs of the controller.
 * @param pompeu The localization to use. If nil, the defautl pompeu will be used.
 **/
- (void)pmp_localizateTabsWithPompeu:(Pompeu*)pompeu;

@end
