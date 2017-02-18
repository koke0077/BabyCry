//
//  View1.m
//  BabyCry
//
//  Created by sung jun kim on 11. 8. 23..
//  Copyright 2011 hoam elementary school. All rights reserved.
//

#import "View1.h"
#import "BabyCryAppDelegate.h"

@implementation View1


-(IBAction) btnBack:(id)sender{
	BabyCryAppDelegate *delegate = (BabyCryAppDelegate *)[[UIApplication sharedApplication] delegate];
	[self.view removeFromSuperview];
    [delegate animation2];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)dealloc {

}


@end
