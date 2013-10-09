//
//  JFChapterlistViewController.h
//  readApp
//
//  Created by ran on 13-10-9.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFUserSaveStoreInfo.h"
#import "JFListCell.h"

@interface JFChapterlistViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray      *m_dataArray;
    NSMutableArray      *m_bookmarkArray;
    UITableView         *m_tableView;
    JFlistType          m_itype;
}


-(id)initWithdatArray:(NSMutableArray *)dataArray;
@end
