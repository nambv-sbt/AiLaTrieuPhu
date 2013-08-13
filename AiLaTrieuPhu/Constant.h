//
//  NSObject_Constant_h.h
//  AiLaTrieuPhu
//
//  Created by Nam Bui on 8/8/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#define STRING_EMPTY                            @""
#define STRING_PATH_FORMAT                      @"%@/%@"

// Help 5050
#define HELP_5050_AC                            @"AC"
#define HELP_5050_AD                            @"AD"
#define HELP_5050_BD                            @"BD"
#define HELP_5050_CB                            @"CB"

// Score
#define USER_KEY                                @"Scores"
#define USER_KEY_NAME                           @"Name"
#define USER_KEY_SCORE                          @"Score"
#define MONEY                                   [[NSArray alloc] initWithObjects:@"0 VNĐ", @"200.000 VNĐ", @"400.000 VNĐ", @"600.000 VNĐ", @"1.000.000 VNĐ", @"2.000.000 VNĐ", @"3.000.000 VNĐ", @"6.000.000 VNĐ", @"10.000.000 VNĐ", @"14.000.000 VNĐ", @"22.000.000 VNĐ", @"30.000.000 VNĐ", @"40.000.000 VNĐ", @"60.000.000 VNĐ", @"85.000.000 VNĐ", @"150.000.000 VNĐ", nil]

// Storyboard
#define STORYBOARD_IPHONE_NAME                  @"MainStoryboard_iPhone"
#define STORYBOARD_PLAYINGVIEW_IDENTIFIER       @"PlayingView"

// SQLite DataBase
#define DATABASE_FILE_NAME                      @"AiLaTrieuPhu.sqlite"
#define DATABASE_STRING_SELECT                  @"SELECT Number, Level, Question, Answer1 , Answer2 , Answer3 , Answer4 , Correct FROM QuestionSet"

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
#define ANIMATION_DELAY_ANSWER_D_HIDE           -1.0
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
#define BUTTON_TITLE_EMPTY                      @""
#define BUTTON_TITLE_FORMAT_ANSWER_A            @"                    A. %@"
#define BUTTON_TITLE_FORMAT_ANSWER_B            @"                    B. %@"
#define BUTTON_TITLE_FORMAT_ANSWER_C            @"                    C. %@"
#define BUTTON_TITLE_FORMAT_ANSWER_D            @"                    D. %@"

// Images
#define IMG_BUTTON_ANSWER                       @"button_answer.png"
#define IMG_BUTTON_ANSWER_PRESSED               @"button_answer_pressed.png"
#define IMG_BUTTON_ANSWER_CORRECT               @"button_answer_correct.png"
#define IMG_BUTTON_HELP_5050_ON                 @"button_5050_on.png"
#define IMG_BUTTON_HELP_5050_OFF                @"button_5050_off.png"
#define IMG_BUTTON_HELP_AUDIENCE_ON             @"button_audience_on.png"
#define IMG_BUTTON_HELP_AUDIENCE_OFF            @"button_audience_off.png"
#define IMG_BUTTON_HELP_CALL_ON                 @"button_call_on.png"
#define IMG_BUTTON_HELP_CALL_OFF                @"button_call_off.png"

// Timer
#define TIMER_COUNT_DEFAULT                     0
#define TIMER_COUNT_BLINKING_BUTTON             6
#define TIMER_ID_NON                            0
#define TIMER_ID_BLINKING_BUTTON                1

#define TIMER_INTERVAL_NON                      0
#define TIMER_INTERVAL_BLINKING_BUTTON          0.3

// Answer ID
#define ANSWER_ID_NON                           0
#define ANSWER_ID_A                             1
#define ANSWER_ID_B                             2
#define ANSWER_ID_C                             3
#define ANSWER_ID_D                             4

// Question Number
#define QUESTION_NUMBER_NON                     0
#define QUESTION_NUMBER_1                       1
#define QUESTION_NUMBER_2                       2
#define QUESTION_NUMBER_3                       3
#define QUESTION_NUMBER_4                       4
#define QUESTION_NUMBER_5                       5
#define QUESTION_NUMBER_6                       6
#define QUESTION_NUMBER_7                       7
#define QUESTION_NUMBER_8                       8
#define QUESTION_NUMBER_9                       9
#define QUESTION_NUMBER_10                      10
#define QUESTION_NUMBER_11                      11
#define QUESTION_NUMBER_12                      12
#define QUESTION_NUMBER_13                      13
#define QUESTION_NUMBER_14                      14
#define QUESTION_NUMBER_15                      15
#define AUDIO_PLAYER_ID_HELP_5050               16
#define AUDIO_PLAYER_ID_HELP_CALL               17
#define AUDIO_PLAYER_ID_HELP_AUDIENCE           18

// Question Level
#define QUESTION_LEVEL_NON                      0
#define QUESTION_LEVEL_1                        1
#define QUESTION_LEVEL_2                        2
#define QUESTION_LEVEL_3                        3

// Question Title
#define QUESTION_TITLE_FORMART                  @"Câu hỏi số %d"

// AlertView & Message
#define ALERT_TAG_CALL                          1
#define MESSAGE_TITLE                           @"Ai Là Triệu Phú"
#define MESSAGE_ABOUT                           @"Ai Là Triệu Phú là Game show đang hót nhất hiện nay trên các nền tảng di động iOS, Android ...\n Phiên bản hiện tại đang phát triển thêm các cao cấp khác.\n\nBản quyền thuộc về Nam Bùi"
#define MESSAGE_ALREADY                         @"Bạn nắm rõ luật của chương trình. Đã sẵn sàng chơi với chúng tôi chưa ạ?"
#define MESSAGE_RULE                            @"Bạn sẽ phải trả lời 15 câu hỏi cũng như tất cả ai đến với Ai Là Triệu Phú. Có 3 mốc rất quan trọng cần phải vượt qua là 5, 10 và 15. Và có 3 sự trợ giúp dành cho bạn là [50 50], [Gọi điện thoại cho người thân] hoặc [Hỏi ý kiến khán giả trong trường quay]. Bạn đã nắm rõ luật! Đã sẵn sàng chơi với chúng tôi chưa ạ?"
#define MESSAGE_CONTINUE_PLAY                   @"Bạn có muốn tiếp tục chơi lại hay không?"
#define MESSAGE_TIME_OUT                        @"Đã hết thời gian trả lời câu hỏi. Bạn đã thưa cuộc. \nBạn có muốn tiếp tục chơi lại hay không?"
#define MESSAGE_WIN                             @"Bạn là người đầu tiên chiến tháng trong Game show này.\n\n Mời bạn nhập tên của mình:"
#define MESSAGE_STOP                            @"Bạn đã lựa chọn dừng cuộc chơi để bảo toàn số điểm của mình.\n\nBạn có muốn tiếp tục chơi lại hay không?"

#define MESSAGE_OK                              @"OK"
#define MESSAGE_CANCEL                          @"Cancel"
#define MESSAGE_ALREADY_YES                     @"Tôi đã sẵn sàng"
#define MESSAGE_ALREADY_NO                      @"Tôi chưa sẵn sàng"
#define MESSAGE_RULE_YES                        @"Tôi đã rõ luật"
#define MESSAGE_RULE_NO                         @"Không chơi nữa"
#define MESSAGE_CONTINUE_PLAY_YES               @"Tôi muốn chơi lại"
#define MESSAGE_CONTINUE_PLAY_NO                @"Tôi không muốn"

#define MESSAGE_TITLE_HELP_CALL                 @"Gọi điện thoại cho người thân"
#define MESSAGE_CALL_HELP_A                     @"Câu này tôi nghĩ đáp án A là đúng!"
#define MESSAGE_CALL_HELP_B                     @"Có lẽ đáp B là đúng!"
#define MESSAGE_CALL_HELP_C                     @"Tôi không chắc lắm nhưng tôi nghĩ C là đáp án đúng!"
#define MESSAGE_CALL_HELP_D                     @"Chọn đáp án D đi bạn!"
#define MESSAGE_CALL_OK                         @"OK"
#define MESSAGE_CALL_CANCEL                     @"Ừh biết rồi"
#define MESSAGE_CALL_CHOOSE                     @"Chọn như vậy đi"
#define MESSAGE_TITLE_HELP_AUDIENCE             @"Kết quả bình chọn của khán giả"
#define MESSAGE_HELP_OK                         @"Xin cám ơn quý vị khán giả"


// AudioPlayer
#define AUDIO_PLAYER_LOOP_NON                   0
#define AUDIO_PLAYER_LOOP_BACKGROUND            20
#define AUDIO_PLAYER_LOOP_ANSWER                3
#define AUDIO_PLAYER_VOLUME_MIN                 0.0
#define AUDIO_PLAYER_VOLUME_MAX                 1.0

// AudioPlayer ID
#define AUDIO_PLAYER_ID_NON                     0
#define AUDIO_PLAYER_ID_BACKGROUND              1
#define AUDIO_PLAYER_ID_ALREADY                 2
#define AUDIO_PLAYER_ID_RULE                    3
#define AUDIO_PLAYER_ID_GAME_START              4
#define AUDIO_PLAYER_ID_QUESTION                5
#define AUDIO_PLAYER_ID_WAIT_ANSWER             6
#define AUDIO_PLAYER_ID_LOSE                    7
#define AUDIO_PLAYER_ID_PASS                    8
#define AUDIO_PLAYER_ID_APPLAUSE                9
#define AUDIO_PLAYER_ID_CLOSING                 10
#define AUDIO_PLAYER_ID_APPLAUSE_LOSE           11
#define AUDIO_PLAYER_ID_CHEER                   12
#define AUDIO_PLAYER_ID_CHEER_WIN               13
#define AUDIO_PLAYER_ID_MILESTONE               14
#define AUDIO_PLAYER_ID_DELAY_ANSWER            15
#define AUDIO_PLAYER_ID_STOP                    16
#define AUDIO_PLAYER_ID_HELP_5050_DONE          17

// AudioPlayer file
#define AUDIO_ANSWER_A_TRUE                     @"AUDIO_ANSWER_A_TRUE.mp3"
#define AUDIO_ANSWER_A                          @"AUDIO_ANSWER_A.mp3"
#define AUDIO_ANSWER_B_TRUE                     @"AUDIO_ANSWER_B_TRUE.mp3"
#define AUDIO_ANSWER_B                          @"AUDIO_ANSWER_B.mp3"
#define AUDIO_ANSWER_C_TRUE                     @"AUDIO_ANSWER_C_TRUE.mp3"
#define AUDIO_ANSWER_C                          @"AUDIO_ANSWER_C.mp3"
#define AUDIO_ANSWER_D_TRUE                     @"AUDIO_ANSWER_D_TRUE.mp3"
#define AUDIO_ANSWER_D                          @"AUDIO_ANSWER_D.mp3"
#define AUDIO_ANSWER_DELAY_1                    @"AUDIO_ANSWER_DELAY_1.mp3"
#define AUDIO_ANSWER_DELAY_2                    @"AUDIO_ANSWER_DELAY_2.mp3"
#define AUDIO_ANSWER_LOSE_A_TRUE                @"AUDIO_ANSWER_LOSE_A_TRUE.mp3"
#define AUDIO_ANSWER_LOSE_B_TRUE                @"AUDIO_ANSWER_LOSE_B_TRUE.mp3"
#define AUDIO_ANSWER_LOSE_C_TRUE                @"AUDIO_ANSWER_LOSE_C_TRUE.mp3"
#define AUDIO_ANSWER_LOSE_D_TRUE                @"AUDIO_ANSWER_LOSE_D_TRUE.mp3"
#define AUDIO_GAME_ALREADY                      @"AUDIO_GAME_ALREADY.mp3"
#define AUDIO_GAME_APPLAUSE                     @"AUDIO_GAME_APPLAUSE.mp3"
#define AUDIO_GAME_BACKGROUND                   @"AUDIO_GAME_BACKGROUND.mp3"
#define AUDIO_GAME_BEST_PLAYER                  @"AUDIO_GAME_BEST_PLAYER.mp3"
#define AUDIO_GAME_CLOSING                      @"AUDIO_GAME_CLOSING.mp3"
#define AUDIO_GAME_MILESTONE_1                  @"AUDIO_GAME_MILESTONE_1.mp3"
#define AUDIO_GAME_MILESTONE_2                  @"AUDIO_GAME_MILESTONE_2.mp3"
#define AUDIO_GAME_MILESTONE_3                  @"AUDIO_GAME_MILESTONE_3.mp3"
#define AUDIO_GAME_MILESTONE_CHEER              @"AUDIO_GAME_MILESTONE_CHEER.mp3"
#define AUDIO_GAME_MILESTONE_IMPORTANT          @"AUDIO_GAME_MILESTONE_IMPORTANT.mp3"
#define AUDIO_GAME_MILESTONE_PASS               @"AUDIO_GAME_MILESTONE_PASS.mp3"
#define AUDIO_GAME_RULES                        @"AUDIO_GAME_RULES.mp3"
#define AUDIO_GAME_START                        @"AUDIO_GAME_START.mp3"
#define AUDIO_GAME_STOP                         @"AUDIO_GAME_STOP.mp3"
#define AUDIO_GAME_TIME_STICK                   @"AUDIO_GAME_TIME_STICK.mp3"
#define AUDIO_HELP_5050_AC                      @"AUDIO_HELP_5050_AC.mp3"
#define AUDIO_HELP_5050_AD                      @"AUDIO_HELP_5050_AD.mp3"
#define AUDIO_HELP_5050_BD                      @"AUDIO_HELP_5050_BD.mp3"
#define AUDIO_HELP_5050_CB                      @"AUDIO_HELP_5050_CB.mp3"
#define AUDIO_HELP_5050                         @"AUDIO_HELP_5050.mp3"
#define AUDIO_HELP_AUDIENCE                     @"AUDIO_HELP_AUDIENCE.mp3"
#define AUDIO_HELP_CALL                         @"AUDIO_HELP_CALL.mp3"
#define AUDIO_QUESTION_NON                      @""
#define AUDIO_QUESTION_01                       @"AUDIO_QUESTION_01.mp3"
#define AUDIO_QUESTION_02                       @"AUDIO_QUESTION_02.mp3"
#define AUDIO_QUESTION_03                       @"AUDIO_QUESTION_03.mp3"
#define AUDIO_QUESTION_04                       @"AUDIO_QUESTION_04.mp3"
#define AUDIO_QUESTION_05                       @"AUDIO_QUESTION_05.mp3"
#define AUDIO_QUESTION_06                       @"AUDIO_QUESTION_06.mp3"
#define AUDIO_QUESTION_07                       @"AUDIO_QUESTION_07.mp3"
#define AUDIO_QUESTION_08                       @"AUDIO_QUESTION_08.mp3"
#define AUDIO_QUESTION_09                       @"AUDIO_QUESTION_09.mp3"
#define AUDIO_QUESTION_10                       @"AUDIO_QUESTION_10.mp3"
#define AUDIO_QUESTION_11                       @"AUDIO_QUESTION_11.mp3"
#define AUDIO_QUESTION_12                       @"AUDIO_QUESTION_12.mp3"
#define AUDIO_QUESTION_13                       @"AUDIO_QUESTION_13.mp3"
#define AUDIO_QUESTION_14                       @"AUDIO_QUESTION_14.mp3"
#define AUDIO_QUESTION_15                       @"AUDIO_QUESTION_15.mp3"

