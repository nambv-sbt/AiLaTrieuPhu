//
//  DataCenter.h
//  AiLaTrieuPhu
//
//  Created by Nam Bùi on 8/11/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"

@class QuestionSet;
@class QuestionAnswer;

@interface DataCenter : NSObject

@property (strong, nonatomic) QuestionSet       *questionSet;
@property (strong, nonatomic) AVAudioPlayer     *audioPlayer;
@property (strong, nonatomic) NSString          *animationString;
@property (strong, nonatomic) UIAlertView       *alertView;
@property (strong, nonatomic) NSTimer           *timer;
@property (nonatomic)         int               timerID;
@property (nonatomic)         int               timerCount;
@property (nonatomic)         BOOL              blockControl;
@property (nonatomic)         BOOL              blinkingButton;
@property (nonatomic)         int               audioPlayerID;

@property (strong, nonatomic) QuestionAnswer    *currentQuestion;
@property (nonatomic)         int               currentQuestionNumber;
@property (nonatomic)         int               currentQuestionLevel;
@property (nonatomic)         int               currentAnswer;
@property (nonatomic)         int               currentAnswerCorrect;

+ (DataCenter *)sharedData;
+ (void)resetDataToDefault;
+ (void)resetCurrentData;

@end
