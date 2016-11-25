[![Version](https://cocoapod-badges.herokuapp.com/v/Pompeu/badge.png)](http://cocoadocs.org/docsets/Pompeu) 
[![Platform](https://cocoapod-badges.herokuapp.com/p/Pompeu/badge.png)](http://cocoadocs.org/docsets/Pompeu)
[![Build Status](https://travis-ci.org/mobilejazz/Pompeu.png)](https://travis-ci.org/mobilejazz/Pompeu)
[![CocoaDocs](https://img.shields.io/badge/docs-%E2%9C%93-blue.svg)](http://cocoadocs.org/docsets/Pompeu/)

![Pompeu](https://raw.githubusercontent.com/mobilejazz/metadata/master/images/banners/mobile-jazz-pompeu-ios.jpg)

# Pompeu
Automatic xib and storyboard localizations for iOS

## Installation

The easiest way to install Pompeu is using Cocoa Pods:

```
pod 'Pompeu', '~> 1.0'
```

## Example of usage

On your UIViewController subclass, you just have to call to `pmp_localizate`. Typically, you would do this at the end of your `viewDidLoad` method.

```
- (void)viewDidLoad
{
  [super viewDidLoad];
  [self pmp_localizate];
}
```
By doing this call, Pompeu will:

- Iterate on the **view controller's view** subviews and localize all found strings.
- Localize the **UINavigationItem** by translating its title and titleView as well as all contained UIBarButtonItems title.
- Localize the array of **toolbar items**.
- Localize the **UITabBarItem**.
- Get the `self.tabBarController` and localize its **view controller's UITabBarItems**.

Also, you can call `pmp_localizate` on UIView instances directly. This would localizate all the contained subviews.

## Affected classes

When iterating on the UIView subview's hierarchy, Pompeu is seeking for specific subclasses to localize:
- **UILabel**: localizing the *text* property.
- **UIButton**: localizing the *title* property for the states *UIControlStateNormal*, *UIControlStateHighlighted*, *UIControlStateSelected* and *UIControlStateDisabled*.
- **UITextView**: localizing the *text* property. 
- **UITextField**: localizing the *text* and *placeholder* property.
- **UISegmentedControl**: localizing all segments titles.

## Working with Localization Prefixes

Use the `Pompeu` class to configure the localization prefixes. A prefix is used to define which strings must be localized and which don't. The `Pompeu` object has a property (array) called `localizationPrefixes` which by default is empty. This means that all strings will be localized. 

To add a custom prefix just set a custom array to `localizationPrefixes`. For example, by doing:
```
[Pompeu defaultPompeu].localizationPrefixes = @[@"ls_"];
```
only the strings with a **ls_** prefix will be localized.

**Note**:By default, all localization calls uses a default instance of the `Pompeu` class. To use an specific pompeu instance use the method `pmp_localizateWithPompeu:` instead of `pmp_localizate`.

## Special Considerations
### Best practices
The best way to use **Pompeu** in your project is to have a subclass of `UIViewController` that act as superclass of all of your other subclasses. Same applies to `UITableViewController`.

For example, we could define the class `MJViewController` (and `MJTableViewController` symetrically) and use them as superclasses of other `UIViewController`s (and `UITableViewController`s).

```
@interface MJViewController : UIViewController
@end

@implementation MJViewController
- (void)viewDidLoad
{
  [super viewDidLoad];
  [self pmp_localizate];
}
@end
```

By doing this, you don't have to add any further code to your view controllers to localize them and you are ready to go to localize as many strings as you want in your XIBs and Storyboards.

### Working with UITableViews or UICollectionViews

When workign with views that use reusable cells (as `UITableView` or `UICollectionView`), we need to localize every single reusable view. 

This applies even more when using in Storyboard static definitions of those reusable views. In this case, we need to call to `pmp_localizate` on each cell. For example, if we use a static definition on a UITableViewController subclass, we will have to add the following code:

```
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
  [cell pmp_localizate];
  return cell;
}
```

Same applies for the headers and footers:

```
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title = [super tableView:tableView titleForHeaderInSection:section];
    return [[Pompeu defaultPompeu] localizedString:title];
}

- (NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    NSString *title = [super tableView:tableView titleForFooterInSection:section];
    return [[Pompeu defaultPompeu] localizedString:title];
}
```

## Project Maintainer

This open source project is maintained by [Paolo Tagliani](https://github.com/pablosproject).

## License

    Copyright 2015 Mobile Jazz

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
