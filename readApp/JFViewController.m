//
//  JFViewController.m
//  readApp
//
//  Created by ran on 13-10-9.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//



#define BOOKFILENAME    @"hongloumeng"
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
        
        m_iPage = 0;
        
        JFSetModel  *model = [JFUserSaveStoreInfo GetUserBsetModelForUUID:0];

        if (model == nil)
        {
            model =  [[JFSetModel alloc] init];
            model.bgColor = [UIColor blackColor];
            model.textColor = [UIColor greenColor];
            model.textFont = [UIFont systemFontOfSize:17];
            self.setModel = model;
            [model release];
            
        }else
        {
            self.setModel = model;
        }
        self.lastBookModel = [JFUserSaveStoreInfo getUserStoreLastreadBookMark];
        
        
        m_dataArray = [[NSMutableArray alloc] init];
        m_index = 0;
        NSString  *strFile = [[NSBundle mainBundle] pathForResource:BOOKFILENAME ofType:@"plist"];
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
    
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
	// Do any additional setup after loading the view, typically from a nib.
}



-(void)loadWithIndex:(int)index
{
    
    
    [m_textView setContentOffset:CGPointZero];
    
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
    
    [m_chapView setTitleText:[m_dataArray objectAtIndex:index]];
    
    
    
}

-(void)loadWithBookMark:(JFBookMarkModel*)model
{
    
    
    

  //  return;
    NSString  *strFirst = [m_dataArray objectAtIndex:model.index];
   
    
    strFirst = [[NSBundle mainBundle] pathForResource:strFirst ofType:@"txt"];
    NSError *error = nil;
    NSString  *strContent = [NSString stringWithContentsOfFile:strFirst encoding:NSUTF8StringEncoding error:&error];
    
    
   // NSRange  range = [strContent rangeOfString:model.content];
     m_index = model.index;
    m_iPage = model.page;
    if (!error)
    {
        [m_textView setText:strContent];
        [m_textView scrollRectToVisible:CGRectMake(0, m_iPage*m_textView.frame.size.height, m_textView.frame.size.width, m_textView.frame.size.height) animated:YES];
       // [m_textView scrollRangeToVisible:range];
    }else
    {
        DLOG(@"loadWithIndex JFBookMarkModel:%@ error:%@",model,error);
    }
    
    [m_chapView setTitleText:model.chaptitle];
    
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
    [m_textView setPagingEnabled:NO];

    

    
    [m_textView setEditable:NO];
    [self.view addSubview:m_textView];
    [m_textView release];


    UITapGestureRecognizer  *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTextView:)];
    [m_textView addGestureRecognizer:tap];
    [tap release];
    
    
    m_toolView = [[JFToolView alloc] initWithFrame:CGRectMake(20, frame.size.height-40, 220, 35)];
    [self.view addSubview:m_toolView];
    m_toolView.delegate = self;
    
    
    m_chapView = [[JFChapterTitleView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 35)];
    [self.view addSubview:m_chapView];
    
    
    
    if (self.lastBookModel)
    {
        [self loadWithBookMark:self.lastBookModel];
    }else
    {
        [self loadWithIndex:m_index];
    }
    

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
        

        
        CABasicAnimation  *ani = [CABasicAnimation animationWithKeyPath:@"opacity"];
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
    
    int totalPage = scrollView.contentSize.height/scrollView.frame.size.height;;
    
    int page = scrollView.contentOffset.y/scrollView.frame.size.height;
    m_iPage = page;
    
    if (m_iPage == totalPage-1)
    {
        if (m_index+1 < [m_dataArray count])
        {
            m_index++;
        }else
        {
            m_index = 0;
        }
        [self showAniFromLeft:NO];
        [self loadWithIndex:m_index];
    }
   // DLOG(@"scrollView:%@",scrollView);
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
}// called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating


#pragma mark  JFToolViewDelegate


-(void)clickbtnViewToolType:(JFToolViewButtonType)type
{
    
    
    switch (type)
    {
        case JFToolViewButtonTypeChapter:
        {
            JFChapterlistViewController  *controller = [[JFChapterlistViewController alloc] initWithdatArray:m_dataArray];
            controller.delegate = self;
            [self.navigationController pushViewController:controller animated:YES];
            [controller release];
            
        }
            break;
        case JFToolViewButtonTypeFastForward:
        {
            [self showAniFromLeft:NO];
            if (m_index+1 < [m_dataArray count])
            {
                m_index++;
            }else
            {
                m_index = 0;
            }
            
            [self loadWithIndex:m_index];
            
        }
            break;
        case JFToolViewButtonTypeRewind:
        {
            [self showAniFromLeft:YES];
            if (m_index-1 >= 0)
            {
                m_index--;
            }else
            {
                m_index = [m_dataArray count]-1;
            }
            
            [self loadWithIndex:m_index];
            
        }
            break;
        case JFToolViewButtonTypeAdd:
        {
            JFBookMarkModel  *model = [[JFBookMarkModel alloc] init];
            model.index = m_index;
            model.chaptitle = [m_dataArray objectAtIndex:m_index];
            model.content = model.chaptitle;
            model.page = m_iPage;
            model.time = [NSDate date];
            
            if ([JFUserSaveStoreInfo storeUserBookMarkForUUID:0 bookMark:model])
            {
                iToast  *toast = [[iToast alloc] initWithText:@"添加书签成功"];
                [toast show];
                [toast release];
                
            }else
            {
                iToast  *toast = [[iToast alloc] initWithText:@"添加书签失败"];
                [toast show];
                [toast release];
                
            }
            
            [model release];
           // NSString  *strContent = [m_textView ];
            
        }
            break;
        case JFToolViewButtonTypeSetting:
        {
            JFSetViewController  *controller = [[JFSetViewController alloc] initWithOldsetInfo:self.setModel];
            controller.delegate = self;
            [self.navigationController pushViewController:controller animated:YES];
            [controller release];
            
        }
            break;
        case JFToolViewButtonTypeHelp:
        {
            JFHelpViewController  *controller = [[JFHelpViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
            [controller release];
        }
        default:
            break;
    }
    DLOG(@"clickbtnViewToolType:%d",type);
}


-(void)showAniFromLeft:(BOOL)isLeft
{
    CATransition *animation = [CATransition animation];
    animation.duration = 0.75f;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.fillMode = kCAFillModeForwards;
    animation.type = kCATransitionMoveIn;
    
    if (isLeft)
    {
        
         animation.subtype = kCATransitionFromBottom;
        
    }else
    {
         animation.subtype = kCATransitionFromTop;
    }
   
    
    [m_textView.layer addAnimation:animation forKey:@"nil"];
}


#pragma mark JFChapterlistViewControllerdelegate

-(void)selectIndexOrBookMark:(id)model
{
    if ([model isKindOfClass:[JFBookMarkModel class]])
    {
        [self loadWithBookMark:model];
    }else
    {
        [self loadWithIndex:[model intValue]];
    }
}

#pragma mark JFSetViewControllerdeletgate
-(void)getInsuresetInfo:(JFSetModel*)model
{
    if (![model isEqual:self.setModel])
    {
        
        self.setModel = model;
        m_textView.backgroundColor = model.bgColor;
        m_textView.textColor = model.textColor;
        m_textView.font = model.textFont;
        [JFUserSaveStoreInfo storeUserBsetModelForUUID:0 setModel:model];
    }
}
@end
