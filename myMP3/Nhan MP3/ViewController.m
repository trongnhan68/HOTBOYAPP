//
//  ViewController.m
//  Nhan MP3
//
//  Created by nhannlt on 01/02/2015.
//  Copyright (c) Năm 2015 nhannlt. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVAudioPlayer.h>
@interface ViewController ()
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic) BOOL isPlaying;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.audioPlayer.delegate=self;
    self.isPlaying = NO;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"loi dinh menh" ofType:@"mp3"];
   // NSData *myData = [NSData dataWithContentsOfFile:filePath];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:filePath];
    
    //Initialize the AVAudioPlayer.
       if (fileURL) {
        // do something useful
        NSLog(@"LOAD OK");
        NSError *error = nil;
           self.audioPlayer = [[AVAudioPlayer alloc]
                               initWithContentsOfURL:fileURL error:nil];

       // self.audioPlayer = [[AVAudioPlayer alloc] initWithData:myData error:&error];
        [self.audioPlayer prepareToPlay];
    }
    else
    {
            NSLog(@"LOAD fail");
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)FunPlay{

    if (self.isPlaying)
    {
        // Music is currently playing
        [self.audioPlayer pause];
        self.isPlaying = NO;
                NSLog(@"pasue");
    }
    else
    {
        // Music is currenty paused/stopped
     //   self.audioPlayer.currentTime = 0;
        [self.audioPlayer play];
        self.isPlaying = YES;
        NSLog(@"playing");
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    }
}
- (void)updateTime
{
    NSTimeInterval currentTime = self.audioPlayer.currentTime;
    
    NSInteger minutes = floor(currentTime/60);
    NSInteger seconds = trunc(currentTime - minutes * 60);
    
    // update your UI with currentTime;
    self.labelPlaytime.text = [NSString stringWithFormat:@"%d:%02d", minutes, seconds];
}
- (IBAction)FunStop {
    [self.audioPlayer stop];
    self.audioPlayer.currentTime = 0;
    self.isPlaying = NO;
}
@end
