//
//  ADEditTopCell.m
//  AiDaBan
//
//  Created by zhang kai on 7/28/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "ADEditTopCell.h"

@implementation ADEditTopCell
@synthesize imageView ,topicLabel, dateLabel;
-(void)dealloc
{
    [imageView release];
    [topicLabel release];
    [dateLabel release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
        [self addSubview:imageView];
        
        topicLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 26, 200, 40)];
        topicLabel.backgroundColor = [UIColor blueColor];
        topicLabel.text = @"教程名";
        [self addSubview:topicLabel];
        
        dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 66, 200, 20)];
        dateLabel.backgroundColor = [UIColor yellowColor];
        dateLabel.text = @"2013.07.27";
        [self addSubview:dateLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
