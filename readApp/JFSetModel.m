//
//  JFSetModel.m
//  readApp
//
//  Created by ran on 13-10-9.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import "JFSetModel.h"

@implementation JFSetModel
@synthesize bgColor;
@synthesize textColor;
@synthesize textFont;

- (void)encodeWithCoder:(NSCoder *)aCoder
{
 
    [aCoder encodeObject:self.bgColor forKey:@"bgColor"];
    [aCoder encodeObject:self.textColor forKey:@"textColor"];
    [aCoder encodeObject:self.textFont forKey:@"textFont"];
    
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.bgColor = [aDecoder decodeObjectForKey:@"bgColor"];
        self.textColor = [aDecoder decodeObjectForKey:@"textColor"];
        self.textFont = [aDecoder decodeObjectForKey:@"textFont"];
        
        
    }
    
    return self;
}


-(void)dealloc
{
    
    self.bgColor = nil;
    self.textFont = nil;
    self.textColor = nil;
    
    [super dealloc];
}

@end