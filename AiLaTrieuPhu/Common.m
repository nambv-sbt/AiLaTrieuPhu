//
//  Common.m
//  AiLaTrieuPhu
//
//  Created by Nam Bui on 8/9/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import "Common.h"

@implementation Common

static PlayingViewController *playing;


+ (PlayingViewController *)getPlaying
{
    return playing;
}

+ (void)setPlaying:(PlayingViewController *)viewController
{
    playing = viewController;
}

+ (NSString *)loadRamdonQuestionWithLevel:(int)level
{
    
    return @"";
}

+ (void)startTimerWithInterval:(NSTimeInterval)interval id:(NSString *)idString selector:(SEL)aSelector repeats:(BOOL)repeats
{
    [self getPlaying].blockControl = YES;
    [self getPlaying].timerCount = 0;
    [self getPlaying].timerID    = idString;
    [self getPlaying].timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:aSelector userInfo:nil repeats:repeats];
}

+ (void)stopTimer
{
    [self getPlaying].blockControl = NO;
    [self getPlaying].timerCount = 0;
    [self getPlaying].timerID    = TIMER_ID_NON;
    [[self getPlaying].timer invalidate];
    [self getPlaying].timer = nil;
}

+ (void)increaseTimerCount
{   
    if ([self getPlaying].timerID == TIMER_ID_ANSWER_CORRECT)
    {
        if ([self getPlaying].timerCount >= TIMER_INTERVAL_ANSWER_CORRECT)
        {
            [self stopTimer];
            return;
        }
        
    }
    else if ([self getPlaying].timerID == TIMER_ID_CHECKING_ANSWER)
    {
        // check dap an
        // BOOL answerCorrect = [self checkAnswer];
        // if (answerCorrect == YES)
        // {
        //     // Play sound chuc mung
        //     // CHuyen cau hoi
        // }
        // else
        // {
        //      // Play sound chia buon chu
        //      // End luot choi, confirm co tiep tuc choi lai hay thoat?
        // }
        
        [self setBackgroundForCorrectButton];
        
//        // Hide Question and AnsWer View
//        [self hideQuestionView];
//        [self hideAnswerView];
//        
//        // Load next quesiton
//        [self loadNextQuestion];
//        
//        // Show Question and Answer View
//        [self showQuestionView];
//        [self showAnswerView];
    }
    
    
    [self getPlaying].timerCount = [self getPlaying].timerCount + 1;
}

+ (void)setDafault
{
    [self getPlaying].animationString = ANIMATION_NON;
    [[self getPlaying].questionView  setFrame:FRAME_DEFAULT_VIEW];
    [[self getPlaying].answerView    setFrame:FRAME_ANSWER_VIEW];
    [[self getPlaying].answerAButton setFrame:FRAME_DEFAULT_BUTTON];
    [[self getPlaying].answerBButton setFrame:FRAME_DEFAULT_BUTTON];
    [[self getPlaying].answerCButton setFrame:FRAME_DEFAULT_BUTTON];
    [[self getPlaying].answerDButton setFrame:FRAME_DEFAULT_BUTTON];
}

+ (void)clearButtonTextLabel
{
    [[self getPlaying].answerAButton setTitle:BUTTON_TITLE_EMPTY forState:UIControlStateNormal];
    [[self getPlaying].answerBButton setTitle:BUTTON_TITLE_EMPTY forState:UIControlStateNormal];
    [[self getPlaying].answerCButton setTitle:BUTTON_TITLE_EMPTY forState:UIControlStateNormal];
    [[self getPlaying].answerDButton setTitle:BUTTON_TITLE_EMPTY forState:UIControlStateNormal];
}

+ (void)showQuestionView
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDelay:ANIMATION_DELAY_QUESTION_VIEW_SHOW];
    [UIView setAnimationDuration:ANIMATION_DURATION_QUESTION_VIEW_SHOW];
    [[self getPlaying].questionView setFrame:FRAME_QUESTION_VIEW];
    [UIView commitAnimations];
}

+ (void)hideQuestionView
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDelay:ANIMATION_DELAY_QUESTION_VIEW_HIDE];
    [UIView setAnimationDuration:ANIMATION_DURATION_QUESTION_VIEW_HIDE];
    [[self getPlaying].questionView setFrame:FRAME_DEFAULT_VIEW];
    [UIView commitAnimations];
}

+ (void)showAnswerView
{
    [self showAnswerA];
    [self showAnswerB];
    [self showAnswerC];
    [self showAnswerD];
}

+ (void)hideAnswerView
{
    [self clearButtonTextLabel];
    [self hideAnswerD];
    [self hideAnswerC];
    [self hideAnswerB];
    [self hideAnswerA];
}

+ (void)showAnswerA
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDelay:ANIMATION_DELAY_ANSWER_A_SHOW];
    [UIView setAnimationDuration:ANIMATION_DURATION_ANSWER_A_SHOW];
    [[self getPlaying].answerAButton setFrame:FRAME_ANSWER_A];
    [UIView commitAnimations];
}

+ (void)showAnswerB
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelay:ANIMATION_DELAY_ANSWER_B_SHOW];
    [UIView setAnimationDuration:ANIMATION_DURATION_ANSWER_B_SHOW];
    [[self getPlaying].answerBButton setFrame:FRAME_ANSWER_B];
    [UIView commitAnimations];
}

+ (void)showAnswerC
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelay:ANIMATION_DELAY_ANSWER_C_SHOW];
    [UIView setAnimationDuration:ANIMATION_DURATION_ANSWER_C_SHOW];
    [[self getPlaying].answerCButton setFrame:FRAME_ANSWER_C];
    [UIView commitAnimations];
}

+ (void)showAnswerD
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelay:ANIMATION_DELAY_ANSWER_D_SHOW];
    [UIView setAnimationDuration:ANIMATION_DURATION_ANSWER_D_SHOW];
    [[self getPlaying].answerDButton setFrame:FRAME_ANSWER_D];
    [UIView commitAnimations];
}


+ (void)hideAnswerA
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDelay:ANIMATION_DELAY_ANSWER_A_HIDE];
    [UIView setAnimationDuration:ANIMATION_DURATION_ANSWER_A_HIDE];
    [[self getPlaying].answerAButton setFrame:FRAME_DEFAULT_BUTTON];
    [UIView commitAnimations];
}

+ (void)hideAnswerB
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelay:ANIMATION_DELAY_ANSWER_B_HIDE];
    [UIView setAnimationDuration:ANIMATION_DURATION_ANSWER_B_HIDE];
    [[self getPlaying].answerBButton setFrame:FRAME_DEFAULT_BUTTON];
    [UIView commitAnimations];
}

+ (void)hideAnswerC
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelay:ANIMATION_DELAY_ANSWER_C_HIDE];
    [UIView setAnimationDuration:ANIMATION_DURATION_ANSWER_C_HIDE];
    [[self getPlaying].answerCButton setFrame:FRAME_DEFAULT_BUTTON];
    [UIView commitAnimations];
}

+ (void)hideAnswerD
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelay:ANIMATION_DELAY_ANSWER_D_HIDE];
    [UIView setAnimationDuration:ANIMATION_DURATION_ANSWER_D_HIDE];
    [[self getPlaying].answerDButton setFrame:FRAME_DEFAULT_BUTTON];
    [UIView commitAnimations];
}

+ (void)setHighlightAnswerButton:(UIButton *)answerButton
{
    UIImage *normalImage = [UIImage imageNamed:IMG_BUTTON_ANSWER];
    [[self getPlaying].answerAButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    [[self getPlaying].answerBButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    [[self getPlaying].answerCButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    [[self getPlaying].answerDButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    
    UIImage *highlightImage = [UIImage imageNamed:IMG_BUTTON_ANSWER_PRESSED];
    [answerButton setBackgroundImage:highlightImage forState:UIControlStateNormal];
}

+ (void)setBackgroundForCorrectButton
{
    // Get Correct Answer Button
    UIButton *answerButton = [self getCorrectAnswerButton];
    
    [self startFlashingButton:answerButton];
}

+ (UIButton *)getCorrectAnswerButton
{
    // Do something
    return [self getPlaying].answerAButton;
}

+ (void)startFlashingButton:(UIButton *)answerButton
{
    answerButton.alpha = 1.0f;
    [UIView animateWithDuration:0.15
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut |
                                UIViewAnimationOptionRepeat |
                                UIViewAnimationOptionAutoreverse |
                                UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         [answerButton setBackgroundImage:[UIImage imageNamed:IMG_BUTTON_ANSWER_CORRECT] forState:UIControlStateNormal];
                         answerButton.alpha = 0.0f;
                     }
                     completion:nil];
}

+ (void) stopFlashingButton:(UIButton *)answerButton
{
    [UIView animateWithDuration:0.2
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut |
                                UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         UIImage *image = [UIImage imageNamed:IMG_BUTTON_ANSWER_CORRECT];
                         [answerButton setBackgroundImage:image forState:UIControlStateNormal];
                         answerButton.alpha = 1.0f;
                     }
                     completion:nil];
}

+ (void)loadNextQuestion
{
    
}

@end
