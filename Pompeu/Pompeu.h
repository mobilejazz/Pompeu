//
//  Pompeu.h
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

#import <Foundation/Foundation.h>

#import "UIView+Pompeu.h"
#import "UIViewController+Pompeu.h"

/**
 * This class configures the localization process.
 **/
@interface Pompeu : NSObject

/**
 * Return the default localization object.
 **/
+ (Pompeu*)defaultPompeu;

/**
 * The list of prefixes to use in localization. If empty, all strings will be localized. Default array is empty.
 **/
@property (nonatomic, strong) NSArray *localizationPrefixes;

/**
 * Localizates an string if contains one of the localization prefixes.
 **/
- (NSString*)localizedString:(NSString*)string;
- (NSAttributedString*)localizedStringAttrib:(NSAttributedString*)attribString;

@end
