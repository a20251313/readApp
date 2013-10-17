//
//  JFHelpViewController.m
//  readApp
//
//  Created by ran on 13-10-14.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import "JFHelpViewController.h"

@interface JFHelpViewController ()

@end

@implementation JFHelpViewController

-(id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}


-(void)dealloc
{
    
    
    [m_scrollView release];
    m_scrollView = nil;
    
    [m_pageControl release];
    m_pageControl = nil;
    [super dealloc];
    
    
    
}
-(void)loadView
{
    [super loadView];
   
    
    CGRect  frame = [UIScreen mainScreen].bounds;
    CGFloat fwidth = 320;
    CGFloat fheight = 480;
    
    
    
    self.view.backgroundColor = [UIColor blackColor];//[UIColor colorWithRed:0.77 green:0.77 blue:0.77 alpha:1.0f];
    
    int  maxCount = 5;
    m_scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    m_scrollView.contentSize = CGSizeMake(frame.size.width*maxCount, frame.size.height);
    [self.view addSubview:m_scrollView];
    m_scrollView.delegate = self;
    m_scrollView.pagingEnabled = YES;
    
    m_pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, m_scrollView.frame.size.height-40, frame.size.width, 20)];
    m_pageControl.numberOfPages = maxCount;
    m_pageControl.currentPage = 0;
    [self.view addSubview:m_pageControl];
    
    
    
    for (int i = 0; i < 5; i++)
    {
        NSString  *strImageMame = [NSString stringWithFormat:@"help_%d.png",i+1];
        UIView   *bgView = [[UIView alloc] initWithFrame:CGRectMake(0+i*frame.size.width, 0, frame.size.width, frame.size.height)];
        
        //216*216
        [m_scrollView addSubview:bgView];
        UIImageView   *view = [[UIImageView alloc] initWithFrame:CGRectMake((bgView.frame.size.width-fwidth)/2, (bgView.frame.size.height-fheight)/2, fwidth, fheight)];
        view.userInteractionEnabled = YES;
        view.tag = i+1;
        view.image = [UIImage imageNamed:strImageMame];
        [bgView addSubview:view];
        
      /*  UITapGestureRecognizer  *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAppearenceView:)];
        [view addGestureRecognizer:tap];
        [tap release];
        [view release];
        [bgView release];*/
    }
    
    
     [self createAndAddNavView];
    
}

-(void)backButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView//;      // called when scroll view grinds to a halt
{
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    int page = scrollView.contentOffset.x/frame.size.width;
    m_pageControl.currentPage = page;
    
}


@end
