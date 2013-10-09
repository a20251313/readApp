//
//  JFListCell.m
//  readApp
//
//  Created by ran on 13-10-9.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import "JFListCell.h"

@implementation JFListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    CGRect frame = [UIScreen mainScreen].bounds;
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        m_labelAbove = [[UILabel alloc] initWithFrame:CGRectMake(2, 0, frame.size.width, 20)];
        m_labelAbove.backgroundColor = [UIColor clearColor];
        m_labelAbove.textColor = [UIColor blackColor];
        m_labelAbove.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:m_labelAbove];
        
        
        m_labelBelow = [[UILabel alloc] initWithFrame:CGRectMake(2, 0, frame.size.width, 20)];
        m_labelBelow.backgroundColor = [UIColor clearColor];
        m_labelBelow.textColor = [UIColor lightTextColor];
        m_labelBelow.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:m_labelBelow];
        
        
        
        
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)dealloc
{
    [m_labelBelow release];
    m_labelBelow = nil;
    [m_labelAbove release];
    m_labelAbove = nil;
    [super dealloc];
}

@end
