//
//  MainViewController.h
//  BabyCry
//
//  Created by sung jun kim on 11. 7. 15..
//  Copyright 2011 hoam elementary school. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface MainViewController : UIViewController {
	SubViewController *subView;
}

-(IBAction) btn1:(id)sender;//SubViewController로 이동하는 버튼
-(IBAction) btnInfo:(id)sender;//View1(앱설명화면)을 보여주는 버튼
@end
