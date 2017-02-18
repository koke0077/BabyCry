//
//  SubViewController.h
//  BabyCry
//
//  Created by sung jun kim on 11. 7. 15..
//  Copyright 2011 hoam elementary school. All rights reserved.
//
 
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface SubViewController : UIViewController<AVAudioPlayerDelegate> {
	AVAudioPlayer *player;
	UIImageView *imageView;
	NSArray *imageFiles1;
	NSArray *imageFiles2;
	UISlider *vol;
    float slide_value;
    NSTimer *timer1;
    NSTimer *timer2;
    NSTimer *timer3;
    NSTimer *timer4;
}
@property (nonatomic, retain) AVAudioPlayer *player;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (nonatomic, retain) NSArray *imageFiles2;
@property (nonatomic, retain) NSArray *imageFiles1;
@property (nonatomic, retain) IBOutlet UISlider *vol;
- (IBAction)seg_action:(UISegmentedControl *)sender;

-(IBAction)dryon:(id)sender;
-(IBAction)cleanon:(id)sender;
-(IBAction)song1Btn:(id)sender;
-(IBAction)song2Btn:(id)sender;
-(IBAction)song3Btn:(id)sender;
-(IBAction)btnStopAll:(id)sender;
-(IBAction)sliderMove:(UISlider *)sender;

@end
