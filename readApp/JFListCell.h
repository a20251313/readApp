//
//  JFListCell.h
//  readApp
//
//  Created by ran on 13-10-9.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFBookMarkModel.h"
typedef enum
{
    JFlistTypechapter,
    JFlistTypeBookMark
    
}JFlistType;


@interface JFListCell : UITableViewCell
{
    UILabel     *m_labelAbove;
    UILabel     *m_labelBelow;
    
}

@property(nonatomic,retain)id  dataModel;


-(void)updateCellInfo:(id)model;

@end
