//
//  cellSongDetail.h
//  Nhan MP3
//
//  Created by NhanNLT on 2/2/15.
//  Copyright (c) 2015 nhannlt. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SongModel;
@interface cellSongDetail : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imvIconSong;

@property (weak, nonatomic) IBOutlet UILabel *labelSongName;
-(void)setupCellWithSongDetail:(SongModel *)songDetail;
@end
