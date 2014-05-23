//
//  SMAddRssSoucesCell.m
//  RSSRead
//
//  Created by ftxbird on 14-5-23.
//  Copyright (c) 2014年 starming. All rights reserved.
//

#import "SMAddRssSoucesCell.h"
#import "SMAddRssSourceModel.h"
@implementation SMAddRssSoucesCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self addBtn];
    [self setupSeperateLine];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;

}

- (void)setupSeperateLine
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, self.contentView.height-1, self.contentView.width, 1)];
    view.backgroundColor = [UIColor colorFromRGB:0xeeeeee];
    [self.contentView addSubview:view];
}

- (void)addBtn
{
    [self.addButton setTitleColor:[UIColor colorFromRGB:0x333333] forState:UIControlStateNormal];
    [self.addButton setBackgroundColor:[UIColor colorFromRGB:0xeeeeee]];
    self.addButton.layer.cornerRadius = 4;
//    self.addButton.layer.masksToBounds = YES;
    
}

- (IBAction)btnClick:(UIButton *)btn
{
    if([self.delegate respondsToSelector:@selector(btnClickAddRssUsingTag:)]){
        [self.delegate performSelector:@selector(btnClickAddRssUsingTag:) withObject:btn];
    }
}

- (void)setSearchRss:(SMAddRssSourceModel *)searchRss
{
    //对标题做特殊处理 删除<b></b>
    NSString * str = searchRss.title;
    str =[str stringByReplacingOccurrencesOfString:@"<b>" withString:@" "];
    str =[str stringByReplacingOccurrencesOfString:@"</b>" withString:@" "];
   // searchRss.title
    searchRss.title = str;
    self.nameLabel.text = searchRss.title;
    
    self.urlLabel.text = searchRss.url;
    [self.urlLabel setTextColor:[UIColor colorFromRGB:0xcccccc]];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"search";
    SMAddRssSoucesCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SMAddRssSoucesCell class]) owner:nil options:nil] lastObject];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
}


@end
