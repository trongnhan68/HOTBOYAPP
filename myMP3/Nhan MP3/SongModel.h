//
//  SongModel.h
//  Nhan MP3
//
//  Created by NhanNLT on 2/2/15.
//  Copyright (c) 2015 nhannlt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SongModel : NSObject
@property (nonatomic,weak) NSString *songName;
@property (nonatomic,weak) NSString *iconImage;
-(instancetype)init:(NSDictionary *) dictionary;
+(instancetype)initWithSong:(NSDictionary *)dictionary;
@end