//
//  JFViewController.h
//  readApp
//
//  Created by ran on 13-10-9.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFSetModel.h"
#import "JFChapterTitleView.h"
#import "JFToolView.h"
#import "JFUserSaveStoreInfo.h"
#import "JFChapterlistViewController.h"
#import "iToast.h"
#import "JFSetViewController.h"
@interface JFViewController : UIViewController<UITextViewDelegate,JFToolViewDelegate,JFChapterlistViewControllerdelegate,JFSetViewControllerDelegate>
{
    JFToolView          *m_toolView;
    JFChapterTitleView  *m_chapView;
    UITextView          *m_textView;
    NSMutableArray      *m_dataArray;
    
    BOOL                m_bIsShow;
    int                 m_index;
    int                 m_iPage;

}


@property(nonatomic,retain)JFSetModel   *setModel;
@property(nonatomic,retain)JFBookMarkModel *lastBookModel;
@end
