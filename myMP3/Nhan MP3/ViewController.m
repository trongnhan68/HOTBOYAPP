//
//  ViewController.m
//  Nhan MP3
//
//  Created by nhannlt on 01/02/2015.
//  Copyright (c) Năm 2015 nhannlt. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVAudioPlayer.h>
#import "cellSongDetail.h"
@interface ViewController ()
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic) BOOL isPlaying;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.SongDetails=[NSMutableArray array] ;
    self.audioPlayer.delegate=self;
    self.isPlaying = NO;
    //   [self dumpDataForSong];:
      self.labelPlaytime.text = @"00:00";
    [self dumpData2];
    
}
-(IBAction)reloadFile
{
    //  [self dumpDataForSong];
    
    [self dumpData2];
    [self.tableviewItem reloadData ];
}
-(NSString *)getFileNameFromURL:(NSURL *)url
{
    NSString *filename = [[url path] lastPathComponent];
    NSArray *parts = [filename componentsSeparatedByString:@"."];
    filename = [parts objectAtIndex:[parts count]-2];
    NSLog(filename );
    return filename;
}
-(void) dumpDataForSong
{
    
    NSURL *bundleRoot = [[NSBundle mainBundle] bundleURL];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray * dirContents =
    [fm contentsOfDirectoryAtURL:bundleRoot
      includingPropertiesForKeys:@[]
                         options:NSDirectoryEnumerationSkipsHiddenFiles
                           error:nil];
    NSPredicate * fltr = [NSPredicate predicateWithFormat:@"pathExtension='mp3'"];
    NSMutableArray * onlyMP3s = [dirContents filteredArrayUsingPredicate:fltr];
    
    for (int i=0;i<onlyMP3s.count;i++)
    {
        NSURL *tmpURL=[onlyMP3s objectAtIndex:i];
        SongModel *songModel=
        [SongModel initWithSong:
         @{
           @"songName":[self getFileNameFromURL:tmpURL],
           @"iconImage":@"nhansinger.jpg",
           @"filePath":[tmpURL path],
           }
         ];
        //  if (![self.SongDetails containsObject: songModel]) [self.SongDetails addObject:songModel];
        NSNumber *check=@(1);
        if (self.SongDetails.count!=0)
        {
            for (SongModel *item in self.SongDetails )
            {
                if ([item.songName isEqual:songModel.songName])
                {
                    check=0;
                    break;
                }
                else
                    check=@1;
                
            }
            if ([check intValue]==1)   [self.SongDetails addObject:songModel];
        }
        else [self.SongDetails addObject:songModel];
    }
}
- (IBAction)FunPlay{
    
    if (self.isPlaying)
    {
        // Music is currently playing
        [self.audioPlayer pause];
        self.isPlaying = NO;
        NSLog(@"pasue");
           [self.btnPlay setTitle:@"Paused" forState:nil];
    }
    else
    {
        // Music is currenty paused/stopped
        //   self.audioPlayer.currentTime = 0;
           [self.btnPlay setTitle:@"Playing" forState:nil];
        [self.audioPlayer play];
        self.isPlaying = YES;
        NSLog(@"playing");
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
        
    }
}
-(void) dumpData2
{
    NSString *doccumentPath= [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSURL *bundleRoot;
    NSFileManager *fm;
    bundleRoot= [NSURL URLWithString:doccumentPath];
    
    fm = [NSFileManager defaultManager];
    NSArray * dirContents =
    [fm contentsOfDirectoryAtURL:bundleRoot
      includingPropertiesForKeys:@[]
                         options:NSDirectoryEnumerationSkipsHiddenFiles
                           error:nil];
    NSPredicate * fltr = [NSPredicate predicateWithFormat:@"pathExtension='mp3'"];
    NSMutableArray * onlyMP3s = [dirContents filteredArrayUsingPredicate:fltr];
    
    for (int i=0;i<onlyMP3s.count;i++)
    {
        NSURL *tmpURL=[onlyMP3s objectAtIndex:i];
        SongModel *songModel=
        [SongModel initWithSong:
         @{
           @"songName":[self getFileNameFromURL:tmpURL],
           @"iconImage":@"nhansinger.jpg",
           @"filePath":[tmpURL path],
           }
         ];
        //   if (![self.SongDetails containsObject: songModel]) [self.SongDetails addObject:songModel];
        self.checkValue=@(1);
        if (self.SongDetails.count!=0)
        {
            for (SongModel *item in self.SongDetails )
            {
                if ([item.songName isEqual:songModel.songName])
                {
                    self.checkValue=@(0);
                    break;
                }
                else
                    self.checkValue=@(1);
                
            }
            if ([  self.checkValue intValue]==1)   [self.SongDetails addObject:songModel];
        }
        else [self.SongDetails addObject:songModel];
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.SongDetails.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"click");
    SongModel *song=[self.SongDetails objectAtIndex:indexPath.row];
    
    NSString *filePath =[song filePath];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:filePath];
    if (fileURL) {
        // do something useful
        if (!self.isPlaying)
        {
            NSLog(@"LOAD OK");
            self.audioPlayer = [[AVAudioPlayer alloc]
                                initWithContentsOfURL:fileURL error:nil];
          
            [self.audioPlayer play];
            //    [self.audioPlayer prepareToPlay];
            self.isPlaying = YES;
            NSLog(@"playing");
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
            [self.btnPlay setTitle:@"Playing" forState:nil];
        }
        else
        {
            self.isPlaying = NO;
            [self.audioPlayer pause];
            [self.btnPlay setTitle:@"Paused" forState:nil];
        }
    }
    else
    {
        NSLog(@"LOAD fail");
    }
    
    
    return YES;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellSongDetailID";
    SongModel *song;
    cellSongDetail *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    song = [self.SongDetails objectAtIndex:indexPath.row];
    
    [cell setupCellWithSongDetail:song];
    return cell;
}

@end
