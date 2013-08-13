//
//  SQLiteManager.m
//  AiLaTrieuPhu
//
//  Created by Nam Bùi on 8/12/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import "SQLiteManager.h"

@implementation SQLiteManager

- (void)prepairQuestionSet
{
    if ([DataCenter sharedData].questionSet != nil)
    {
        return;
    }
    
    if((sqlite3_open([[[Common getResourceURL:DATABASE_FILE_NAME] path] UTF8String], &sqlDataBase) != SQLITE_OK))
    {
        return;
    }
    
    if(sqlite3_prepare(sqlDataBase, [DATABASE_STRING_SELECT cStringUsingEncoding:NSASCIIStringEncoding], -1, &sqlStatement, NULL) != SQLITE_OK)
    {
        return;
    }
             
    [DataCenter sharedData].questionSet = [[QuestionSet alloc] init];
    while (sqlite3_step(sqlStatement)==SQLITE_ROW)
    {
        QuestionAnswer *question = [[QuestionAnswer alloc] init];
        
        [question setQuestionNumber:sqlite3_column_int(sqlStatement, 0)];
        [question setQuestionLevel:sqlite3_column_int(sqlStatement, 1)];
        [question setQuestion:[NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 2)]];
        [question setAnswerA:[NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 3)]];
        [question setAnswerB:[NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 4)]];
        [question setAnswerC:[NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 5)]];
        [question setAnswerD:[NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 6)]];
        [question setAnswerCorrect:sqlite3_column_int(sqlStatement, 7)];
        
        [Common setQuestionWithQuestionNumber:[question questionNumber] object:question];
    }
}

@end
