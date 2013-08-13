//
//  SQLiteManager.h
//  AiLaTrieuPhu
//
//  Created by Nam Bùi on 8/12/13.
//  Copyright (c) 2013 Nam Bui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"

@interface SQLiteManager : NSObject
{
    sqlite3         *sqlDataBase;
    sqlite3_stmt    *sqlStatement;
}

- (void)prepairQuestionSet;



@end
