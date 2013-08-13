//
//  Common.m
//  AiLaTrieuPhu
//
//  Created by Nam Bui on 8/9/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import "Common.h"

@implementation Common

static PlayingViewController    *playingView;
static ViewController           *mainView;


+ (PlayingViewController *)getPlayingView
{
    return playingView;
}

+ (ViewController *)getMainView
{
    return mainView;
}

+ (void)setPlayingView:(PlayingViewController *)viewController
{
    playingView = viewController;
}

+ (void)setMainView:(ViewController *)viewController
{
    mainView = viewController;
}

+ (void)loadQuestion
{
    [[DataCenter sharedData] setBlinkingButton:YES];
    [Common stopTimer];
    [Common setButton:[Common getCorrectAnswerButton] enable:YES withImage:IMG_BUTTON_ANSWER];
    
    // Reset current Data Exept current Question Number
    [DataCenter resetCurrentData];
    
    // Set current Question number
    [[DataCenter sharedData] setCurrentQuestionNumber:([DataCenter sharedData].currentQuestionNumber + 1)];
    
    // Get random index
    int randomIndex = arc4random() % [self getMaxRandomValue:[DataCenter sharedData].currentQuestionNumber];
    
    [[DataCenter sharedData] setCurrentQuestion:[self getCurrentQuestionWithQuestionNumber:[DataCenter sharedData].currentQuestionNumber randomIndex:randomIndex]];
    [[DataCenter sharedData] setCurrentQuestionLevel:[DataCenter sharedData].currentQuestion.questionLevel];
    [[DataCenter sharedData] setCurrentAnswer:ANSWER_ID_NON];
    [[DataCenter sharedData] setCurrentAnswerCorrect:[DataCenter sharedData].currentQuestion.answerCorrect];
    
    // Play [Question] sound
    [self playSound:[self getAudioQuestionWithNumber:[DataCenter sharedData].currentQuestionNumber] id:AUDIO_PLAYER_ID_QUESTION loop:0];
    
    // Show Question & Answer view
    [Common showQuestionView];
    [Common showAnswerView];
    
    // Load data for Question & Answer view
    [self getPlayingView].questionTitleLabel.text = [NSString stringWithFormat:QUESTION_TITLE_FORMART, [DataCenter sharedData].currentQuestionNumber];
    [self getPlayingView].questionContentLabel.text = [[DataCenter sharedData].currentQuestion question];
    NSString *answerATitle = [NSString stringWithFormat:BUTTON_TITLE_FORMAT_ANSWER_A, [[DataCenter sharedData].currentQuestion answerA]];
    NSString *answerBTitle = [NSString stringWithFormat:BUTTON_TITLE_FORMAT_ANSWER_B, [[DataCenter sharedData].currentQuestion answerB]];
    NSString *answerCTitle = [NSString stringWithFormat:BUTTON_TITLE_FORMAT_ANSWER_C, [[DataCenter sharedData].currentQuestion answerC]];
    NSString *answerDTitle = [NSString stringWithFormat:BUTTON_TITLE_FORMAT_ANSWER_D, [[DataCenter sharedData].currentQuestion answerD]];
    [[self getPlayingView].answerAButton setTitle:answerATitle forState:UIControlStateNormal];
    [[self getPlayingView].answerBButton setTitle:answerBTitle forState:UIControlStateNormal];
    [[self getPlayingView].answerCButton setTitle:answerCTitle forState:UIControlStateNormal];
    [[self getPlayingView].answerDButton setTitle:answerDTitle forState:UIControlStateNormal];
    
    // Set UnBloking
    [[DataCenter sharedData] setBlockControl:NO];
}

+ (int)getMaxRandomValue:(int)questionNumber
{
    int maxRandom;
    switch ([DataCenter sharedData].currentQuestionNumber)
    {
        case QUESTION_NUMBER_1:
            maxRandom = [[DataCenter sharedData].questionSet.question1 count];
            break;
        case QUESTION_NUMBER_2:
            maxRandom = [[DataCenter sharedData].questionSet.question2 count];
            break;
        case QUESTION_NUMBER_3:
            maxRandom = [[DataCenter sharedData].questionSet.question3 count];
            break;
        case QUESTION_NUMBER_4:
            maxRandom = [[DataCenter sharedData].questionSet.question4 count];
            break;
        case QUESTION_NUMBER_5:
            maxRandom = [[DataCenter sharedData].questionSet.question5 count];
            break;
        case QUESTION_NUMBER_6:
            maxRandom = [[DataCenter sharedData].questionSet.question6 count];
            break;
        case QUESTION_NUMBER_7:
            maxRandom = [[DataCenter sharedData].questionSet.question7 count];
            break;
        case QUESTION_NUMBER_8:
            maxRandom = [[DataCenter sharedData].questionSet.question8 count];
            break;
        case QUESTION_NUMBER_9:
            maxRandom = [[DataCenter sharedData].questionSet.question9 count];
            break;
        case QUESTION_NUMBER_10:
            maxRandom = [[DataCenter sharedData].questionSet.question10 count];
            break;
        case QUESTION_NUMBER_11:
            maxRandom = [[DataCenter sharedData].questionSet.question11 count];
            break;
        case QUESTION_NUMBER_12:
            maxRandom = [[DataCenter sharedData].questionSet.question12 count];
            break;
        case QUESTION_NUMBER_13:
            maxRandom = [[DataCenter sharedData].questionSet.question13 count];
            break;
        case QUESTION_NUMBER_14:
            maxRandom = [[DataCenter sharedData].questionSet.question14 count];
            break;
        case QUESTION_NUMBER_15:
            maxRandom = [[DataCenter sharedData].questionSet.question15 count];
            break;
    }
    
    return maxRandom;
}

+ (QuestionAnswer *)getCurrentQuestionWithQuestionNumber:(int)questionNumber randomIndex:(int)randomIndex
{
    switch (questionNumber)
    {
        case QUESTION_NUMBER_1:
            return [[DataCenter sharedData].questionSet.question1 objectAtIndex:randomIndex];
        case QUESTION_NUMBER_2:
            return [[DataCenter sharedData].questionSet.question2 objectAtIndex:randomIndex];
        case QUESTION_NUMBER_3:
            return [[DataCenter sharedData].questionSet.question3 objectAtIndex:randomIndex];
        case QUESTION_NUMBER_4:
            return [[DataCenter sharedData].questionSet.question4 objectAtIndex:randomIndex];
        case QUESTION_NUMBER_5:
            return [[DataCenter sharedData].questionSet.question5 objectAtIndex:randomIndex];
        case QUESTION_NUMBER_6:
            return [[DataCenter sharedData].questionSet.question6 objectAtIndex:randomIndex];
        case QUESTION_NUMBER_7:
            return [[DataCenter sharedData].questionSet.question7 objectAtIndex:randomIndex];
        case QUESTION_NUMBER_8:
            return [[DataCenter sharedData].questionSet.question8 objectAtIndex:randomIndex];
        case QUESTION_NUMBER_9:
            return [[DataCenter sharedData].questionSet.question9 objectAtIndex:randomIndex];
        case QUESTION_NUMBER_10:
            return [[DataCenter sharedData].questionSet.question10 objectAtIndex:randomIndex];
        case QUESTION_NUMBER_11:
            return [[DataCenter sharedData].questionSet.question11 objectAtIndex:randomIndex];
        case QUESTION_NUMBER_12:
            return [[DataCenter sharedData].questionSet.question12 objectAtIndex:randomIndex];
        case QUESTION_NUMBER_13:
            return [[DataCenter sharedData].questionSet.question13 objectAtIndex:randomIndex];
        case QUESTION_NUMBER_14:
            return [[DataCenter sharedData].questionSet.question14 objectAtIndex:randomIndex];
        case QUESTION_NUMBER_15:
            return [[DataCenter sharedData].questionSet.question15 objectAtIndex:randomIndex];
    }
    
    return nil;
}

+ (void)setQuestionWithQuestionNumber:(int)questionNumber object:(QuestionAnswer *)question
{
    switch (questionNumber)
    {
        case QUESTION_NUMBER_1:
            [[DataCenter sharedData].questionSet.question1 addObject:question];
            break;
        case QUESTION_NUMBER_2:
            [[DataCenter sharedData].questionSet.question2 addObject:question];
            break;
        case QUESTION_NUMBER_3:
            [[DataCenter sharedData].questionSet.question3 addObject:question];
            break;
        case QUESTION_NUMBER_4:
            [[DataCenter sharedData].questionSet.question4 addObject:question];
            break;
        case QUESTION_NUMBER_5:
            [[DataCenter sharedData].questionSet.question5 addObject:question];
            break;
        case QUESTION_NUMBER_6:
            [[DataCenter sharedData].questionSet.question6 addObject:question];
            break;
        case QUESTION_NUMBER_7:
            [[DataCenter sharedData].questionSet.question7 addObject:question];
            break;
        case QUESTION_NUMBER_8:
            [[DataCenter sharedData].questionSet.question8 addObject:question];
            break;
        case QUESTION_NUMBER_9:
            [[DataCenter sharedData].questionSet.question9 addObject:question];
            break;
        case QUESTION_NUMBER_10:
            [[DataCenter sharedData].questionSet.question10 addObject:question];
            break;
        case QUESTION_NUMBER_11:
            [[DataCenter sharedData].questionSet.question11 addObject:question];
            break;
        case QUESTION_NUMBER_12:
            [[DataCenter sharedData].questionSet.question12 addObject:question];
            break;
        case QUESTION_NUMBER_13:
            [[DataCenter sharedData].questionSet.question13 addObject:question];
            break;
        case QUESTION_NUMBER_14:
            [[DataCenter sharedData].questionSet.question14 addObject:question];
            break;
        case QUESTION_NUMBER_15:
            [[DataCenter sharedData].questionSet.question15 addObject:question];
            break;
    }
}

+ (NSString *)getAudioQuestionWithNumber:(int)questionNumber
{
    switch (questionNumber)
    {
        case QUESTION_NUMBER_1:
            return AUDIO_QUESTION_01;
        case QUESTION_NUMBER_2:
            return AUDIO_QUESTION_02;
        case QUESTION_NUMBER_3:
            return AUDIO_QUESTION_03;
        case QUESTION_NUMBER_4:
            return AUDIO_QUESTION_04;
        case QUESTION_NUMBER_5:
            return AUDIO_QUESTION_05;
        case QUESTION_NUMBER_6:
            return AUDIO_QUESTION_06;
        case QUESTION_NUMBER_7:
            return AUDIO_QUESTION_07;
        case QUESTION_NUMBER_8:
            return AUDIO_QUESTION_08;
        case QUESTION_NUMBER_9:
            return AUDIO_QUESTION_09;
        case QUESTION_NUMBER_10:
            return AUDIO_QUESTION_10;
        case QUESTION_NUMBER_11:
            return AUDIO_QUESTION_11;
        case QUESTION_NUMBER_12:
            return AUDIO_QUESTION_12;
        case QUESTION_NUMBER_13:
            return AUDIO_QUESTION_13;
        case QUESTION_NUMBER_14:
            return AUDIO_QUESTION_14;
        case QUESTION_NUMBER_15:
            return AUDIO_QUESTION_15;
    }
    
    return AUDIO_QUESTION_NON;
}

+ (void)startTimerWithInterval:(NSTimeInterval)interval selector:(SEL)aSelector repeats:(BOOL)repeats
{
    [self stopTimer];
    
    [DataCenter sharedData].blockControl = YES;
    [DataCenter sharedData].timer = [NSTimer scheduledTimerWithTimeInterval:interval target:(AppDelegate *)[[UIApplication sharedApplication] delegate] selector:aSelector userInfo:nil repeats:repeats];
}

+ (void)stopTimer
{
    [DataCenter sharedData].blockControl = NO;
    [DataCenter sharedData].timerCount = TIMER_COUNT_DEFAULT;
    [DataCenter sharedData].timerID    = TIMER_ID_NON;
    [[DataCenter sharedData].timer invalidate];
    [DataCenter sharedData].timer = nil;
}

+ (void)setDefault
{
    [[self getPlayingView].questionView  setFrame:FRAME_DEFAULT_VIEW];
    [[self getPlayingView].answerView    setFrame:FRAME_ANSWER_VIEW];
    [[self getPlayingView].answerAButton setFrame:FRAME_DEFAULT_BUTTON];
    [[self getPlayingView].answerBButton setFrame:FRAME_DEFAULT_BUTTON];
    [[self getPlayingView].answerCButton setFrame:FRAME_DEFAULT_BUTTON];
    [[self getPlayingView].answerDButton setFrame:FRAME_DEFAULT_BUTTON];
}

+ (void)clearButtonTextLabel
{
    [[self getPlayingView].answerAButton setTitle:BUTTON_TITLE_EMPTY forState:UIControlStateNormal];
    [[self getPlayingView].answerBButton setTitle:BUTTON_TITLE_EMPTY forState:UIControlStateNormal];
    [[self getPlayingView].answerCButton setTitle:BUTTON_TITLE_EMPTY forState:UIControlStateNormal];
    [[self getPlayingView].answerDButton setTitle:BUTTON_TITLE_EMPTY forState:UIControlStateNormal];
}

+ (void)showQuestionView
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDelay:ANIMATION_DELAY_QUESTION_VIEW_SHOW];
    [UIView setAnimationDuration:ANIMATION_DURATION_QUESTION_VIEW_SHOW];
    [[self getPlayingView].questionView setFrame:FRAME_QUESTION_VIEW];
    [UIView commitAnimations];
}

+ (void)hideQuestionView
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDelay:ANIMATION_DELAY_QUESTION_VIEW_HIDE];
    [UIView setAnimationDuration:ANIMATION_DURATION_QUESTION_VIEW_HIDE];
    [[self getPlayingView].questionView setFrame:FRAME_DEFAULT_VIEW];
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
    [[self getPlayingView].answerAButton setFrame:FRAME_ANSWER_A];
    [UIView commitAnimations];
}

+ (void)showAnswerB
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelay:ANIMATION_DELAY_ANSWER_B_SHOW];
    [UIView setAnimationDuration:ANIMATION_DURATION_ANSWER_B_SHOW];
    [[self getPlayingView].answerBButton setFrame:FRAME_ANSWER_B];
    [UIView commitAnimations];
}

+ (void)showAnswerC
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelay:ANIMATION_DELAY_ANSWER_C_SHOW];
    [UIView setAnimationDuration:ANIMATION_DURATION_ANSWER_C_SHOW];
    [[self getPlayingView].answerCButton setFrame:FRAME_ANSWER_C];
    [UIView commitAnimations];
}

+ (void)showAnswerD
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelay:ANIMATION_DELAY_ANSWER_D_SHOW];
    [UIView setAnimationDuration:ANIMATION_DURATION_ANSWER_D_SHOW];
    [[self getPlayingView].answerDButton setFrame:FRAME_ANSWER_D];
    [UIView commitAnimations];
}


+ (void)hideAnswerA
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDelay:ANIMATION_DELAY_ANSWER_A_HIDE];
    [UIView setAnimationDuration:ANIMATION_DURATION_ANSWER_A_HIDE];
    [[self getPlayingView].answerAButton setFrame:FRAME_DEFAULT_BUTTON];
    [UIView commitAnimations];
}

+ (void)hideAnswerB
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelay:ANIMATION_DELAY_ANSWER_B_HIDE];
    [UIView setAnimationDuration:ANIMATION_DURATION_ANSWER_B_HIDE];
    [[self getPlayingView].answerBButton setFrame:FRAME_DEFAULT_BUTTON];
    [UIView commitAnimations];
}

+ (void)hideAnswerC
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelay:ANIMATION_DELAY_ANSWER_C_HIDE];
    [UIView setAnimationDuration:ANIMATION_DURATION_ANSWER_C_HIDE];
    [[self getPlayingView].answerCButton setFrame:FRAME_DEFAULT_BUTTON];
    [UIView commitAnimations];
}

+ (void)hideAnswerD
{
    [UIView beginAnimations:ANIMATION_NON context:ANIMATION_CONTEXT];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelay:ANIMATION_DELAY_ANSWER_D_HIDE];
    [UIView setAnimationDuration:ANIMATION_DURATION_ANSWER_D_HIDE];
    [[self getPlayingView].answerDButton setFrame:FRAME_DEFAULT_BUTTON];
    [UIView commitAnimations];
}

+ (void)setAnswerButton:(UIButton *)answerButton highlight:(BOOL)highlight
{
    UIImage *normalImage = [UIImage imageNamed:IMG_BUTTON_ANSWER];
    [[self getPlayingView].answerAButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    [[self getPlayingView].answerBButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    [[self getPlayingView].answerCButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    [[self getPlayingView].answerDButton setBackgroundImage:normalImage forState:UIControlStateNormal];
    
    UIImage *image;
    if (highlight == YES)
    {
        image = [UIImage imageNamed:IMG_BUTTON_ANSWER_PRESSED];
    }
    else
    {
        image = [UIImage imageNamed:IMG_BUTTON_ANSWER];
    }
    
    [answerButton setBackgroundImage:image forState:UIControlStateNormal];
    
}

+ (NSURL *)getResourceURL:(NSString *)resourceName
{
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:STRING_PATH_FORMAT,
                                         [[NSBundle mainBundle] resourcePath], resourceName]];

    return url;
}

+ (void)playSound:(NSString *)soundName id:(int)soundID loop:(int)loop
{
    [self stopAudioPlayer];
    [DataCenter sharedData].audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[self getResourceURL:soundName] error:nil];
    [[DataCenter sharedData].audioPlayer setDelegate:(AppDelegate *)[[UIApplication sharedApplication] delegate]];
	[[DataCenter sharedData].audioPlayer play];
    [[DataCenter sharedData].audioPlayer setNumberOfLoops:loop];
    [[DataCenter sharedData] setAudioPlayerID:soundID];
}

+ (void)stopAudioPlayer
{
    if ([DataCenter sharedData].audioPlayer != nil)
    {
        [[DataCenter sharedData].audioPlayer stop];
        [DataCenter sharedData].audioPlayer = nil;
    }
}

+ (void)showMessage:(NSString *)message okTitle:(NSString *)ok cancel:(NSString *)cancel
{
    [DataCenter sharedData].alertView = [[UIAlertView alloc] initWithTitle:MESSAGE_TITLE message:message delegate:(AppDelegate *)[[UIApplication sharedApplication] delegate] cancelButtonTitle:ok otherButtonTitles:cancel, nil];
    [[DataCenter sharedData].alertView show];
}

+ (void)dismissMessage
{
    if ([DataCenter sharedData].alertView != nil)
    {
        [[DataCenter sharedData].alertView dismissWithClickedButtonIndex:0 animated:YES];
    }
}

+ (void)resetButton
{
    [self setAnswerButton:[Common getCurrentAnswerButton] highlight:NO];
    
    [[Common getPlayingView].answerAButton setEnabled:YES];
    [[Common getPlayingView].answerBButton setEnabled:YES];
    [[Common getPlayingView].answerCButton setEnabled:YES];
    [[Common getPlayingView].answerDButton setEnabled:YES];
}

+ (UIButton *)getCurrentAnswerButton
{
    switch ([DataCenter sharedData].currentAnswer)
    {
        case ANSWER_ID_A:
            return [self getPlayingView].answerAButton;
            break;
        case ANSWER_ID_B:
            return [self getPlayingView].answerBButton;
            break;
        case ANSWER_ID_C:
            return [self getPlayingView].answerCButton;
            break;
        case ANSWER_ID_D:
            return [self getPlayingView].answerDButton;
            break;
    }
    return nil;
}

+ (UIButton *)getCorrectAnswerButton
{
    switch ([DataCenter sharedData].currentAnswerCorrect)
    {
        case ANSWER_ID_A:
            return [self getPlayingView].answerAButton;
            break;
        case ANSWER_ID_B:
            return [self getPlayingView].answerBButton;
            break;
        case ANSWER_ID_C:
            return [self getPlayingView].answerCButton;
            break;
        case ANSWER_ID_D:
            return [self getPlayingView].answerDButton;
            break;
    }
    
    return [self getPlayingView].answerAButton;
}

+ (void)saveScore:(NSString *)score name:(NSString *)name
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSMutableDictionary *scoreDictionary = [userDefault objectForKey:USER_KEY];
    if (scoreDictionary == nil)
    {
        scoreDictionary = [[NSMutableDictionary alloc] initWithCapacity:0];
    }
    
    [scoreDictionary setValue:name forKey:USER_KEY_NAME];
    [scoreDictionary setValue:score forKey:USER_KEY_SCORE];
    
    [userDefault setObject:scoreDictionary forKey:USER_KEY];
    [userDefault synchronize];
}

+ (NSMutableDictionary *)loadScore
{
    
    return nil;
}

+ (void)updateScore:(int)questionNumber
{
    [[self getPlayingView].moneyLabel setText:MONEY[questionNumber]];
}

+ (void)help5050
{    
    int currentAnswerCorrect = [DataCenter sharedData].currentAnswerCorrect;
    NSArray *randomArray;
    
    switch (currentAnswerCorrect)
    {
        case ANSWER_ID_A:
            // BD or CB
            randomArray = [[NSArray alloc] initWithObjects:HELP_5050_BD, HELP_5050_CB, nil];            
            break;
            
        case ANSWER_ID_B:
            // AC or AD
            randomArray = [[NSArray alloc] initWithObjects:HELP_5050_AC, HELP_5050_AD, nil];
            break;
            
        case ANSWER_ID_C:
            // AD or BD
            randomArray = [[NSArray alloc] initWithObjects:HELP_5050_AD, HELP_5050_BD, nil];
            break;
            
        case ANSWER_ID_D:
            // AC or CB
            randomArray = [[NSArray alloc] initWithObjects:HELP_5050_AC, HELP_5050_CB, nil];
            break;
    }
    
    int randomIndex = arc4random() % 2;
    [self setButtonHideWithHelp:[randomArray objectAtIndex:randomIndex]];
}

+ (void)setButtonHideWithHelp:(NSMutableString *)help
{
    if (help == HELP_5050_AC)
    {
        [Common playSound:AUDIO_HELP_5050_AC id:AUDIO_PLAYER_ID_QUESTION loop:AUDIO_PLAYER_LOOP_NON];
        [[Common getPlayingView].answerAButton setEnabled:NO];
        [[Common getPlayingView].answerAButton setTitle:STRING_EMPTY forState:UIControlStateNormal];
        [[Common getPlayingView].answerCButton setEnabled:NO];
        [[Common getPlayingView].answerCButton setTitle:STRING_EMPTY forState:UIControlStateNormal];
        return;
    }
    
    if (help == HELP_5050_AD)
    {
        [Common playSound:AUDIO_HELP_5050_AD id:AUDIO_PLAYER_ID_QUESTION loop:AUDIO_PLAYER_LOOP_NON];
        [[Common getPlayingView].answerAButton setEnabled:NO];
        [[Common getPlayingView].answerAButton setTitle:STRING_EMPTY forState:UIControlStateNormal];
        [[Common getPlayingView].answerDButton setEnabled:NO];
        [[Common getPlayingView].answerDButton setTitle:STRING_EMPTY forState:UIControlStateNormal];
        return;
    }
    
    if (help == HELP_5050_BD)
    {
        [Common playSound:AUDIO_HELP_5050_BD id:AUDIO_PLAYER_ID_QUESTION loop:AUDIO_PLAYER_LOOP_NON];
        [[Common getPlayingView].answerBButton setEnabled:NO];
        [[Common getPlayingView].answerBButton setTitle:STRING_EMPTY forState:UIControlStateNormal];
        [[Common getPlayingView].answerDButton setEnabled:NO];
        [[Common getPlayingView].answerDButton setTitle:STRING_EMPTY forState:UIControlStateNormal];
        return;
    }
    
    if (help == HELP_5050_CB)
    {
        [Common playSound:AUDIO_HELP_5050_CB id:AUDIO_PLAYER_ID_QUESTION loop:AUDIO_PLAYER_LOOP_NON];
        [[Common getPlayingView].answerCButton setEnabled:NO];
        [[Common getPlayingView].answerCButton setTitle:STRING_EMPTY forState:UIControlStateNormal];
        [[Common getPlayingView].answerBButton setEnabled:NO];
        [[Common getPlayingView].answerBButton setTitle:STRING_EMPTY forState:UIControlStateNormal];
        return;
    }
}


+ (void)helpCall
{
    NSString *callAnswer;
    int randomAnswer = (arc4random()%5)+1;
    switch (randomAnswer)
    {
        case 1:
            callAnswer = MESSAGE_CALL_HELP_A;
            break;
        case 2:
            callAnswer = MESSAGE_CALL_HELP_B;
            break;
        case 3:
            callAnswer = MESSAGE_CALL_HELP_C;
            break;
        case 4:
            callAnswer = MESSAGE_CALL_HELP_D;
            break;
    }
    
    [DataCenter sharedData].alertView = [[UIAlertView alloc] initWithTitle:MESSAGE_TITLE_HELP_CALL message:callAnswer delegate:self cancelButtonTitle:MESSAGE_CALL_CANCEL otherButtonTitles:MESSAGE_CALL_OK, MESSAGE_CALL_CHOOSE, nil];
    [[DataCenter sharedData].alertView setTag:ALERT_TAG_CALL];
    [[DataCenter sharedData].alertView show];
}

+ (void)helpAudience
{
//    int px = 320;
//    int py = 460;
    
    int randomA = (arc4random()%101);
    int randomB = arc4random()%(101 - randomA);
    int randomC = arc4random()%(101 - randomA - randomB);
    int randomD = arc4random()%(101 - randomA - randomB - randomC);
    
//    NTChartView *chartView = [[NTChartView alloc] initWithFrame:CGRectMake(0, 0, px, py)];
//	
//	NSArray *graphic =  [NSArray arrayWithObjects:
//                         [NSNumber numberWithFloat:randomA],
//                         [NSNumber numberWithFloat:randomB],
//                         [NSNumber numberWithFloat:randomC],
//                         [NSNumber numberWithFloat:randomD],nil];
//    
//    NSArray *groupData = [NSArray arrayWithObjects:graphic, nil];
//    NSArray *groupTitle = [NSArray arrayWithObjects:@"Khán giả bình chọn", nil];
//    NSArray *xAxisLabel = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", nil];
//    NSArray *chartTitle = [NSArray arrayWithObjects:@"Kết quả bình chọn của khán giả",@"", nil];
//    
//	chartView.groupData = groupData;
//    chartView.groupTitle = groupTitle;
//    chartView.xAxisLabel = xAxisLabel;
//    chartView.chartTitle = chartTitle;
//    
//    chartView.backgroundColor = [UIColor clearColor];
//    chartView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
//    
//    AudienceViewController *viewConroller = [[AudienceViewController alloc] init];
//    [viewConroller.view addSubview:chartView];
//    
//    [[self getPlayingView].navigationController pushViewController:viewConroller animated:YES];
    
    NSString *message = [NSString stringWithFormat:@"Đáp A: %d\nĐáp án B:%d\nĐáp án D:%d\nĐáp án B:%d", randomA, randomB, randomC, randomD];
    
    [DataCenter sharedData].alertView = [[UIAlertView alloc] initWithTitle:MESSAGE_TITLE_HELP_AUDIENCE message:message delegate:(AppDelegate *)[[UIApplication sharedApplication] delegate] cancelButtonTitle:MESSAGE_HELP_OK otherButtonTitles:nil, nil];
    [[DataCenter sharedData].alertView show];
    
}

+ (void)setButton:(UIButton *)button enable:(BOOL)enable withImage:(NSString *)imageName
{
    [button setEnabled:enable];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

+ (void)blinkingButton:(UIButton *)button image1:(NSString *)imageName1 image2:(NSString *)imageName2
{
    if ([DataCenter sharedData].blinkingButton == YES)
    {
        [self setButton:button enable:YES withImage:imageName1];
    }
    else
    {
        [self setButton:button enable:YES withImage:imageName2];
    }
    [[DataCenter sharedData] setBlinkingButton:![DataCenter sharedData].blinkingButton];
}


@end
