//
//  JFSetViewController.h
//  readApp
//
//  Created by ran on 13-10-11.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFSetChooseView.h"
#import "JFSetModel.h"

@protocol JFSetViewControllerDelegate <NSObject>

-(void)getInsuresetInfo:(JFSetModel*)model;

@end


@interface JFSetViewController : UIViewController<JFSetChooseViewDelegate>
{
    UITextView      *m_textview;
    JFSetModel      *m_setModel;
    JFSetChooseView *m_chooseView;
    
    id<JFSetViewControllerDelegate>  delegate;
}
@property(nonatomic,assign)id<JFSetViewControllerDelegate> delegate;

-(id)initWithOldsetInfo:(JFSetModel*)model;
@end
