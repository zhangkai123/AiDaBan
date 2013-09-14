//
//  ADEditTopCell.h
//  AiDaBan
//
//  Created by zhang kai on 7/28/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADEditTopCell : UITableViewCell
{
    UIImageView *imageView;
    UILabel *topicLabel;
    UILabel *dateLabel;
}
@property(nonatomic,retain) UIImageView *imageView;
@property(nonatomic,retain) UILabel *topicLabel;
@property(nonatomic,retain) UILabel *dateLabel;
@end
