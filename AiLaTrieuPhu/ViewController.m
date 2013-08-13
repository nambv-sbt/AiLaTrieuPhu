//
//  ViewController.m
//  AiLaTrieuPhu
//
//  Created by Nam Bui on 8/8/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    // Reset shareData to default
    [DataCenter resetDataToDefault];
    
    // Set ViewController for mainView of Common
    [Common setMainView:self];
    
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    // Play Background sound
    [Common playSound:AUDIO_GAME_BACKGROUND id:AUDIO_PLAYER_ID_BACKGROUND loop:AUDIO_PLAYER_LOOP_BACKGROUND];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [Common stopAudioPlayer];
}

- (IBAction)doStartGame:(id)sender
{
    [Common stopAudioPlayer];
    
    // Show alert to confirm already or not
    [Common showMessage:MESSAGE_ALREADY okTitle:MESSAGE_ALREADY_YES cancel:MESSAGE_ALREADY_NO];

    // Play [already to play game] sound
    [Common playSound:AUDIO_GAME_ALREADY id:AUDIO_PLAYER_ID_ALREADY loop:0];
}

- (IBAction)doShowGuide:(id)sender
{
    // Show alert to confirm already or not
    [Common showMessage:MESSAGE_RULE okTitle:MESSAGE_RULE_YES cancel:MESSAGE_RULE_NO];
    
    // Play [game rule] sound
    [Common playSound:AUDIO_GAME_RULES id:AUDIO_PLAYER_ID_RULE loop:AUDIO_PLAYER_LOOP_NON];
    return;
}

- (IBAction)doShowAbout:(id)sender
{
    [Common showMessage:MESSAGE_ABOUT okTitle:MESSAGE_OK cancel:nil];
}

- (void)pushViewToPlayingView
{
    PlayingViewController *view = (PlayingViewController *)[[UIStoryboard storyboardWithName:STORYBOARD_IPHONE_NAME bundle:nil] instantiateViewControllerWithIdentifier:STORYBOARD_PLAYINGVIEW_IDENTIFIER];
    [self.navigationController pushViewController:view animated:YES];
}

@end
