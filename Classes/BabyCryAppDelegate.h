//
//  BabyCryAppDelegate.h
//  BabyCry
//
//  Created by sung jun kim on 11. 7. 15..
//  Copyright 2011 hoam elementary school. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BabyCryAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController *nv;
}
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *nv;
-(void)animation;
-(void)animation2;

@end

