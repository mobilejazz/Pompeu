//
//  AppDelegate.m
//  Pompeu
//
//  Created by Joan Martin on 01/06/15.
//  Copyright (c) 2015 Mobile Jazz. All rights reserved.
//

#import "AppDelegate.h"

#import "Pompeu.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Configuring the default prefixes
    [Pompeu defaultPompeu].localizationPrefixes = @[@"ls_"];
    
    return YES;
}

@end
