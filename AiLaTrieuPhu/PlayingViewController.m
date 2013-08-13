//
//  PlayingViewController.m
//  AiLaTrieuPhu
//
//  Created by Nam Bui on 8/8/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import "PlayingViewController.h"

@interface PlayingViewController ()

@end

@implementation PlayingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // Reset shareData to default
    [DataCenter resetDataToDefault];
    
    // Set PlayingViewController for playingView of Common
    [Common setPlayingView:self];
    
    // Set dafault value
    [Common setDefault];
    
    // Set Bloking
    [[DataCenter sharedData] setBlockControl:YES];
    
    // Get Question from SQLite DataBase
    SQLiteManager *sqlManager = [[SQLiteManager alloc] init];
    [sqlManager prepairQuestionSet];
    
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    // Play [start game] sound
    [Common playSound:AUDIO_GAME_START id:AUDIO_PLAYER_ID_GAME_START loop:AUDIO_PLAYER_LOOP_NON];
    [Common setButton:[Common getPlayingView].help5050Button enable:YES withImage:IMG_BUTTON_HELP_5050_ON];
    [Common setButton:[Common getPlayingView].helpCallButton enable:YES withImage:IMG_BUTTON_HELP_CALL_ON];
    [Common setButton:[Common getPlayingView].helpAudienceButton enable:YES withImage:IMG_BUTTON_HELP_AUDIENCE_ON];
}

- (void)viewDidDisappear:(BOOL)animated
{
     [Common stopAudioPlayer];
}

- (void)viewDidUnload
{
    [self setQuestionView:nil];
    [self setAnswerView:nil];
    [self setQuestionTitleLabel:nil];
    [self setQuestionContentLabel:nil];
    [self setAnswerAButton:nil];
    [self setAnswerBButton:nil];
    [self setAnswerCButton:nil];
    [self setAnswerDButton:nil];
    [self setMoneyLabel:nil];
    [self setHelp5050Button:nil];
    [self setHelpCallButton:nil];
    [self setHelpAudienceButton:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)doAnswerA:(id)sender
{
    if ([DataCenter sharedData].blockControl == YES)
    {
        return;
    }
    
    [Common setAnswerButton:_answerAButton highlight:YES];
    [DataCenter sharedData].currentAnswer = ANSWER_ID_A;    
    [[DataCenter sharedData] setBlockControl:YES];
    
    // Play [Answer] sound
    [Common playSound:AUDIO_ANSWER_A id:AUDIO_PLAYER_ID_WAIT_ANSWER loop:AUDIO_PLAYER_LOOP_NON];
}

- (IBAction)doAnswerB:(id)sender
{
    if ([DataCenter sharedData].blockControl == YES)
    {
        return;
    }
    [Common setAnswerButton:_answerBButton highlight:YES];
    [DataCenter sharedData].currentAnswer = ANSWER_ID_B;
    [[DataCenter sharedData] setBlockControl:YES];
    
    // Play [Answer] sound
    [Common playSound:AUDIO_ANSWER_B id:AUDIO_PLAYER_ID_WAIT_ANSWER loop:AUDIO_PLAYER_LOOP_NON];
}

- (IBAction)doAnswerC:(id)sender
{
    if ([DataCenter sharedData].blockControl == YES)
    {
        return;
    }
    [[DataCenter sharedData] setBlockControl:YES];
    
    [Common setAnswerButton:_answerCButton highlight:YES];
    [DataCenter sharedData].currentAnswer = ANSWER_ID_C;
    [[DataCenter sharedData] setBlockControl:YES];
    
    // Play [Answer] sound
    [Common playSound:AUDIO_ANSWER_C id:AUDIO_PLAYER_ID_WAIT_ANSWER loop:AUDIO_PLAYER_LOOP_NON];
}

- (IBAction)doAnswerD:(id)sender
{
    if ([DataCenter sharedData].blockControl == YES)
    {
        return;
    }
    [[DataCenter sharedData] setBlockControl:YES];
    
    [Common setAnswerButton:_answerDButton highlight:YES];
    [DataCenter sharedData].currentAnswer = ANSWER_ID_D;
    [[DataCenter sharedData] setBlockControl:YES];
    
    // Play [Answer] sound
    [Common playSound:AUDIO_ANSWER_D id:AUDIO_PLAYER_ID_WAIT_ANSWER loop:AUDIO_PLAYER_LOOP_NON];
}

- (IBAction)doBackToMain:(id)sender
{
    if ([DataCenter sharedData].blockControl == YES)
    {
        return;
    }
    [[DataCenter sharedData] setBlockControl:YES];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)doHelp5050:(id)sender
{
    if ([DataCenter sharedData].blockControl == YES
        || _help5050Button.enabled == NO)
    {
        return;
    }
    [[DataCenter sharedData] setBlockControl:YES];
    
    // Play [Help 5050] sound
    [Common playSound:AUDIO_HELP_5050 id:AUDIO_PLAYER_ID_HELP_5050 loop:AUDIO_PLAYER_LOOP_NON];
}

- (IBAction)doHelpCall:(id)sender
{
    if ([DataCenter sharedData].blockControl == YES
        || _helpCallButton.enabled == NO)
    {
        return;
    }
    [[DataCenter sharedData] setBlockControl:YES];
    
    // Play [Help Call] sound
    [Common playSound:AUDIO_HELP_CALL id:AUDIO_PLAYER_ID_HELP_CALL loop:AUDIO_PLAYER_LOOP_NON];
}

- (IBAction)doHelpAudience:(id)sender
{
    if ([DataCenter sharedData].blockControl == YES
        || _helpAudienceButton.enabled == NO)
    {
        return;
    }
    [[DataCenter sharedData] setBlockControl:YES];

//    [Common helpAudience];
    
    // Play [Help Audience] sound
    [Common playSound:AUDIO_HELP_AUDIENCE id:AUDIO_PLAYER_ID_HELP_AUDIENCE loop:AUDIO_PLAYER_LOOP_NON];
}

- (IBAction)doHelpStopSession:(id)sender
{
    if ([DataCenter sharedData].blockControl == YES)	
    {
        return;
    }
    [[DataCenter sharedData] setBlockControl:YES];
    
    [Common showMessage:MESSAGE_STOP okTitle:MESSAGE_CONTINUE_PLAY_YES cancel:MESSAGE_CONTINUE_PLAY_NO];
}

@end
