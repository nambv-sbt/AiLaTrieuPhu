//
//  NSObject_Constant_h.h
//  AiLaTrieuPhu
//
//  Created by Nam Bui on 8/8/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import <Foundation/Foundation.h>


// Animation
#define ANIMATION_CONTEXT                       nil
#define ANIMATION_NON                           @""
#define ANIMATION_DELAY_DEFAULT                 0.0
#define ANIMATION_DURATION_DEFAULT              0.2
#define ANIMATION_REPEAT_COUNT                  5
// Animation: Question View
#define ANIMATION_DELAY_QUESTION_VIEW_SHOW      0.0
#define ANIMATION_DELAY_QUESTION_VIEW_HIDE      ANIMATION_DELAY_ANSWER_A_HIDE + 0.2
#define ANIMATION_DURATION_QUESTION_VIEW_SHOW   0.3
#define ANIMATION_DURATION_QUESTION_VIEW_HIDE   ANIMATION_DURATION_ANSWER_A_HIDE + 0.1
// Animation: Answer A
#define ANIMATION_DELAY_ANSWER_A_SHOW           ANIMATION_DELAY_QUESTION_VIEW_SHOW + 0.2
#define ANIMATION_DELAY_ANSWER_A_HIDE           ANIMATION_DELAY_ANSWER_B_HIDE + 0.1
#define ANIMATION_DURATION_ANSWER_A_SHOW        ANIMATION_DURATION_QUESTION_VIEW_SHOW
#define ANIMATION_DURATION_ANSWER_A_HIDE        ANIMATION_DURATION_ANSWER_B_HIDE + 0.1
// Animation: Answer B
#define ANIMATION_DELAY_ANSWER_B_SHOW           ANIMATION_DELAY_ANSWER_A_SHOW + 0.1
#define ANIMATION_DELAY_ANSWER_B_HIDE           ANIMATION_DELAY_ANSWER_C_HIDE + 0.1
#define ANIMATION_DURATION_ANSWER_B_SHOW        ANIMATION_DURATION_ANSWER_A_SHOW + 0.1
#define ANIMATION_DURATION_ANSWER_B_HIDE        ANIMATION_DURATION_ANSWER_C_HIDE + 0.1
// Animation: Answer C
#define ANIMATION_DELAY_ANSWER_C_SHOW           ANIMATION_DELAY_ANSWER_B_SHOW + 0.1
#define ANIMATION_DELAY_ANSWER_C_HIDE           ANIMATION_DELAY_ANSWER_D_HIDE + 0.1
#define ANIMATION_DURATION_ANSWER_C_SHOW        ANIMATION_DURATION_ANSWER_B_SHOW + 0.1
#define ANIMATION_DURATION_ANSWER_C_HIDE        ANIMATION_DURATION_ANSWER_D_HIDE + 0.1
// Animation: Answer D
#define ANIMATION_DELAY_ANSWER_D_SHOW           ANIMATION_DELAY_ANSWER_C_SHOW + 0.1
#define ANIMATION_DELAY_ANSWER_D_HIDE           0.0
#define ANIMATION_DURATION_ANSWER_D_SHOW        ANIMATION_DURATION_ANSWER_C_SHOW + 0.1
#define ANIMATION_DURATION_ANSWER_D_HIDE        0.2

// Frame
#define FRAME_DEFAULT_VIEW                      CGRectMake(0.0, 481, 0.0, 0.0)
#define FRAME_DEFAULT_BUTTON                    CGRectMake(0.0, 300, 320.0, 35.0)
#define FRAME_QUESTION_VIEW                     CGRectMake(0.0, 120, 320.0, 95.0)
#define FRAME_ANSWER_VIEW                       CGRectMake(0.0, 225, 320.0, 149.0)
#define FRAME_ANSWER_A                          CGRectMake(0.0, 0.0, 320.0, 35.0)
#define FRAME_ANSWER_B                          CGRectMake(0.0, 38.0, 320.0, 35.0)
#define FRAME_ANSWER_C                          CGRectMake(0.0, 76.0, 320.0, 35.0)
#define FRAME_ANSWER_D                          CGRectMake(0.0, 114.0, 320.0, 35.0)

// Button
#define BUTTON_TITLE_EMPTY                     @""
#define BUTTON_TITLE_FORMAT_ANSWER_A           @"                    A. %@"
#define BUTTON_TITLE_FORMAT_ANSWER_B           @"                    B. %@"
#define BUTTON_TITLE_FORMAT_ANSWER_C           @"                    C. %@"
#define BUTTON_TITLE_FORMAT_ANSWER_D           @"                    D. %@"
#define BUTTON_BLINKING_MAX                    6

// Images
#define IMG_BUTTON_ANSWER                       @"button_answer.png"
#define IMG_BUTTON_ANSWER_PRESSED               @"button_answer_pressed.png"
#define IMG_BUTTON_ANSWER_CORRECT               @"button_answer_correct.png"

// Timer
#define TIMER_ID_NON                            @"Non"
#define TIMER_ID_ALREADY                        @"Already start game"
#define TIMER_ID_CHECKING_ANSWER                @"Cheking Answer"
#define TIMER_ID_ANSWER_CORRECT                 @"Answer correct"
#define TIMER_INTERVAL_ALREADY                  3
#define TIMER_INTERVAL_CHECKING_ANSWER          3
#define TIMER_INTERVAL_ANSWER_CORRECT           3

// Answer ID
#define ANSWER_ID_A                             @"A"
#define ANSWER_ID_B                             @"B"
#define ANSWER_ID_C                             @"C"
#define ANSWER_ID_D                             @"D"





