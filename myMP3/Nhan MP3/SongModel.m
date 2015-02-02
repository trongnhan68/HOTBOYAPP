//
//  SongModel.m
//  Nhan MP3
//
//  Created by NhanNLT on 2/2/15.
//  Copyright (c) 2015 nhannlt. All rights reserved.
//

#import "SongModel.h"

@implementation SongModel
-(instancetype)init:(NSDictionary *)dictionary
{
   if (self==[super init])
   {
       self.iconImage=dictionary[@"iconImage"];
       self.songName=dictionary[@"songName"];
   
   }
        return self;
}
+(instancetype)initWithSong:(NSDictionary *)dictionary
{
    return [[SongModel alloc] init:dictionary];

}
@end
