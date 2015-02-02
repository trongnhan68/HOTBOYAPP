//
//  ControllerDownloadMusic.m
//  Nhan MP3
//
//  Created by NhanNLT on 2/2/15.
//  Copyright (c) 2015 nhannlt. All rights reserved.
//

#import "ControllerDownloadMusic.h"

@interface ControllerDownloadMusic ()

@end

@implementation ControllerDownloadMusic

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSString *stringURL = @"http://dl2-hq.mp3.zdn.vn/slaQD8Ux3jSBspP/10d710f015b0a62573005f0138cc26de/54cf3c90/2014/11/04/9/b/9b3d6608c8cdb065f7ffed31c39bc919.mp3?filename=GiuEmDi-ThuyChi.mp3";
//    NSURL  *url = [NSURL URLWithString:stringURL];
//    NSData *urlData = [NSData dataWithContentsOfURL:url];
//    if ( urlData )
//    {
//        NSArray       *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString  *documentsDirectory = [paths objectAtIndex:0];
//        
//        NSString  *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"filename.mp3"];
//        [urlData writeToFile:filePath atomically:YES];
//    }
    NSString *strURL = @"http://mp3.zing.vn";
    NSURL *url = [NSURL URLWithString:strURL];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:urlRequest];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
