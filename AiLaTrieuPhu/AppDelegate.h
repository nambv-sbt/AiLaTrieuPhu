//
//  AppDelegate.h
//  AiLaTrieuPhu
//
//  Created by Nam Bui on 8/8/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIAlertViewDelegate, AVAudioPlayerDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)blinkAnswerButton;

@end
