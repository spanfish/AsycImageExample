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
    self.image = nil;
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [cachePath stringByAppendingPathComponent:[imageURL lastPathComponent]];
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        self.image = [UIImage imageWithContentsOfFile:filePath];
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
         dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
             NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
             [imageData writeToFile:[cachePath stringByAppendingPathComponent:[imageURL lastPathComponent]] atomically:YES];
         });
     }];
}
@end
