//
//  JFToolView.m
//  readApp
//
//  Created by ran on 13-10-9.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import "JFToolView.h"

@implementation JFToolView
@synthesize delegate;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        UIToolbar   *toolBar = [[UIToolbar alloc] initWithFrame:self.bounds];
        UIBarButtonItem  *itemrewind = [[UIBarButtonItem alloc] initWithTitle:@"<" style:UIBarButtonItemStylePlain target:self action:@selector(rewindLastPage:)];
        UIBarButtonItem *itemFastForward = [[UIBarButtonItem alloc] initWithTitle:@">" style:UIBarButtonItemStylePlain target:self action:@selector(fastForward:)];
       // UIBarButtonItem  *itemChapter = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"chapters"] style:UIBarButtonItemStylePlain target:self action:@selector(Clickchaptertotal:)];
        
         UIBarButtonItem  *itemChapter = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(Clickchaptertotal:)];
        
        UIBarButtonItem *itemAdd = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(clickAddbookmark:)];
        
        UIBarButtonItem *itemSetting = [[UIBarButtonItem alloc] initWithTitle:@"Set" style:UIBarButtonItemStylePlain target:self action:@selector(clickSetting:)];
        
        UIBarButtonItem  *itemHelp = [[UIBarButtonItem alloc] initWithTitle:@"?" style:UIBarButtonItemStylePlain target:self action:@selector(clickHelp:)];
        
        UIBarButtonItem *itemSep = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:NULL];
        itemSep.width = 10;
        [toolBar setItems:[NSArray arrayWithObjects:itemrewind,itemSep,itemFastForward,itemSep,itemChapter,itemSep,itemAdd,itemSep,itemSetting,itemSep,itemHelp, nil]];
        [toolBar setBackgroundColor:[UIColor clearColor]];
        [self addSubview:toolBar];
     
        toolBar.translucent = YES;
     //   toolBar.barStyle = UIBarStyleBlack;
        
        toolBar.layer.masksToBounds = YES;
        toolBar.layer.cornerRadius = 8;
        
        [toolBar release];
        [itemrewind release];
        [itemFastForward release];
        [itemChapter release];
        [itemAdd release];
        [itemSetting release];
        [itemHelp release];
        [itemSep release];

        // Initialization code
    }
    return self;
}


-(void)callBackMethod:(JFToolViewButtonType)type
{
    if (delegate  && [delegate respondsToSelector:@selector(clickbtnViewToolType:)])
    {
        [delegate clickbtnViewToolType:type];
    }
    
}


-(void)rewindLastPage:(id)sender
{
    [self callBackMethod:JFToolViewButtonTypeRewind];
}
-(void)fastForward:(id)sender
{
    [self callBackMethod:JFToolViewButtonTypeFastForward];
}
-(void)Clickchaptertotal:(id)sender
{
    [self callBackMethod:JFToolViewButtonTypeChapter];
}
-(void)clickAddbookmark:(id)sender
{
    
    [self callBackMethod:JFToolViewButtonTypeAdd];
}
-(void)clickSetting:(id)sender
{
    [self callBackMethod:JFToolViewButtonTypeSetting];
}
-(void)clickHelp:(id)sender
{
    [self callBackMethod:JFToolViewButtonTypeHelp];
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
