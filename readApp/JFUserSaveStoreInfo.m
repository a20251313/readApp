//
//  JFUserSaveStoreInfo.m
//  readApp
//
//  Created by ran on 13-10-9.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import "JFUserSaveStoreInfo.h"

@implementation JFUserSaveStoreInfo


+(BOOL)userStoreLastreadBookMark:(JFBookMarkModel *)model
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"userStoreLastreadBookMark"]];
    BOOL suc =   [NSKeyedArchiver archiveRootObject:model toFile:dataPath];
    
    return suc;
}

+(JFBookMarkModel*)getUserStoreLastreadBookMark
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"userStoreLastreadBookMark"]];
    JFBookMarkModel  *model = [NSKeyedUnarchiver unarchiveObjectWithFile:dataPath];
    
    return model;
}



+(BOOL)storeUserBookMarkForUUID:(int)uuid  bookMark:(JFBookMarkModel*)model
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%dUserBookMarkForUUID",uuid]];
    
    NSArray *arrayBookMark = [NSKeyedUnarchiver unarchiveObjectWithFile:dataPath];
    
    NSMutableArray  *array = [NSMutableArray array];
    [array addObject:model];
    [array addObjectsFromArray:arrayBookMark];
    
    BOOL  suc =  [NSKeyedArchiver archiveRootObject:array toFile:dataPath];
    
    return suc;
}


+(BOOL)deleteUserBookMarkForUUID:(int)uuid  bookMark:(NSDate*)date
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%dUserBookMarkForUUID",uuid]];
    
    NSArray *arrayBookMark = [NSKeyedUnarchiver unarchiveObjectWithFile:dataPath];
    
    NSMutableArray  *array = [NSMutableArray array];
    [array addObjectsFromArray:arrayBookMark];
    
    
    for (JFBookMarkModel  *model in array)
    {
        if ([model.time compare:date] == NSOrderedSame)
        {
            [array removeObject:model];
            break;
            
        }
    }
    
    
    BOOL  suc =  [NSKeyedArchiver archiveRootObject:array toFile:dataPath];
    
    return suc;
}
+(NSArray *)getUserBookMarkForUUID:(int)uuid
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%dUserBookMarkForUUID",uuid]];
    
    NSArray *arrayBookMark = [NSKeyedUnarchiver unarchiveObjectWithFile:dataPath];
    
    return arrayBookMark;
}



+(BOOL)storeUserBsetModelForUUID:(int)uuid  setModel:(JFSetModel*)model
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%dstoreUserBsetModelForUUID",uuid]];
    

    
    BOOL  suc =  [NSKeyedArchiver archiveRootObject:model toFile:dataPath];
    
    return suc;
}

+(JFSetModel*)GetUserBsetModelForUUID:(int)uuid
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%dstoreUserBsetModelForUUID",uuid]];
    
    
    
    JFSetModel  *model = [NSKeyedUnarchiver unarchiveObjectWithFile:dataPath];
    
    return model;
}

@end
