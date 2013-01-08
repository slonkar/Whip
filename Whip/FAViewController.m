//
//  FAViewController.m
//  Whip
//
//  Created by Sumit Lonkar on 5/14/12.
//  Copyright (c) 2012 Finger Apps. All rights reserved.
//

#import "FAViewController.h"

@interface FAViewController ()

@end

@implementation FAViewController

@synthesize whipButtonAudioPlayer=_whipButtonAudioPlayer;
@synthesize whipShakeAudioPlayer=_whipShakeAudioPlayer;
@synthesize background=_background;
@synthesize whipButton=_whipButton;

-(void)makeWhip:(UIButton*)sender
{
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"whip" ofType:@"mp3"];
    NSData *whipSoundData1 = [[[NSData alloc] initWithContentsOfFile:soundFilePath]autorelease];
    NSError *audioError = nil;
    self.whipButtonAudioPlayer = [[[AVAudioPlayer alloc] initWithData:whipSoundData1 error:&audioError]autorelease];

    [self.whipButtonAudioPlayer setNumberOfLoops: 0];
    [self.whipButtonAudioPlayer play];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"whip" ofType:@"mp3"];
        NSData *whipSoundData2 = [[[NSData alloc] initWithContentsOfFile:soundFilePath]autorelease];
        NSError *audioError = nil;
        self.whipShakeAudioPlayer = [[[AVAudioPlayer alloc] initWithData:whipSoundData2 error:&audioError]autorelease];
        [self.whipShakeAudioPlayer setNumberOfLoops: 0];
        [self.whipShakeAudioPlayer play];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *bgImage = [UIImage imageNamed:@"Background"];
    self.background =[[[UIImageView alloc]initWithImage:bgImage]autorelease];
    [self.view addSubview:self.background];
    self.whipButton =[UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *whipImage = [UIImage imageNamed:@"Whip"];
    [self.whipButton setImage:whipImage forState:UIControlStateNormal];
    [self.whipButton addTarget:self action:@selector(makeWhip:) forControlEvents:UIControlEventTouchUpInside];
    [self.whipButton setFrame:CGRectMake(0,0, whipImage.size.width, whipImage.size.height)];
    [self.whipButton setCenter:CGPointMake((self.view.frame.size.width /2),(self.view.frame.size.height/2))];
    [self.view addSubview:self.whipButton];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {

    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)dealloc
{
    [super dealloc];
    [_whipButtonAudioPlayer release];
    [_whipShakeAudioPlayer release];
    [_background release];
    [_whipButton release];
}
    
@end
