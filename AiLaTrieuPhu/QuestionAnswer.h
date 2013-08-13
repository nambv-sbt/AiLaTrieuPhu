//
//  QuestionAnswer.h
//  AiLaTrieuPhu
//
//  Created by Nam Bùi on 8/12/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"

@interface QuestionAnswer : NSObject

@property (strong, nonatomic) NSString* question;
@property (strong, nonatomic) NSString* answerA;
@property (strong, nonatomic) NSString* answerB;
@property (strong, nonatomic) NSString* answerC;
@property (strong, nonatomic) NSString* answerD;
@property (nonatomic)         int       answerCorrect;
@property (nonatomic)         int       questionNumber;
@property (nonatomic)         int       questionLevel;

@end
