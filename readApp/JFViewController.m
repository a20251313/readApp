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
@synthesize lastBookModel;
-(void)dealloc
{
    self.setModel = nil;
    
    self.lastBookModel = nil;
    
    [m_toolView release];
    m_toolView = nil;
    
    [m_chapView release];
    m_chapView = nil;
    
    [m_dataArray release];
    m_dataArray = nil;
    
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
        
        
        
        self.lastBookModel = [JFUserSaveStoreInfo getUserStoreLastreadBookMark];
        
        
        m_dataArray = [[NSMutableArray alloc] init];
        m_index = 0;
        NSString  *strFile = [[NSBundle mainBundle] pathForResource:@"ChapterList" ofType:@"plist"];
        //  NSDictionary    *dicInfo = [NSDictionary dictionaryWithContentsOfFile:strFile];
        
        
        
        NSArray *arrayChapter = [NSPropertyListSerialization propertyListWithData:[NSData dataWithContentsOfFile:strFile] options:NSPropertyListImmutable format:nil error:NULL];
        DLOG(@"dicInfo:%@",arrayChapter);
        [m_dataArray addObjectsFromArray:arrayChapter];
        
        
        
    
        m_bIsShow = NO;
    }
    return self;
}



- (void)viewDidLoad
{
    

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



-(void)loadWithIndex:(int)index
{
    
    m_index = index;
    NSString  *strFirst = [m_dataArray objectAtIndex:index];
    strFirst = [[NSBundle mainBundle] pathForResource:strFirst ofType:@"txt"];
    NSError *error = nil;
    NSString  *strContent = [NSString stringWithContentsOfFile:strFirst encoding:NSUTF8StringEncoding error:&error];
    
    if (!error)
    {
        [m_textView setText:strContent];
    }else
    {
        DLOG(@"loadWithIndex index:%d error:%@",index,error);
    }
    
}

-(void)loadWithBookMark:(JFBookMarkModel*)model
{
    
    
    NSString  *strFirst = [m_dataArray objectAtIndex:model.index];
   
    
    strFirst = [[NSBundle mainBundle] pathForResource:strFirst ofType:@"txt"];
    NSError *error = nil;
    NSString  *strContent = [NSString stringWithContentsOfFile:strFirst encoding:NSUTF8StringEncoding error:&error];
    
    
    NSRange  range = [strContent rangeOfString:model.content];
     m_index = model.index;
    if (!error)
    {
        [m_textView setText:strContent];
        [m_textView scrollRangeToVisible:range];
    }else
    {
        DLOG(@"loadWithIndex JFBookMarkModel:%@ error:%@",model,error);
    }
    
}
-(void)loadView
{
    [super loadView];
    

    
    
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    

    
    
    

    
    CGRect frame = [UIScreen mainScreen].bounds;
     m_textView = [[UITextView alloc] initWithFrame:frame];
    m_textView.delegate = self;
    [m_textView setBackgroundColor:self.setModel.bgColor];
    [m_textView setTextColor:self.setModel.textColor];
    [m_textView setFont:self.setModel.textFont];
    

    
    [m_textView setEditable:NO];
    [self.view addSubview:m_textView];
    [m_textView release];

    if (self.lastBookModel)
    {
        [self loadWithBookMark:self.lastBookModel];
    }else
    {
        [self loadWithIndex:m_index];
    }
    

 
    UITapGestureRecognizer  *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTextView:)];
    [m_textView addGestureRecognizer:tap];
    [tap release];
    
    
    m_toolView = [[JFToolView alloc] initWithFrame:CGRectMake(20, frame.size.height-40, 220, 35)];
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
        
        
        
        CABasicAnimation  *ani = [CABasicAnimation animationWithKeyPath:@"alpha"];
        ani.fromValue = [NSNumber numberWithFloat:fromalpha];
        ani.toValue = [NSNumber numberWithFloat:toAlpha];
        ani.repeatCount = 1;
        ani.duration = 0.25;
        ani.autoreverses = NO;
        ani.removedOnCompletion = NO;
        ani.fillMode = kCAFillModeForwards;
        ani.delegate = self;
       
        
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


-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag)
    {
        CABasicAnimation  *aniBasic = (CABasicAnimation*)anim;
        m_toolView.alpha = [aniBasic.toValue floatValue];
        m_chapView.alpha = [aniBasic.toValue floatValue];
        
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
    
    
    switch (type)
    {
        case JFToolViewButtonTypeChapter:
        {
            JFChapterlistViewController  *controller = [[JFChapterlistViewController alloc] initWithdatArray:m_dataArray];
            [self.navigationController pushViewController:controller animated:YES];
            [controller release];
            
        }
            break;
            
        default:
            break;
    }
    DLOG(@"clickbtnViewToolType:%d",type);
}
@end
