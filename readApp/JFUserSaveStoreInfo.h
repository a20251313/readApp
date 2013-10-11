//
//  JFUserSaveStoreInfo.h
//  readApp
//
//  Created by ran on 13-10-9.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JFBookMarkModel.h"
#import "JFSetModel.h"

@interface JFUserSaveStoreInfo : NSObject


+(BOOL)userStoreLastreadBookMark:(JFBookMarkModel *)model;
+(JFBookMarkModel*)getUserStoreLastreadBookMark;
+(BOOL)storeUserBookMarkForUUID:(int)uuid  bookMark:(JFBookMarkModel*)model;
+(BOOL)deleteUserBookMarkForUUID:(int)uuid  bookMark:(NSDate*)date;
+(NSArray *)getUserBookMarkForUUID:(int)uuid;

+(JFSetModel*)GetUserBsetModelForUUID:(int)uuid;
+(BOOL)storeUserBsetModelForUUID:(int)uuid  setModel:(JFSetModel*)model;


@end
