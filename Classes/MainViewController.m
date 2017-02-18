//
//  MainViewController.m
//  BabyCry
//
//  Created by sung jun kim on 11. 7. 15..
//  Copyright 2011 hoam elementary school. All rights reserved.
//


#import "MainViewController.h"
#import "BabyCryAppDelegate.h"


@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
}

-(IBAction) btnInfo:(id)sender{
	BabyCryAppDelegate *delegate = (BabyCryAppDelegate *)[[UIApplication sharedApplication] delegate];
	self.view1 = [[View1 alloc] initWithNibName:@"View1" bundle:nil];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
	self.view1.view.frame = CGRectMake(0, 20, screenWidth, screenHeight-20);
	[self.view addSubview:self.view1.view];
	[delegate animation];
}

-(IBAction) btn1:(id)sender{
	NSString *path = [[NSBundle mainBundle]pathForResource:@"pong" ofType:@"wav"];
	NSURL *url = [NSURL fileURLWithPath:path isDirectory:NO];
	SystemSoundID soundID;
	AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
	AudioServicesPlaySystemSound(soundID);
	subView = [[SubViewController alloc] initWithNibName:@"SubViewController" bundle:nil];
	[self.navigationController pushViewController:subView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
  
}
@end
