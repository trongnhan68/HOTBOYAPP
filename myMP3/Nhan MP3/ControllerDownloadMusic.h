//
//  ControllerDownloadMusic.h
//  Nhan MP3
//
//  Created by NhanNLT on 2/2/15.
//  Copyright (c) 2015 nhannlt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ControllerDownloadMusic : UIViewController<UISearchBarDelegate,UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelStatusDownload;
- (IBAction)downloadVIP;
@property (weak, nonatomic) IBOutlet UISearchBar *SearchBarItem;
@property (weak, nonatomic) IBOutlet UILabel *labelSongName;
@property (weak, nonatomic) IBOutlet UIButton *btnDownload;
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (weak, nonatomic)  NSURL* currentURL;
@property (weak, nonatomic) NSString *documentsDirectoryPath;
@property (strong, nonatomic) NSString *currentFileName;
@end
