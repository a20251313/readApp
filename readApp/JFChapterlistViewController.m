//
//  JFChapterlistViewController.m
//  readApp
//
//  Created by ran on 13-10-9.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import "JFChapterlistViewController.h"

@interface JFChapterlistViewController ()

@end

@implementation JFChapterlistViewController

-(id)initWithdatArray:(NSMutableArray *)dataArray
{
    self = [super init];
    if (self)
    {
        
        m_itype = JFlistTypechapter;
        
        m_dataArray  = [[NSMutableArray alloc] init];
        [m_dataArray addObjectsFromArray:dataArray];
        
        m_bookmarkArray = [[NSMutableArray alloc] init];
        [m_bookmarkArray addObjectsFromArray:[JFUserSaveStoreInfo getUserBookMarkForUUID:0]];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)loadView
{
    [super loadView];
    
    CGRect  frame = [UIScreen mainScreen].bounds;
    m_tableView = [[UITableView alloc] initWithFrame:frame];
    m_tableView.delegate = self;
    m_tableView.dataSource = self;
    [self.view addSubview:m_tableView];
    [m_tableView reloadData];
    
    
    [self createAndAddNavView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableviewdelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (m_itype == JFlistTypeBookMark)
    {
        return [m_bookmarkArray count];
    }
    
    return [m_dataArray count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JFListCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"11"];
    if (cell == nil)
    {
        cell = [[[JFListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"11"] autorelease];
    }
    
    
    if (m_itype == JFlistTypeBookMark)
    {
        id model = [m_bookmarkArray objectAtIndex:indexPath.row];
        [cell updateCellInfo:model];
    }else if(m_itype == JFlistTypechapter)
    {
        id model = [m_dataArray objectAtIndex:indexPath.row];
        [cell updateCellInfo:model];
        
    }
    
    return cell;
}


-(void)backButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



-(void)clickSegInfo:(UISegmentedControl*)info
{
    
    if (info.selectedSegmentIndex == 0)
    {
        m_itype = JFlistTypechapter;
    }else
    {
        m_itype = JFlistTypeBookMark;
    }
    [m_tableView reloadData];
    
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
    
    
    UISegmentedControl  *seg = [[UISegmentedControl alloc] initWithItems:[NSArray  arrayWithObjects:@"Chapter",@"BookMark",nil]];
    seg.segmentedControlStyle = UISegmentedControlStyleBordered;
    [seg setFrame:CGRectMake((frame.size.width-200)/2, (bgView.frame.size.height-30)/2, 200, 30)];
    [seg addTarget:self action:@selector(clickSegInfo:) forControlEvents:UIControlEventValueChanged];
    seg.selectedSegmentIndex = 0;
    [bgView addSubview:seg];
    seg.alpha = 0.8;
    [seg release];
    
    
    
    [bgView release];
    [button release];
}













@end
