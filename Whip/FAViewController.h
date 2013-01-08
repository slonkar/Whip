//
//  FAViewController.h
//  Whip
//
//  Created by Sumit Lonkar on 5/14/12.
//  Copyright (c) 2012 Finger Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import<AudioToolbox/AudioServices.h>
#import<AVFoundation/AVFoundation.h>

@interface FAViewController : UIViewController
@property(nonatomic,assign)IBOutlet UIImageView *background;
@property(nonatomic,retain)AVAudioPlayer *whipButtonAudioPlayer;
@property(nonatomic,retain)AVAudioPlayer *whipShakeAudioPlayer;
@property(nonatomic,retain)UIButton *whipButton;

@end
