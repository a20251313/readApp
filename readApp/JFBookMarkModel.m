//
//  JFBookMarkModel.m
//  readApp
//
//  Created by ran on 13-10-9.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import "JFBookMarkModel.h"

@implementation JFBookMarkModel

-(id)init
{
    self = [super init];
    if (self)
    {
    
    }
    return self;
}


-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:self.index forKey:@"index"];
    [aCoder encodeObject:self.time forKey:@"time"];
    [aCoder encodeObject:self.content forKey:@"content"];
    [aCoder encodeObject:self.chaptitle forKey:@"chaptitle"];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.index = [aDecoder decodeIntForKey:@"index"];
        self.time = [aDecoder decodeObjectForKey:@"time"];
        self.content = [aDecoder decodeObjectForKey:@"content"];
        self.chaptitle = [aDecoder decodeObjectForKey:@"chaptitle"];
        
    }
    
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


-(void)dealloc
{
    self.time = nil;
    self.content = nil;
    self.chaptitle = nil;
    [super dealloc];
}


-(NSString *)description
{
    return [NSString stringWithFormat:@"<<%p>>  class:JFBookMarkModel  index:%d time:%@ content:%@ chapTitle:%@",self,self.index,self.time,self.content,self.chaptitle];
}

@end
