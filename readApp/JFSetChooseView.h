//
//  JFSetChooseView.h
//  readApp
//
//  Created by ran on 13-10-11.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFSetModel.h"
@protocol JFSetChooseViewDelegate <NSObject>

-(void)getSetBgColor:(UIColor *)bgColor textColor:(UIColor*)textColor textSize:(NSNumber*)numberSize;
@end


@interface JFSetChooseView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIPickerView    *m_pickView;
    NSMutableArray  *m_coclorArray;
    NSMutableArray  *m_numberArray;
    
    int             m_ibgIndex;
    int             m_itextColorIndex;
    int             m_itextSizeIndex;
    
    id<JFSetChooseViewDelegate>  delegate;
}

@property(nonatomic,assign)id<JFSetChooseViewDelegate> delegate;

-(void)selectAsDefaultSetInfo:(JFSetModel*)model;

@end
