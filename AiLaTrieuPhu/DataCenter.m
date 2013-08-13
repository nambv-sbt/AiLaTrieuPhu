//
//  DataCenter.m
//  AiLaTrieuPhu
//
//  Created by Nam Bùi on 8/11/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

static DataCenter *_sharedData = nil;

//Static function that return one and only instance of DataCenter
+ (DataCenter *)sharedData
{
    if (_sharedData == nil)
    {
        @synchronized(self)
        {
            if (_sharedData == nil)
            {
                _sharedData = [[super allocWithZone:NULL] init];
                [_sharedData setQuestionSet:nil];
                [_sharedData setAudioPlayer:nil];
                [_sharedData setAnimationString:STRING_EMPTY];
                [_sharedData setAlertView:nil];
                [_sharedData setTimer:nil];
                [_sharedData setTimerID:TIMER_ID_NON];
                [_sharedData setTimerCount:TIMER_COUNT_DEFAULT];
                [_sharedData setBlockControl:NO];
                [_sharedData setBlinkingButton:NO];
                [_sharedData setAudioPlayerID:AUDIO_PLAYER_ID_NON];
                [_sharedData setCurrentQuestion:nil];
                [_sharedData setCurrentQuestionNumber:QUESTION_NUMBER_NON];
                [_sharedData setCurrentQuestionLevel:QUESTION_LEVEL_NON];
                [_sharedData setCurrentAnswer:ANSWER_ID_NON];
                [_sharedData setCurrentAnswerCorrect:ANSWER_ID_NON];
            }
        }
    }
    return _sharedData;
}

+ (void)resetDataToDefault
{
    [_sharedData setQuestionSet:nil];
    [_sharedData setAudioPlayer:nil];
    [_sharedData setAnimationString:STRING_EMPTY];
    [_sharedData setAlertView:nil];
    [_sharedData setTimer:nil];
    [_sharedData setTimerID:TIMER_ID_NON];
    [_sharedData setTimerCount:TIMER_COUNT_DEFAULT];
    [_sharedData setBlockControl:NO];
    [_sharedData setBlinkingButton:NO];
    [_sharedData setAudioPlayerID:AUDIO_PLAYER_ID_NON];
    [_sharedData setCurrentQuestion:nil];
    [_sharedData setCurrentQuestionNumber:QUESTION_NUMBER_NON];
    [_sharedData setCurrentAnswer:ANSWER_ID_NON];
    [_sharedData setCurrentAnswerCorrect:ANSWER_ID_NON];
}

+ (void)resetCurrentData
{
    [_sharedData setCurrentQuestionLevel:QUESTION_LEVEL_NON];
    [_sharedData setCurrentAnswer:ANSWER_ID_NON];
    [_sharedData setCurrentAnswerCorrect:ANSWER_ID_NON];
}


@end
