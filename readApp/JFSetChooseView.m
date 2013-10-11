//
//  JFSetChooseView.m
//  readApp
//
//  Created by ran on 13-10-11.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import "JFSetChooseView.h"

@implementation JFSetChooseView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        m_pickView = [[UIPickerView alloc] initWithFrame:self.bounds];
        m_pickView.delegate = self;
        [self addSubview:m_pickView];
        
        m_ibgIndex = 0;
        m_itextColorIndex = 0;
        m_itextSizeIndex = 0;
        
        m_coclorArray = [[NSMutableArray alloc] initWithObjects:[UIColor whiteColor],[UIColor blackColor],[UIColor darkGrayColor],[UIColor lightGrayColor],[UIColor grayColor],[UIColor redColor],[UIColor greenColor],[UIColor blueColor],[UIColor cyanColor],[UIColor yellowColor],[UIColor magentaColor],[UIColor orangeColor],[UIColor purpleColor],[UIColor brownColor],[UIColor clearColor],[UIColor lightTextColor],[UIColor darkTextColor],nil];
        
        m_numberArray = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 26; i++)
        {
            [m_numberArray addObject:[NSNumber numberWithInt:i+10]];
        }
        
        [self creatAndAddCenterView];
        // Initialization code
    }
    return self;
}



-(BOOL)isSameColor:(UIColor *)colorA colorB:(UIColor*)colorB
{
    
    CGFloat  fredA = 0;
    CGFloat  fredB = 0;
    CGFloat  fblueA = 0;
    CGFloat  fblueB = 0;
    CGFloat  fgreenA = 0;
    CGFloat  fgreenB = 0;
    CGFloat  falphaA= 0;
    CGFloat  falphaB= 0;
    [colorA getRed:&fredA green:&fgreenA blue:&fblueA alpha:&falphaA];
    [colorB getRed:&fredB green:&fgreenB blue:&fblueB alpha:&falphaB];

    return (fredA == fredB) && (fblueA == fblueB) && (fgreenA == fgreenB) && (falphaA == falphaB);
}

-(void)selectAsDefaultSetInfo:(JFSetModel*)model
{
    [m_pickView reloadAllComponents];
    int count = 0;
    for (UIColor  *color in m_coclorArray)
    {
        if ([self isSameColor:color colorB:model.bgColor])
        {
            int index = [m_coclorArray indexOfObject:color];
            [m_pickView selectRow:index inComponent:0 animated:NO];
            count++;
            if (count == 2)
            {
                break;
            }
        }
        if ([self isSameColor:color colorB:model.textColor])
        {
            int index = [m_coclorArray indexOfObject:color];
            [m_pickView selectRow:index inComponent:1 animated:NO];
            count++;
            if (count == 2)
            {
                break;
            }
        }
    }
    
    
    for (NSNumber  *number in m_numberArray)
    {
        if ([number intValue] == model.textFont.pointSize)
        {
            int index = [m_numberArray indexOfObject:number];
            [m_pickView selectRow:index inComponent:2 animated:NO];
            break;
        }
    }
}



-(void)dealloc
{
    
    [m_pickView release];
    m_pickView = nil;
    
    [m_numberArray release];
    m_numberArray = nil;
    
    
    [m_coclorArray release];
    m_coclorArray = nil;
    [super dealloc];
}




// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 1 || component == 0)
    {
        return [m_coclorArray count];
    }
    
    return [m_numberArray count];
}

// returns width of column and height of row for each component.
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    
    if (component == 1 || component == 0)
    {
        return 120;
    }
    
    return 60;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIView  *bgView = nil;
    CGFloat   fheight = 40;
    if (component == 1 || component == 0)
    {
        if (view && view.tag == 100)
        {
            UIView  *colorView = [view viewWithTag:123];
            [colorView setBackgroundColor:[m_coclorArray objectAtIndex:row]];
            bgView = view;
        }else
        {
            bgView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, fheight)] autorelease];
            bgView.backgroundColor = [UIColor whiteColor];
            bgView.tag = 1;
            
            UIView   *colorView = [[UIView alloc] initWithFrame:CGRectMake(10, 5, 100, fheight-10)];
            [colorView setBackgroundColor:[m_coclorArray objectAtIndex:row]];
            colorView.tag = 123;
            [bgView addSubview:colorView];
            [colorView release];
            
        }
    }else if (component == 2)
    {
        
        if (view && view.tag == 101)
        {
            UILabel  *labelSize = (UILabel*)[view viewWithTag:123];
            [labelSize setText:[NSString stringWithFormat:@"%d",[[m_numberArray objectAtIndex:row] intValue]]];
            bgView = view;
        }else
        {
            bgView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, fheight)] autorelease];
            bgView.backgroundColor = [UIColor whiteColor];
            bgView.tag = 1;
            
            UILabel   *labelSize = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 40, fheight-10)];
            [labelSize setTextAlignment:NSTextAlignmentCenter];
            [labelSize setBackgroundColor:[UIColor clearColor]];
            [labelSize setFont:[UIFont systemFontOfSize:15]];
            [labelSize setTextColor:[UIColor blackColor]];
            [labelSize setText:[NSString stringWithFormat:@"%d",[[m_numberArray objectAtIndex:row] intValue]]];
            labelSize.tag = 123;
            [bgView addSubview:labelSize];
            [labelSize release];
            
        }
        
    }
    
    bgView.backgroundColor = [UIColor clearColor];
    
    return bgView;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    

    
    dispatch_async(dispatch_get_main_queue(),^
                   {
                       @autoreleasepool
                       {
                           m_ibgIndex = [m_pickView selectedRowInComponent:0];
                           m_itextColorIndex = [m_pickView selectedRowInComponent:1];
                           m_itextSizeIndex = [m_pickView selectedRowInComponent:2];
                           
                           if (delegate  && [delegate respondsToSelector:@selector(getSetBgColor:textColor:textSize:)])
                           {
                               
                               [delegate getSetBgColor:[m_coclorArray objectAtIndex:m_ibgIndex] textColor:[m_coclorArray objectAtIndex:m_itextColorIndex] textSize:[m_numberArray objectAtIndex:m_itextSizeIndex]];
                               
                           }
                       }
                   }
                   );
    
    
   
    
    DLOG(@"m_ibgIndex: %d m_itextColorIndex:%d  m_itextSizeIndex:%d",m_ibgIndex,m_itextColorIndex,m_itextSizeIndex);
    
}

-(void)creatAndAddCenterView
{

    
    CGRect  frame = self.bounds;
    UIView  *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, (frame.size.height-40)/2-15, frame.size.width, 40)];
    bgView.layer.contents =(id) [UIImage imageNamed:@"nav_bg@2x.png"].CGImage;
    [self addSubview:bgView];

    UILabel  *labelOne = [[UILabel alloc] initWithFrame:CGRectMake(0, 1, 140, 15)];
    labelOne.backgroundColor = [UIColor clearColor];
    labelOne.textColor = [UIColor blackColor];
    labelOne.text = @"Background";
    labelOne.textAlignment = NSTextAlignmentCenter;
    labelOne.font = [UIFont systemFontOfSize:11];
    [bgView addSubview:labelOne];
    [labelOne release];
    
    
    UILabel  *labelTwo = [[UILabel alloc] initWithFrame:CGRectMake(120, 1, 140, 15)];
    labelTwo.backgroundColor = [UIColor clearColor];
    labelTwo.textColor = [UIColor blackColor];
    labelTwo.text = @"Text Color";
    labelTwo.textAlignment = NSTextAlignmentCenter;
    labelTwo.font = [UIFont systemFontOfSize:11];
    [bgView addSubview:labelTwo];
    [labelTwo release];
    
    UILabel  *labelThree = [[UILabel alloc] initWithFrame:CGRectMake(260, 1, 60, 15)];
    labelThree.backgroundColor = [UIColor clearColor];
    labelThree.textColor = [UIColor blackColor];
    labelThree.text = @"Text Size";
    labelThree.textAlignment = NSTextAlignmentCenter;
    labelThree.font = [UIFont systemFontOfSize:11];
    [bgView addSubview:labelThree];
    [labelThree release];
    
    
    
    
    [bgView release];
    
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
