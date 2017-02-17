//
//  main.m
//  BabyCry
//
//  Created by sung jun kim on 11. 7. 15..
//  Copyright 2011 hoam elementary school. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BabyCryAppDelegate.h"

int main(int argc, char *argv[]) {
    
//    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
//    int retVal = UIApplicationMain(argc, argv, nil, nil);
//    [pool release];
//    return retVal;
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([BabyCryAppDelegate class]));
    }
}
