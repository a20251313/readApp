//
//  JFChapterTitleView.m
//  readApp
//
//  Created by ran on 13-10-9.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import "JFChapterTitleView.h"

@implementation JFChapterTitleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
      /// [self setBackgroundColor:[UIColor lightGrayColor]];
         //self.alpha = 0.3;
        
        self.layer.contents = (id)[UIImage imageNamed:@"nav_view_bg@2x.png"].CGImage;
        
        m_labelTitle = [[UILabel alloc] initWithFrame:self.bounds];
        [m_labelTitle setBackgroundColor:[UIColor clearColor]];
        [m_labelTitle setText:@"第一回 生物了发的是吃饭阿斯顿出风口"];
        [m_labelTitle setTextColor:[UIColor blackColor]];
        [m_labelTitle setFont:[UIFont systemFontOfSize:12]];
        [m_labelTitle setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:m_labelTitle];
        
        
        // Initialization code
    }
    return self;
}

-(void)dealloc
{
    [m_labelTitle release];
    m_labelTitle = nil;
    [super dealloc];
}




-(void)setTitleText:(NSString *)text
{
    [m_labelTitle setText:text];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
