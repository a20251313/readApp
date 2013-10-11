//
//  JFSetViewController.m
//  readApp
//
//  Created by ran on 13-10-11.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import "JFSetViewController.h"

@interface JFSetViewController ()

@end

@implementation JFSetViewController
@synthesize delegate;
-(id)initWithOldsetInfo:(JFSetModel*)model
{
    self = [super init];
    if (self)
    {
        m_setModel = [model copy];
        
        
    }
    return self;
}


-(void)dealloc
{
    [m_textview release];
    m_textview = nil;
    
    [m_chooseView release];
    m_chooseView = nil;
    
    [super dealloc];
}
-(void)loadView
{
    [super loadView];
    
    
    [self createAndAddNavView];
    
    
    CGRect  frame = [UIScreen mainScreen].bounds;
    
    m_textview = [[UITextView alloc] initWithFrame:CGRectMake(0, 44, frame.size.width, 120)];
    m_textview.backgroundColor = [UIColor clearColor];
    m_textview.textColor = m_setModel.textColor;
    m_textview.font = m_setModel.textFont;
    [self.view addSubview:m_textview];
    [m_textview setText:@"Sample:This is a sample which you choose\n示例:这是一个显示你的选择示例!"];
    
    
    m_chooseView = [[JFSetChooseView alloc] initWithFrame:CGRectMake(0, frame.size.height-210, frame.size.width, 210)];
    m_chooseView.delegate = self;
    [m_chooseView selectAsDefaultSetInfo:m_setModel];
    [self.view addSubview:m_chooseView];
    
    
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)createAndAddNavView
{
    
    CGRect  frame = [UIScreen mainScreen].bounds;
    UIView  *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 44)];
    bgView.layer.contents =(id) [UIImage imageNamed:@"nav_bg@2x.png"].CGImage;
    [self.view addSubview:bgView];
    
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, (bgView.frame.size.height-30)/2, 40, 30)];
    [button setExclusiveTouch:YES];
    [button setImage: [UIImage imageNamed:@"navigation_arrows.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage: [UIImage imageNamed:@"navigation_button.png"] forState:UIControlStateNormal];
    button.alpha = 0.8;
    [button setShowsTouchWhenHighlighted:YES];
    [bgView addSubview:button];
    
    

    
    
    
    [bgView release];
    [button release];
}


-(void)backButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 
-(void)getSetBgColor:(UIColor *)bgColor textColor:(UIColor*)textColor textSize:(NSNumber*)numberSize
{
    self.view.backgroundColor = bgColor;
    m_textview.textColor = textColor;
    m_textview.font = [UIFont systemFontOfSize:[numberSize floatValue]];
    
    JFSetModel  *model = [[JFSetModel alloc] init];
    model.bgColor = bgColor;
    model.textColor = textColor;
    model.textFont = [UIFont systemFontOfSize:[numberSize floatValue]];
    if (delegate  && [delegate respondsToSelector:@selector(getInsuresetInfo:)])
    {
        [delegate getInsuresetInfo:model];
    }
    [model release];
    
}
@end
