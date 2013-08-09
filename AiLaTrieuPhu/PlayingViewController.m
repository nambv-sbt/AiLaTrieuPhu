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
    // Set PlayingViewController for playing of Common
    [Common setPlaying:self];
    
    // Set dafault value
    [Common setDafault];
    
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    _alertView = [[UIAlertView alloc] initWithTitle:@"Ai la trieu phu" message:@"Ban da san sang choi chua?" delegate:self cancelButtonTitle:@"Bat dau choi" otherButtonTitles:@"Huong dan", nil];
    [_alertView show];

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
    [self setAlertView:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        // Show Question View
        [Common showQuestionView];
        
        // Show Answer View
        [Common showAnswerView];
    }
    else
    {
        
    }
}

- (IBAction)doAnswerA:(id)sender
{
    if (_blockControl == YES)
    {
        return;
    }
    
    [Common setHighlightAnswerButton:_answerAButton];
    _answerID = ANSWER_ID_A;
    [Common startTimerWithInterval:TIMER_INTERVAL_CHECKING_ANSWER id:TIMER_ID_CHECKING_ANSWER selector:@selector(increaseTimerCount) repeats:NO];
}

- (IBAction)doAnswerB:(id)sender
{
    if (_blockControl == YES)
    {
        return;
    }
    
    [Common setHighlightAnswerButton:_answerBButton];
    _answerID = ANSWER_ID_B;
    [Common startTimerWithInterval:TIMER_INTERVAL_CHECKING_ANSWER id:TIMER_ID_CHECKING_ANSWER selector:@selector(increaseTimerCount) repeats:NO];
}

- (IBAction)doAnswerC:(id)sender
{
    if (_blockControl == YES)
    {
        return;
    }
    
    [Common setHighlightAnswerButton:_answerCButton];
    _answerID = ANSWER_ID_C;
    [Common startTimerWithInterval:TIMER_INTERVAL_CHECKING_ANSWER id:TIMER_ID_CHECKING_ANSWER selector:@selector(increaseTimerCount) repeats:NO];
}

- (IBAction)doAnswerD:(id)sender
{
    if (_blockControl == YES)
    {
        return;
    }
    
    [Common setHighlightAnswerButton:_answerDButton];
    _answerID = ANSWER_ID_D;
    [Common startTimerWithInterval:TIMER_INTERVAL_CHECKING_ANSWER id:TIMER_ID_CHECKING_ANSWER selector:@selector(increaseTimerCount) repeats:NO];
}


@end
