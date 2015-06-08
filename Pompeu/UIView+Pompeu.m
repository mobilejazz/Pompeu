//
//  UIView+Pompeu.m
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

#import "UIView+Pompeu.h"
#import "Pompeu.h"

@implementation UIView (Pompeu)

#pragma mark Public Methods

- (void)pmp_localizate
{
    [self pmp_localizateWithPompeu:nil];
}

- (void)pmp_localizateWithPompeu:(Pompeu*)localization
{
    if (localization == nil)
        localization = [Pompeu defaultPompeu];
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:self];
    
    while (array.count > 0)
    {
        UIView *view = [array firstObject];
        
        if ([view isKindOfClass:UILabel.class])
        {
            UILabel *label = (id)view;
            label.attributedText = [localization localizedStringAttrib:label.attributedText];
        }
        else if ([view isKindOfClass:UITextField.class])
        {
            UITextField *textField = (id)view;
            textField.text = [localization localizedString:textField.text];
            textField.placeholder = [localization localizedString:textField.placeholder];
        }
        else if ([view isKindOfClass:UITextView.class])
        {
            UITextView *textView = (id)view;
            if (textView.attributedText == nil)
                textView.text = [localization localizedString:textView.text];
        }
        else if ([view isKindOfClass:UIButton.class])
        {
            UIButton *button = (id)view;
            
            void (^localizeButtonForState)(UIControlState) = ^(UIControlState state){
                NSString *text = [button titleForState:state];
                [button setTitle:[localization localizedString:text] forState:state];
            };
            
            localizeButtonForState(UIControlStateNormal);
            localizeButtonForState(UIControlStateHighlighted);
            localizeButtonForState(UIControlStateSelected);
            localizeButtonForState(UIControlStateDisabled);
        }
        else if ([view isKindOfClass:UISegmentedControl.class])
        {
            UISegmentedControl * segment = (UISegmentedControl *)view;
            
            for (int i=0; i<[segment numberOfSegments]; i++)
            {
                NSString *title = [localization localizedString:[segment titleForSegmentAtIndex:i]];
                [segment setTitle:title forSegmentAtIndex:i];
            }
                
            [array removeObjectAtIndex:0];
            continue;
        }
        
        [array removeObjectAtIndex:0];
        [array addObjectsFromArray:view.subviews];
    }
}

@end
