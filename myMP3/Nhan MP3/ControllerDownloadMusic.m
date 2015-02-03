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
    
    //    }
    NSString *documentdir =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSLog(@"Tile Directory: %@", documentdir);
    NSLog(self.documentsDirectoryPath);
    NSString *strURL = @"http://mp3.zing.vn";
    NSURL *url = [NSURL URLWithString:strURL];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:urlRequest];
    
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"Start load");
    //    NSString* currentURL = webView.request.URL.absoluteString;
    //    NSString* mainDocumentURL = webView.request.mainDocumentURL.absoluteString;
    //    NSLog(currentURL);
    //    NSLog(mainDocumentURL);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.currentURL = webView.request.URL;
    
    NSLog(self.currentURL.absoluteString);
    //NSLog(mainDocumentURL);
}
-(IBAction)downloadVIP
{
    NSString *filename = [[self.currentURL path] lastPathComponent];
    
    if (![filename isEqual:@"/"])
    {
        NSArray *partgetfilename = [[self.currentURL path] componentsSeparatedByString:@"/"];
        self.currentFileName=[partgetfilename objectAtIndex:[partgetfilename count]-2];
        NSArray *parts = [filename componentsSeparatedByString:@"/"];
        filename = [parts objectAtIndex:[parts count]-1];
        
        parts = [filename componentsSeparatedByString:@"."];
        filename = [parts objectAtIndex:[parts count]-2];
        NSLog(filename );
        NSString *vipLink= [@"http://mp3.zing.vn/download/vip/song/" stringByAppendingString:filename];
        //[vipLink stringByAppendingString:filename];
        
        NSURL *vipURL = [NSURL URLWithString:vipLink];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:vipURL];
        [self.webview loadRequest:urlRequest];
        // vipURL.path=vipLink;
    }
    else{
        NSLog(@"Not found link");
    }
}
- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if ([[[request URL] scheme] isEqual:@"http"] &&
        [[[request URL] pathExtension] isEqualToString:@"mp3"])
    {
        
        NSLog(@"found linl mp3");
        NSLog([[request URL] path]);
        
        [self downloadProgress:[request URL]];
        
        return NO;
    }
    return YES; //-- otherwise, follow the link
}
- (BOOL)isWritableFileAtPath:(NSString *)path
{
    return YES;
}
-(void) downloadProgress:(NSURL *)theRessourcesURL
{
    NSString *filename = [[self currentFileName] stringByAppendingString:@".mp3"];
    NSLog(@"Filename: %@", filename);
    // Get the path to the App's Documents directory
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    // Combine the filename and the path to the documents dir into the full path
    NSString *pathToDownloadTo = [NSString stringWithFormat:@"%@/%@", docPath, filename];
    
    
    // Load the file from the remote server
    
    NSData *tmp = [NSData dataWithContentsOfURL:theRessourcesURL];
    
    // Save the loaded data if loaded successfully
    if (tmp != nil) {
        NSError *error = nil;
        // Write the contents of our tmp object into a file
        [tmp writeToFile:pathToDownloadTo options:NSDataWritingAtomic error:&error];
        
        if (error != nil) {
            NSLog(@"Failed to save the file: %@", [error description]);
        } else {
            // Display an UIAlertView that shows the users we saved the file :)
            UIAlertView *filenameAlert = [[UIAlertView alloc] initWithTitle:@"File saved" message:[NSString stringWithFormat:@"The file %@ has been saved.", filename] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [filenameAlert show];
            //  [filenameAlert release];
        }
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                        message:@"File could not be loaded"
                                                       delegate:nil
                                              cancelButtonTitle:@"Okay"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
    
    
}
@end

