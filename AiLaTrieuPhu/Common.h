//
//  Common.h
//  AiLaTrieuPhu
//
//  Created by Nam Bui on 8/9/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingViewController.h"

@class PlayingViewController;

@interface Common : NSObject

+ (PlayingViewController *)getPlaying;
+ (void)setPlaying:(PlayingViewController *)viewController;
+ (NSString *)loadRamdonQuestionWithLevel:(int)level;
+ (void)startTimerWithInterval:(NSTimeInterval)interval id:(NSString *)idString selector:(SEL)aSelector repeats:(BOOL)repeats;
+ (void)stopTimer;
+ (void)increaseTimerCount;
+ (void)setDafault;
+ (void)clearButtonTextLabel;
+ (void)showQuestionView;
+ (void)hideQuestionView;
+ (void)showAnswerView;
+ (void)hideAnswerView;
+ (void)showAnswerA;
+ (void)showAnswerB;
+ (void)showAnswerC;
+ (void)showAnswerD;
+ (void)hideAnswerA;
+ (void)hideAnswerB;
+ (void)hideAnswerC;
+ (void)hideAnswerD;
+ (void)setHighlightAnswerButton:(UIButton *)answerButton;
+ (void)setBackgroundForCorrectButton;
+ (UIButton *)getCorrectAnswerButton;
+ (void)startFlashingButton:(UIButton *)answerButton;
+ (void)stopFlashingButton:(UIButton *)answerButton;
+ (void)loadNextQuestion;

@end
