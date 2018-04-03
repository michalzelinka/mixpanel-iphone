//
//  MPResources.m
//  Mixpanel
//
//  Created by Sam Green on 5/2/16.
//  Copyright © 2016 Mixpanel. All rights reserved.
//

#import "MPResources.h"

@implementation MPResources

+ (UIStoryboard *)storyboardWithName:(NSString *)name {
    return [UIStoryboard storyboardWithName:name bundle:[MPResources frameworkBundle]];
}

+ (NSBundle *)frameworkBundle {
    NSBundle *bundle = nil;
    NSURL *url = nil;
    if ((bundle = [NSBundle bundleForClass:[Mixpanel class]]))
        if ((url = [bundle URLForResource:@"Mixpanel" withExtension:@"bundle"]))
            return [NSBundle bundleWithURL:url];
    if ((bundle = [NSBundle bundleForClass:self.class]))
        if ((url = [bundle URLForResource:@"Mixpanel" withExtension:@"bundle"]))
            return [NSBundle bundleWithURL:url];
    if ((bundle = [NSBundle mainBundle]))
        if ((url = [bundle URLForResource:@"Mixpanel" withExtension:@"bundle"]))
            return [NSBundle bundleWithURL:url];
    return nil;
}

+ (NSString *)notificationXibName {
    NSMutableString *xibFileName = [NSMutableString stringWithString:@"MPTakeoverNotificationViewController"];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        BOOL isLandscape = UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
        if (isLandscape) {
            [xibFileName appendString:@"~iphonelandscape"];
        } else {
            [xibFileName appendString:@"~iphoneportrait"];
        }
    } else {
        [xibFileName appendString:@"~ipad"];
    }
    
    return [xibFileName copy];
}

+ (UIImage *)imageNamed:(NSString *)name {
    NSString *imagePath = [[MPResources frameworkBundle] pathForResource:name ofType:@"png"];
    return [UIImage imageWithContentsOfFile:imagePath];
}

@end
