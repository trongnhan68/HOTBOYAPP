//
//  ViewController.h
//  Nhan MP3
//
//  Created by nhannlt on 01/02/2015.
//  Copyright (c) Năm 2015 nhannlt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelPlaytime;
@property (weak, nonatomic) IBOutlet UIButton *btnPlay;
@property (weak, nonatomic) IBOutlet UIButton *btnStop;

- (IBAction)FunPlay;
- (IBAction)FunStop;

@end

