//
//  TableViewCell.h
//  AsycImageExample
//
//  Created by xiangwei wang on 2017/07/03.
//  Copyright © 2017 xiangwei wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+AsynLoad.h"

@interface TableViewCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UIImageView *myImageView;
@end
