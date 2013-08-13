//
//  AppDelegate.m
//  AiLaTrieuPhu
//
//  Created by Nam Bui on 8/8/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [Common stopAudioPlayer];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_ALREADY
            || [DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_RULE)
        {
            // Show Playing view
            [[Common getMainView] pushViewToPlayingView];
            return;
        }
        
        if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_CLOSING)
        {
            [[Common getPlayingView] viewDidLoad];
            [[Common getPlayingView] viewDidAppear:YES];
            return;
        }
    }
    else
    {
        if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_ALREADY)
        {
            // Play [game rule] sound
            [Common playSound:AUDIO_GAME_RULES id:AUDIO_PLAYER_ID_RULE loop:AUDIO_PLAYER_LOOP_NON];

            // Show alert to confirm already or not
            [Common showMessage:MESSAGE_RULE okTitle:MESSAGE_RULE_YES cancel:MESSAGE_RULE_NO];
            return;
        }
        
        if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_RULE)
        {
            [[Common getMainView] viewDidAppear:YES];
            
            // Dismiss message
            [Common dismissMessage];
            return;
        }
    
        if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_CLOSING)
        {
            [[Common getPlayingView] doBackToMain:nil];
            return;
        }
        
        if ([DataCenter sharedData].currentAnswer == ANSWER_ID_NON)
        {
            [[Common getPlayingView] doBackToMain:nil];
            return;
        }
        
        if (alertView.alertViewStyle != UIAlertViewStylePlainTextInput)
        {
            if ([[alertView textFieldAtIndex:0] text] != nil)
            {
                [Common saveScore:[Common getPlayingView].moneyLabel.text name:[[alertView textFieldAtIndex:0] text]];
            }
            return;
        }
    }
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    if (alertView.alertViewStyle != UIAlertViewStylePlainTextInput)
    {
        return YES;
    }
    
    NSString *inputText = [[alertView textFieldAtIndex:0] text];
    if( [inputText length] >= 4 )
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_BACKGROUND)
    {
        [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    }
    
    if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_ALREADY
        || [DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_RULE)
    {
        [Common stopAudioPlayer];
        return;
    }
    
    if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_GAME_START)
    {
        // Set default value for current Question number
        [[DataCenter sharedData] setCurrentQuestionNumber:QUESTION_NUMBER_NON];
        [Common updateScore:[DataCenter sharedData].currentQuestionNumber];
        
        // Load question
        [Common loadQuestion];
        return;
    }
   
    if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_QUESTION)
    {
        if ([DataCenter sharedData].currentQuestionNumber == QUESTION_NUMBER_5
            || [DataCenter sharedData].currentQuestionNumber == QUESTION_NUMBER_10
            || [DataCenter sharedData].currentQuestionNumber == QUESTION_NUMBER_15)
        {
            // Play [Important Milestone] sound
            [Common playSound:AUDIO_GAME_MILESTONE_IMPORTANT id:AUDIO_PLAYER_ID_MILESTONE loop:AUDIO_PLAYER_LOOP_NON];
            return;
        }
        
        // Play [Milestone - wait to answer] sound
        if ([DataCenter sharedData].currentQuestionLevel == QUESTION_LEVEL_1)
        {
            [Common playSound:AUDIO_GAME_MILESTONE_1 id:AUDIO_PLAYER_ID_WAIT_ANSWER loop:AUDIO_PLAYER_LOOP_ANSWER];
            return;
        }
        else if ([DataCenter sharedData].currentQuestionLevel == QUESTION_LEVEL_2)
        {
            [Common playSound:AUDIO_GAME_MILESTONE_2 id:AUDIO_PLAYER_ID_WAIT_ANSWER loop:AUDIO_PLAYER_LOOP_ANSWER];
            return;
        }
        else
        {
            [Common playSound:AUDIO_GAME_MILESTONE_3 id:AUDIO_PLAYER_ID_WAIT_ANSWER loop:AUDIO_PLAYER_LOOP_ANSWER];
            return;
        }
    }
    
    if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_MILESTONE)
    {
        // Play [Milestone - wait to answer] sound
        [Common playSound:AUDIO_GAME_TIME_STICK id:AUDIO_PLAYER_ID_WAIT_ANSWER loop:AUDIO_PLAYER_LOOP_ANSWER];
        return;
    }
    
    if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_WAIT_ANSWER)
    {
        // Delay for Important Milestone
        if ([DataCenter sharedData].currentQuestionNumber == QUESTION_NUMBER_5
            || [DataCenter sharedData].currentQuestionNumber == QUESTION_NUMBER_10)
        {
            // Play [Important Milestone] sound
            [Common playSound:AUDIO_ANSWER_DELAY_1 id:AUDIO_PLAYER_ID_DELAY_ANSWER loop:AUDIO_PLAYER_LOOP_NON];
            return;
        }
        if ([DataCenter sharedData].currentQuestionNumber == QUESTION_NUMBER_15)
        {
            // Play [Important Milestone] sound
            [Common playSound:AUDIO_ANSWER_DELAY_2 id:AUDIO_PLAYER_ID_DELAY_ANSWER loop:AUDIO_PLAYER_LOOP_NON];
            return;
        }
        
        if ([DataCenter sharedData].currentAnswer == ANSWER_ID_NON)
        {
            // Confirm continue to Play
            [Common showMessage:MESSAGE_TIME_OUT okTitle:MESSAGE_CONTINUE_PLAY_YES cancel:MESSAGE_CONTINUE_PLAY_NO];
            
            // Play [Lose] sound
            [Common playSound:AUDIO_GAME_CLOSING id:AUDIO_PLAYER_ID_CLOSING loop:AUDIO_PLAYER_LOOP_NON];
            
            return;
        }
        
        [Common startTimerWithInterval:TIMER_INTERVAL_BLINKING_BUTTON selector:@selector(blinkAnswerButton) repeats:YES];
        
        if ([DataCenter sharedData].currentAnswerCorrect == ANSWER_ID_A)
        {
            if ([DataCenter sharedData].currentAnswer == [DataCenter sharedData].currentAnswerCorrect)
            {
                // Update score
                [Common updateScore:[DataCenter sharedData].currentQuestionNumber];
                
                [Common playSound:AUDIO_ANSWER_A_TRUE id:AUDIO_PLAYER_ID_PASS loop:AUDIO_PLAYER_LOOP_NON];
                
                return;
            }
            else
            {
                // Update score
                [[DataCenter sharedData] setCurrentQuestionNumber:QUESTION_NUMBER_NON];
                [Common updateScore:[DataCenter sharedData].currentQuestionNumber];
                
                [Common playSound:AUDIO_ANSWER_LOSE_A_TRUE id:AUDIO_PLAYER_ID_LOSE loop:AUDIO_PLAYER_LOOP_NON];
                return;
            }
        }
        else if ([DataCenter sharedData].currentAnswerCorrect == ANSWER_ID_B)
        {
            if ([DataCenter sharedData].currentAnswer == [DataCenter sharedData].currentAnswerCorrect)
            {
                // Update score
                [Common updateScore:[DataCenter sharedData].currentQuestionNumber];
                
                [Common playSound:AUDIO_ANSWER_B_TRUE id:AUDIO_PLAYER_ID_PASS loop:AUDIO_PLAYER_LOOP_NON];
                return;
            }
            else
            {
                // Update score
                [[DataCenter sharedData] setCurrentQuestionNumber:QUESTION_NUMBER_NON];
                [Common updateScore:[DataCenter sharedData].currentQuestionNumber];
                
                [Common playSound:AUDIO_ANSWER_LOSE_B_TRUE id:AUDIO_PLAYER_ID_LOSE loop:AUDIO_PLAYER_LOOP_NON];
                return;
            }
        }
        else if ([DataCenter sharedData].currentAnswerCorrect == ANSWER_ID_C)
        {
            if ([DataCenter sharedData].currentAnswer == [DataCenter sharedData].currentAnswerCorrect)
            {
                // Update score
                [Common updateScore:[DataCenter sharedData].currentQuestionNumber];
                
                [Common playSound:AUDIO_ANSWER_C_TRUE id:AUDIO_PLAYER_ID_PASS loop:AUDIO_PLAYER_LOOP_NON];
                return;
            }
            else
            {
                // Update score
                [[DataCenter sharedData] setCurrentQuestionNumber:QUESTION_NUMBER_NON];
                [Common updateScore:[DataCenter sharedData].currentQuestionNumber];
                
                [Common playSound:AUDIO_ANSWER_LOSE_C_TRUE id:AUDIO_PLAYER_ID_LOSE loop:AUDIO_PLAYER_LOOP_NON];
                return;
            }
        }
        else
        {
            if ([DataCenter sharedData].currentAnswer == [DataCenter sharedData].currentAnswerCorrect)
            {
                // Update score
                [Common updateScore:[DataCenter sharedData].currentQuestionNumber];
                
                [Common playSound:AUDIO_ANSWER_D_TRUE id:AUDIO_PLAYER_ID_PASS loop:AUDIO_PLAYER_LOOP_NON];
                return;
            }
            else
            {
                // Update score
                [[DataCenter sharedData] setCurrentQuestionNumber:QUESTION_NUMBER_NON];
                [Common updateScore:[DataCenter sharedData].currentQuestionNumber];
                
                [Common playSound:AUDIO_ANSWER_LOSE_D_TRUE id:AUDIO_PLAYER_ID_LOSE loop:AUDIO_PLAYER_LOOP_NON];
                return;
            }
        }
    }
    
    
    if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_DELAY_ANSWER)
    {
        if ([DataCenter sharedData].currentAnswer == ANSWER_ID_NON)
        {
            // Confirm continue to Play
            [Common showMessage:MESSAGE_TIME_OUT okTitle:MESSAGE_CONTINUE_PLAY_YES cancel:MESSAGE_CONTINUE_PLAY_NO];
            
            // Play [Lose] sound
            [Common playSound:AUDIO_GAME_CLOSING id:AUDIO_PLAYER_ID_CLOSING loop:AUDIO_PLAYER_LOOP_NON];
            
            return;
        }
        
        [Common startTimerWithInterval:TIMER_INTERVAL_BLINKING_BUTTON selector:@selector(blinkAnswerButton) repeats:YES];
        
        if ([DataCenter sharedData].currentAnswerCorrect == ANSWER_ID_A)
        {
            if ([DataCenter sharedData].currentAnswer == [DataCenter sharedData].currentAnswerCorrect)
            {
                // Update score
                [Common updateScore:[DataCenter sharedData].currentQuestionNumber];
                
                [Common playSound:AUDIO_ANSWER_A_TRUE id:AUDIO_PLAYER_ID_PASS loop:AUDIO_PLAYER_LOOP_NON];
                return;
            }
            else
            {
                // Update score
                [[DataCenter sharedData] setCurrentQuestionNumber:QUESTION_NUMBER_NON];
                [Common updateScore:[DataCenter sharedData].currentQuestionNumber];
                
                [Common playSound:AUDIO_ANSWER_LOSE_A_TRUE id:AUDIO_PLAYER_ID_LOSE loop:AUDIO_PLAYER_LOOP_NON];
                return;
            }
        }
        else if ([DataCenter sharedData].currentAnswerCorrect == ANSWER_ID_B)
        {
            if ([DataCenter sharedData].currentAnswer == [DataCenter sharedData].currentAnswerCorrect)
            {
                // Update score
                [Common updateScore:[DataCenter sharedData].currentQuestionNumber];
                
                [Common playSound:AUDIO_ANSWER_B_TRUE id:AUDIO_PLAYER_ID_PASS loop:AUDIO_PLAYER_LOOP_NON];
                return;
            }
            else
            {
                // Update score
                [[DataCenter sharedData] setCurrentQuestionNumber:QUESTION_NUMBER_NON];
                [Common updateScore:[DataCenter sharedData].currentQuestionNumber];
                
                [Common playSound:AUDIO_ANSWER_LOSE_B_TRUE id:AUDIO_PLAYER_ID_LOSE loop:AUDIO_PLAYER_LOOP_NON];
                return;
            }
        }
        else if ([DataCenter sharedData].currentAnswerCorrect == ANSWER_ID_C)
        {
            if ([DataCenter sharedData].currentAnswer == [DataCenter sharedData].currentAnswerCorrect)
            {
                // Update score
                [Common updateScore:[DataCenter sharedData].currentQuestionNumber];
                
                [Common playSound:AUDIO_ANSWER_C_TRUE id:AUDIO_PLAYER_ID_PASS loop:AUDIO_PLAYER_LOOP_NON];
                return;
            }
            else
            {
                // Update score
                [[DataCenter sharedData] setCurrentQuestionNumber:QUESTION_NUMBER_NON];
                [Common updateScore:[DataCenter sharedData].currentQuestionNumber];
                
                [Common playSound:AUDIO_ANSWER_LOSE_C_TRUE id:AUDIO_PLAYER_ID_LOSE loop:AUDIO_PLAYER_LOOP_NON];
                return;
            }
        }
        else
        {
            if ([DataCenter sharedData].currentAnswer == [DataCenter sharedData].currentAnswerCorrect)
            {
                // Update score
                [Common updateScore:[DataCenter sharedData].currentQuestionNumber];
                
                [Common playSound:AUDIO_ANSWER_D_TRUE id:AUDIO_PLAYER_ID_PASS loop:AUDIO_PLAYER_LOOP_NON];
                return;
            }
            else
            {
                // Update score
                [[DataCenter sharedData] setCurrentQuestionNumber:QUESTION_NUMBER_NON];
                [Common updateScore:[DataCenter sharedData].currentQuestionNumber];
                
                [Common playSound:AUDIO_ANSWER_LOSE_D_TRUE id:AUDIO_PLAYER_ID_LOSE loop:AUDIO_PLAYER_LOOP_NON];
                return;
            }
        }
    }
    
    if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_PASS)
    {
        // Reset current Button HighLight
        [Common resetButton];
        
        // Play [Applause] sound
        [Common playSound:AUDIO_GAME_APPLAUSE id:AUDIO_PLAYER_ID_APPLAUSE loop:AUDIO_PLAYER_LOOP_NON];
        
        // Hide Question & Answer view
        [Common hideQuestionView];
        [Common hideAnswerView];
        
        return;
    }
    
    if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_LOSE)
    {
        // Reset current Button HighLight
        [Common resetButton];
        
        // Set UnBloking
        [[DataCenter sharedData] setBlockControl:NO];
        
        // Play [Applause] sound
        [Common playSound:AUDIO_GAME_APPLAUSE id:AUDIO_PLAYER_ID_APPLAUSE_LOSE loop:AUDIO_PLAYER_LOOP_NON];
        
        // Hide Question & Answer view
        [Common hideQuestionView];
        [Common hideAnswerView];
        
        return;
    }
    
    if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_APPLAUSE)
    {
        // Stop timer
        [Common stopTimer];
        [Common setButton:[Common getCorrectAnswerButton] enable:YES withImage:IMG_BUTTON_ANSWER];
        
        if ([DataCenter sharedData].currentQuestionNumber == QUESTION_NUMBER_5
            || [DataCenter sharedData].currentQuestionNumber == QUESTION_NUMBER_10)
        {
            // Play [Cheer] sound
            [Common playSound:AUDIO_GAME_MILESTONE_CHEER id:AUDIO_PLAYER_ID_CHEER loop:AUDIO_PLAYER_LOOP_NON];
            return;
        }
        
        if ([DataCenter sharedData].currentQuestionNumber == QUESTION_NUMBER_15)
        {
            // Play [Best player] sound
            [Common playSound:AUDIO_GAME_BEST_PLAYER id:AUDIO_PLAYER_ID_CHEER_WIN loop:AUDIO_PLAYER_LOOP_NON];
            
            return;
        }
        
        // Load question
        [Common loadQuestion];
        
        return;
    }
    
    if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_APPLAUSE_LOSE)
    {
        // Stop timer
        [Common stopTimer];
        [Common setButton:[Common getCorrectAnswerButton] enable:YES withImage:IMG_BUTTON_ANSWER];
        
        // Play [Lose] sound
        [Common playSound:AUDIO_GAME_CLOSING id:AUDIO_PLAYER_ID_CLOSING loop:AUDIO_PLAYER_LOOP_NON];
        
        // Confirm continue to Play
        [Common showMessage:MESSAGE_CONTINUE_PLAY okTitle:MESSAGE_CONTINUE_PLAY_YES cancel:MESSAGE_CONTINUE_PLAY_NO];
                
        return;
    }
    
    if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_CHEER)
    {
        // Play [Pass over a Milestone] sound
        [Common playSound:AUDIO_GAME_MILESTONE_PASS id:AUDIO_PLAYER_ID_PASS loop:AUDIO_PLAYER_LOOP_NON];
        
        return;
    }
    
    if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_CHEER_WIN)
    {
        // Play [Pass over a Milestone] sound
        [Common playSound:AUDIO_GAME_STOP id:AUDIO_PLAYER_ID_STOP loop:AUDIO_PLAYER_LOOP_NON];
        
        // Confirm input Name and Score to list score        
        [DataCenter sharedData].alertView = [[UIAlertView alloc] initWithTitle:MESSAGE_TITLE message:MESSAGE_WIN delegate:self cancelButtonTitle:MESSAGE_CANCEL otherButtonTitles:MESSAGE_OK, nil];
        [[DataCenter sharedData].alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
        [[DataCenter sharedData].alertView show];
        
        return;
    }
    
    if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_PASS)
    {
        // Load question
        [Common loadQuestion];
        
        return;
    }
    
    if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_CLOSING)
    {
        [Common dismissMessage];
        [[Common getPlayingView] doBackToMain:nil];
        
        return;
    }
    
    if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_HELP_5050)
    {
        [Common setButton:[Common getPlayingView].help5050Button enable:NO withImage:IMG_BUTTON_HELP_5050_OFF];
        [Common help5050];
    }
    
    if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_HELP_CALL)
    {
        [Common setButton:[Common getPlayingView].helpCallButton enable:NO withImage:IMG_BUTTON_HELP_CALL_OFF];
        [Common helpCall];
    }
    
    if ([DataCenter sharedData].audioPlayerID == AUDIO_PLAYER_ID_HELP_AUDIENCE)
    {
        [Common setButton:[Common getPlayingView].helpAudienceButton enable:NO withImage:IMG_BUTTON_HELP_AUDIENCE_OFF];
        [Common helpAudience];
    }
}

- (void)blinkAnswerButton
{
    [Common blinkingButton:[Common getCorrectAnswerButton] image1:IMG_BUTTON_ANSWER_CORRECT image2:IMG_BUTTON_ANSWER_PRESSED];
}

@end
