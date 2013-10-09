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
    return [m_dataArray count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"11"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"11"];
        
    }
    return cell;
}



















@end
