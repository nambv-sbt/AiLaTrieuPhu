//
//  PlayingViewController.h
//  AiLaTrieuPhu
//
//  Created by Nam Bui on 8/8/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "Common.h"

@interface PlayingViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) NSTimer           *timer;
@property (nonatomic)         int               timerCount;
@property (strong, nonatomic) NSString          *timerID;
@property (strong, nonatomic) NSString          *answerID;
@property (nonatomic)         int               buttonBlinking;
@property (nonatomic)         BOOL              blockControl;
@property (strong, nonatomic) NSString          *animationString;
@property (strong, nonatomic) UIAlertView       *alertView;
@property (strong, nonatomic) IBOutlet UIView   *questionView;
@property (strong, nonatomic) IBOutlet UIView   *answerView;
@property (strong, nonatomic) IBOutlet UILabel  *questionTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel  *questionContentLabel;
@property (strong, nonatomic) IBOutlet UIButton *answerAButton;
@property (strong, nonatomic) IBOutlet UIButton *answerBButton;
@property (strong, nonatomic) IBOutlet UIButton *answerCButton;
@property (strong, nonatomic) IBOutlet UIButton *answerDButton;

- (IBAction)doAnswerA:(id)sender;
- (IBAction)doAnswerB:(id)sender;
- (IBAction)doAnswerC:(id)sender;
- (IBAction)doAnswerD:(id)sender;
@end