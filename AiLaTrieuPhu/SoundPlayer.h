//
//  SoundPlayer.h
//  AiLaTrieuPhu
//
//  Created by Nam Bùi on 8/10/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "Constant.h"


@interface SoundPlayer : NSObject <AVAudioPlayerDelegate>
{
    AVAudioPlayer *audioPlayer;;
    int playerTag;
}

- (void)prepairSound:(NSString *)soundName tag:(int)tag;
- (void)play;
- (void)stop;
- (void)setMute:(BOOL)mute;

@end
