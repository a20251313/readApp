//
//  JFViewController.m
//  readApp
//
//  Created by ran on 13-10-9.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import "JFViewController.h"

@interface JFViewController ()

@end

@implementation JFViewController

@synthesize setModel;
-(void)dealloc
{
    self.setModel = nil;
    [super dealloc];
}

-(id)init
{
    self = [super init];
    if (self)
    {
        JFSetModel  *model = [[JFSetModel alloc] init];
        model.bgColor = [UIColor blackColor];
        model.textColor = [UIColor greenColor];
        model.textFont = [UIFont systemFontOfSize:17];
        self.setModel = model;
        [model release];
        
        m_bIsShow = NO;
    }
    return self;
}



- (void)viewDidLoad
{
    

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)loadView
{
    [super loadView];
    
    
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    CGRect frame = [UIScreen mainScreen].bounds;
    
    UITextView  *view = [[UITextView alloc] initWithFrame:frame];
    view.delegate = self;
    [view setBackgroundColor:self.setModel.bgColor];
    [view setTextColor:self.setModel.textColor];
    [view setFont:self.setModel.textFont];
    [view setText:@"Do any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsdDo any additional setup after loading the view, typically from a nib.\n一个人的时间啊市场上的scjsd"];
    [view setEditable:NO];
    [self.view addSubview:view];
    [view release];

 
    UITapGestureRecognizer  *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTextView:)];
    [view addGestureRecognizer:tap];
    [tap release];
    
    
    m_toolView = [[JFToolView alloc] initWithFrame:CGRectMake(20, frame.size.height-45, 220, 35)];
    [self.view addSubview:m_toolView];
    m_toolView.delegate = self;
    
    
    m_chapView = [[JFChapterTitleView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 35)];
    [self.view addSubview:m_chapView];

    [self setToolViewHide:YES isAnimating:NO];
}


-(void)setToolViewHide:(BOOL)bIsHide isAnimating:(BOOL)isAnimating
{
    
    CGFloat  fromalpha = 0;
    CGFloat  toAlpha = 1;
    
    if (bIsHide)
    {
        fromalpha = 1;
        toAlpha = 0;
        m_bIsShow = NO;
    }else
    {
        m_bIsShow = YES;
    }
    
    if (isAnimating)
    {
        
        m_toolView.alpha = toAlpha;
        m_chapView.alpha = toAlpha;
        
        CABasicAnimation  *ani = [CABasicAnimation animationWithKeyPath:@"alpha"];
        ani.fromValue = [NSNumber numberWithFloat:fromalpha];
        ani.toValue = [NSNumber numberWithFloat:toAlpha];
        ani.repeatCount = 1;
        ani.duration = 0.75;
        ani.autoreverses = NO;
        ani.removedOnCompletion = NO;
        ani.fillMode = kCAFillModeForwards;
        
       
        
        [m_toolView.layer addAnimation:ani forKey:@"asx"];
        [m_chapView.layer addAnimation:ani forKey:@"asf"];
        
        
        
        if (!bIsHide)
        {
            [self performSelector:@selector(perFormMethod) withObject:nil afterDelay:6];
        }
        
        
    }else
    {
        
        m_toolView.alpha = toAlpha;
        m_chapView.alpha = toAlpha;
    }
}


-(void)perFormMethod
{
    [self setToolViewHide:YES isAnimating:YES];
}


-(void)clickTextView:(id)Sender
{
    if (!m_bIsShow)
    {
       [self setToolViewHide:NO isAnimating:YES];
    }
   
    DLOG(@"clickTextView:%@",Sender);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark UIScrollView delegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView // called on finger up as we are moving
{
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView  // called when scroll view grinds to a halt
{
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
}// called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating


#pragma mark  


-(void)clickbtnViewToolType:(JFToolViewButtonType)type
{
    DLOG(@"clickbtnViewToolType:%d",type);
}
@end
