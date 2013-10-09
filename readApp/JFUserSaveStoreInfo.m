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
+(NSArray *)getUserBookMarkForUUID:(int)uuid
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dataPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%dUserBookMarkForUUID",uuid]];
    
    NSArray *arrayBookMark = [NSKeyedUnarchiver unarchiveObjectWithFile:dataPath];
    
    return arrayBookMark;
}

@end
