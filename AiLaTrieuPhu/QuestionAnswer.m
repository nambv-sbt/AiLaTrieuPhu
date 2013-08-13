//
//  QuestionAnswer.m
//  AiLaTrieuPhu
//
//  Created by Nam Bùi on 8/12/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import "QuestionAnswer.h"

@implementation QuestionAnswer

- (id)init
{
    if (self=[super init])
    {
		_question = STRING_EMPTY;
        _answerA = STRING_EMPTY;
        _answerB = STRING_EMPTY;
        _answerC = STRING_EMPTY;
        _answerD = STRING_EMPTY;
        _answerCorrect = 0;
        _questionLevel = 0;
        _questionNumber = 0;
	}

    return self;
}

@end
