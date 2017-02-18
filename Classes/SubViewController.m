//
//  SubViewController.m
//  BabyCry
//
//  Created by sung jun kim on 11. 7. 15..
//  Copyright 2011 hoam elementary school. All rights reserved.
//

#import "SubViewController.h"
#import "BabyCryAppDelegate.h"

@implementation SubViewController
@synthesize imageView, imageFiles1, imageFiles2, vol, player;

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self baby_cryFace];
    slide_value = 0.2;
    
    self.segment.selectedSegmentIndex = 0;
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)baby_cryFace{
    UIImage *image1 = [UIImage imageNamed:@"cry1.png"];
    UIImage *image2 = [UIImage imageNamed:@"cry2.png"];
    UIImage *image3 = [UIImage imageNamed:@"cry3.png"];
    imageFiles1 = [NSArray arrayWithObjects:image1, image2, image3, nil];
    imageView.animationImages = imageFiles1;
    imageView.animationDuration = 1;
    imageView.animationRepeatCount = 1000;
    [imageView startAnimating];
}

-(void)baby_face{
    
    UIImage *image4 = [UIImage imageNamed:@"sleep1.png"];
    UIImage *image5 = [UIImage imageNamed:@"sleep2.png"];
    UIImage *image6 = [UIImage imageNamed:@"sleep3.png"];
    imageFiles2 = [NSArray arrayWithObjects:image4, image5, image6, nil];
    imageView.animationImages = imageFiles2;
    imageView.animationDuration = 1;
    imageView.animationRepeatCount = 1000;
    [imageView startAnimating];
}

- (void)playAudio {
    [player play];
}

- (void)pauseAudio {
    [player pause];
}

- (void)togglePlayPause {
    if (!player.playing) {
        [self playAudio];
    } else if (player.playing) {
        [self pauseAudio];
    }
}

- (void)remoteControlReceivedWithEvent:(UIEvent *)event {
    if (event.type == UIEventTypeRemoteControl) {
        if (event.subtype == UIEventSubtypeRemoteControlPlay) {
            [self playAudio];
        } else if (event.subtype == UIEventSubtypeRemoteControlPause) {
            [self pauseAudio];
        } else if (event.subtype == UIEventSubtypeRemoteControlTogglePlayPause) {
            [self togglePlayPause];
        }
    }
}

-(IBAction)sliderMove:(UISlider *)sender{
    player.volume = [sender value];
    slide_value = [sender value];
}

- (IBAction)seg_action:(UISegmentedControl *)sender {
    
//    NSLog(@"segSelected = %d", (int)sender.selectedSegmentIndex);
}

-(void)detect_seg{
    
    if(self.segment.selectedSegmentIndex == 0){
        
        [NSTimer scheduledTimerWithTimeInterval:300 target:self selector:@selector(first_time:) userInfo:nil repeats:NO];
        [timer1 fire];
        
    }else if(self.segment.selectedSegmentIndex == 1){
        [NSTimer scheduledTimerWithTimeInterval:420 target:self selector:@selector(first_time:) userInfo:nil repeats:NO];
        
        [timer2 fire];
    }else if(self.segment.selectedSegmentIndex == 2){
        [NSTimer scheduledTimerWithTimeInterval:600 target:self selector:@selector(first_time:) userInfo:nil repeats:NO];
        
        [timer3 fire];
    }else{
        [NSTimer scheduledTimerWithTimeInterval:1800 target:self selector:@selector(first_time:) userInfo:nil repeats:NO];
        
        [timer4 fire];
    }
}

-(void)first_time:(NSTimer *)timer{
    [player stop];
    [self baby_cryFace];
    [timer invalidate];//NSTimer reset
}

-(IBAction)dryon:(id)sender{
    [self sound_start:@"dry" expire:@"wav"];
    [self baby_face];
    [self detect_seg];
}

-(IBAction)cleanon:(id)sender{
    [self sound_start:@"clean" expire:@"wav"];
    [self baby_face];
    
    [self detect_seg];
}

-(IBAction)btnStopAll:(id)sender{
	[player stop];
    [self baby_cryFace];
    [self invalid];
}

-(void)invalid{
    [timer1 invalidate];
    [timer2 invalidate];
    [timer3 invalidate];
    [timer4 invalidate];

}

-(IBAction)song1Btn:(id)sender{
    [self sound_start:@"sleep1" expire:@"mp3"];
    [self baby_face];
    
    [self detect_seg];
}

-(IBAction)song2Btn:(id)sender{
    [self sound_start:@"sleep2" expire:@"mp3"];
    [self baby_face];
    
    [self detect_seg];
}

-(IBAction)song3Btn:(id)sender{
    [self sound_start:@"sleep3" expire:@"mp3"];
    [self baby_face];
    
    [self detect_seg];
}

-(void) sound_start:(NSString *)sound_name expire:(NSString *)exp{
    [player stop];
    NSString *name_sound = sound_name;
    NSError *error;
    NSString *path = [[NSBundle mainBundle]pathForResource:name_sound ofType:exp];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    player.delegate = self;
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive: YES error: nil];
    player.volume = slide_value;
    [player prepareToPlay];
    player.numberOfLoops = 0;
    [player play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    
}

@end
