//
//  JFToolView.h
//  readApp
//
//  Created by ran on 13-10-9.
//  Copyright (c) 2013年 com.jingfu.ran. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef enum
{
    JFToolViewButtonTypeRewind = 1,
    JFToolViewButtonTypeFastForward,
    JFToolViewButtonTypeChapter,
    JFToolViewButtonTypeAdd,
    JFToolViewButtonTypeSetting,
    JFToolViewButtonTypeHelp
}JFToolViewButtonType;


@protocol JFToolViewDelegate <NSObject>

-(void)clickbtnViewToolType:(JFToolViewButtonType)type;
@end

@interface JFToolView : UIView
{
    id<JFToolViewDelegate> delegate;
}

@property(nonatomic,assign)id<JFToolViewDelegate> delegate;

@end
