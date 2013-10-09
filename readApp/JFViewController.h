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
@interface JFViewController : UIViewController<UITextViewDelegate,JFToolViewDelegate>
{
    JFToolView          *m_toolView;
    JFChapterTitleView  *m_chapView;
    
    
    BOOL                m_bIsShow;

}


@property(nonatomic,retain)JFSetModel   *setModel;
@end
