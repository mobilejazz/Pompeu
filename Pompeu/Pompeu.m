//
//  Pompeu.m
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

#import "Pompeu.h"

@implementation Pompeu

+ (Pompeu*)defaultPompeu
{
    static Pompeu *localization = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        localization = [[Pompeu alloc] init];
    });
    return localization;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _localizationPrefixes = @[];
    }
    return self;
}

- (NSString*)localizedString:(NSString*)string
{
    if (_localizationPrefixes.count == 0)
        return NSLocalizedString(string, nil);
        
    __block NSString *localizedString = string;
    
    [[Pompeu defaultPompeu].localizationPrefixes enumerateObjectsUsingBlock:^(NSString *prefix, NSUInteger idx, BOOL *stop) {
        if ([string hasPrefix:prefix])
        {
            localizedString = NSLocalizedString(string, nil);
            *stop = YES;
        }
    }];
    
    return localizedString;
}


-(NSAttributedString*)localizedStringAttrib:(NSAttributedString*)attribString
{
    NSMutableAttributedString *returnString = [[NSMutableAttributedString alloc]init];
    NSRange totalRange = NSMakeRange (0, attribString.length);
    
    [attribString enumerateAttributesInRange: totalRange options: 0 usingBlock: ^(NSDictionary *attributes, NSRange range, BOOL *stop)
     {
         NSString *string = [[attribString string] substringWithRange:range];
         NSString *trans = [self localizedString:string];
         
         NSAttributedString *translatedString = [[NSAttributedString alloc]initWithString:trans attributes:attributes];
         
         [returnString appendAttributedString:translatedString];
         
     }];
    
    return returnString;
}

@end
