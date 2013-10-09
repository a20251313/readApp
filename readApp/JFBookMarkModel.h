//
//  JFBookMarkModel.h
//  readApp
//
//  Created by ran on 13-10-9.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFBookMarkModel : NSObject<NSCoding>

@property(nonatomic)int     index;
@property(nonatomic,copy) NSString  *content;
@property(nonatomic,copy) NSString  *chaptitle;
@property(nonatomic,copy) NSDate    *time;


@end
