//
//  JFUserSaveStoreInfo.h
//  readApp
//
//  Created by ran on 13-10-9.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JFBookMarkModel.h"


@interface JFUserSaveStoreInfo : NSObject


+(BOOL)userStoreLastreadBookMark:(JFBookMarkModel *)model;
+(JFBookMarkModel*)getUserStoreLastreadBookMark;
+(BOOL)storeUserBookMarkForUUID:(int)uuid  bookMark:(JFBookMarkModel*)model;
+(NSArray *)getUserBookMarkForUUID:(int)uuid;

@end
