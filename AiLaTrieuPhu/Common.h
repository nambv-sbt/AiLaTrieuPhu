//
//  Common.h
//  AiLaTrieuPhu
//
//  Created by Nam Bui on 8/9/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "PlayingViewController.h"
#import "ViewController.h"
#import "QuestionAnswer.h"
#import "SQLiteManager.h"
#import "AppDelegate.h"
#import "QuestionSet.h"
#import "DataCenter.h"
#import "Constant.h"
#import "NTChartView.h"
#import "BatteryChartView.h"
#import "AudienceViewController.h"

@class PlayingViewController;
@class ViewController;
@class QuestionAnswer;

@interface Common : NSObject

+ (PlayingViewController *)getPlayingView;
+ (ViewController *)getMainView;
+ (void)setPlayingView:(PlayingViewController *)viewController;
+ (void)setMainView:(ViewController *)viewController;
+ (void)loadQuestion;
+ (int)getMaxRandomValue:(int)questionNumber;
+ (void)setQuestionWithQuestionNumber:(int)questionNumber object:(QuestionAnswer *)question;
+ (NSString *)getAudioQuestionWithNumber:(int)number;
+ (void)startTimerWithInterval:(NSTimeInterval)interval selector:(SEL)aSelector repeats:(BOOL)repeats;
+ (void)stopTimer;
+ (void)setDefault;
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
+ (void)setAnswerButton:(UIButton *)answerButton highlight:(BOOL)highlight;
+ (NSURL *)getResourceURL:(NSString *)resourceName;
+ (void)playSound:(NSString *)soundName id:(int)soundID loop:(int)loop;
+ (void)stopAudioPlayer;
+ (void)showMessage:(NSString *)message okTitle:(NSString *)ok cancel:(NSString *)cancel;
+ (void)dismissMessage;
+ (void)resetButton;
+ (UIButton *)getCurrentAnswerButton;
+ (UIButton *)getCorrectAnswerButton;
+ (void)saveScore:(NSString *)score name:(NSString *)name;
+ (NSMutableDictionary *)loadScore;
+ (void)updateScore:(int)questionNumber;
+ (void)help5050;
+ (void)helpCall;
+ (void)helpAudience;
+ (void)setButton:(UIButton *)button enable:(BOOL)enable withImage:(NSString *)imageName;
+ (void)blinkingButton:(UIButton *)button image1:(NSString *)imageName1 image2:(NSString *)imageName2;

@end
