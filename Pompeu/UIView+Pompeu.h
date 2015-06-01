//
//  UIView+Pompeu.h
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
 * UIView localizations.
 **/
@interface UIView (Pompeu)

/**
 * Localizates all subviews of the view recursively. This method uses the default localization.
 *
 * @discussion Localizations happends non-attributed texts of UILabels, UIButtons, UITextViews and UISegmentedControls.
 **/
- (void)pmp_localizate;

/**
 * Localizates all subviews of the view recursively.
 * @param localization The localization to use. If nil, the default localization will be used.
 * @discussion Localizations happends non-attributed texts of UILabels, UIButtons, UITextViews and UISegmentedControls.
 **/
- (void)pmp_localizateWithPompeu:(Pompeu*)localization;

@end
