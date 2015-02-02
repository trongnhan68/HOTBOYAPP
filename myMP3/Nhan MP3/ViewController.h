//
//  ViewController.h
//  Nhan MP3
//
//  Created by nhannlt on 01/02/2015.
//  Copyright (c) Năm 2015 nhannlt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SongModel.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *labelPlaytime;
@property (weak, nonatomic) IBOutlet UIButton *btnPlay;
@property (weak, nonatomic) IBOutlet UIButton *btnStop;
@property (weak, nonatomic) IBOutlet UIButton *btnRefresh;
@property (nonatomic,strong) NSMutableArray *SongDetails;
@property (nonatomic,strong)  NSNumber *checkValue;
- (IBAction)FunPlay;
- (IBAction)FunStop;
@property (weak, nonatomic) IBOutlet UITableView *tableviewItem;

-(NSString *) getFileNameFromURL:(NSURL *)url;
-(IBAction)reloadFile;

@end

