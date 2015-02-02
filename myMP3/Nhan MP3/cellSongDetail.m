//
//  cellSongDetail.m
//  Nhan MP3
//
//  Created by NhanNLT on 2/2/15.
//  Copyright (c) 2015 nhannlt. All rights reserved.
//

#import "cellSongDetail.h"
#import "SongModel.h"
@implementation cellSongDetail

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setupCellWithSongDetail:(SongModel *)songDetail
{
    //self.imvIcconSong.image=[[UIImage *image]];
    self.labelSongName.text=songDetail.songName;
    
//    UIImage *img=[UIImage imageNamed:songDetail.iconImage];
//    self.imvIcconSong.image =img;
     [self.imvIconSong setImage:[UIImage imageNamed:songDetail.iconImage]];
}
@end
