//
//  UIImageView+AsynLoad.m
//  AsycImageExample
//
//  Created by xiangwei wang on 2017/07/03.
//  Copyright © 2017 xiangwei wang. All rights reserved.
//

#import "UIImageView+AsynLoad.h"
#import <ReactiveObjC/ReactiveObjC.h>

@implementation UIImageView (AsynLoad)

-(void) loadImage:(NSString *) imageURL forCell:(id)cell {
    if(![cell isKindOfClass:[UITableViewCell class]] && ![cell isKindOfClass:[UICollectionViewCell class]]) {
        NSAssert(NO, @"only UITableViewCell and UICollectionViewCell are supported");
        return;
    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:imageURL]];
    @weakify(self);
    [[[[NSURLConnection rac_sendAsynchronousRequest: request]
      takeUntil:[cell rac_prepareForReuseSignal]]
      deliverOnMainThread]
     subscribeNext:^(RACTwoTuple<NSURLResponse *,NSData *> * _Nullable tuple) {
         @strongify(self);
         NSData *imageData = [tuple second];
         self.image = [UIImage imageWithData:imageData];
     }];
}
@end
