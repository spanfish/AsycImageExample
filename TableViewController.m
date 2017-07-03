//
//  TableViewController.m
//  AsycImageExample
//
//  Created by xiangwei wang on 2017/07/03.
//  Copyright © 2017 xiangwei wang. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"

@interface TableViewController () {
    NSArray *imageArray;
}
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    imageArray = @[@"https://c1.staticflickr.com/4/3636/3349287366_58b8ae084e_b.jpg",
                   @"https://c1.staticflickr.com/8/7326/9777863285_89e0525c75_k.jpg",
                   @"https://c1.staticflickr.com/4/3783/9777870334_061c4f5b8c_n.jpg",
                   @"https://c1.staticflickr.com/4/3753/9777879724_75dda3ff8e_n.jpg",
                   @"https://c1.staticflickr.com/8/7397/9777877154_3f9a1542e5_k.jpg",
                   @"https://c1.staticflickr.com/4/3731/9777664361_4fd3985ea3_n.jpg",
                   @"https://c1.staticflickr.com/4/3784/9777886266_b32224cc11_k.jpg",
                   @"https://c1.staticflickr.com/3/2835/9777961763_255fab4308_n.jpg",
                   @"https://c1.staticflickr.com/8/7434/9777885126_784b1be0c0_n.jpg",
                   @"https://c1.staticflickr.com/3/2772/4104949584_578d72d7e8_m.jpg",
                   @"https://c1.staticflickr.com/3/2938/34001728551_a95890a7e1_m.jpg",
                   @"https://c1.staticflickr.com/5/4106/5200156873_3409b5f311_m.jpg",
                   @"https://c1.staticflickr.com/4/3674/9403075431_edf2e56ce7_m.jpg",
                   @"https://c1.staticflickr.com/3/2821/9322630425_6b4c766230_m.jpg",
                   @"https://c1.staticflickr.com/4/3311/4586358666_56c22c37ef_b.jpg",
                   @"https://c1.staticflickr.com/1/162/375659499_0132c578c1_b.jpg",
                   @"https://c1.staticflickr.com/8/7284/9325409494_71e2a20111_m.jpg",
                   @"https://c1.staticflickr.com/3/2904/33374327523_04948ff094_m.jpg",
                   @"https://c1.staticflickr.com/3/2814/9325409858_54ea02e9d7_m.jpg",
                   @"https://c1.staticflickr.com/6/5609/15828199622_1f1d5cda5f_b.jpg",
                   @"https://c1.staticflickr.com/4/3030/2950529062_da3d58793b_n.jpg",
                   @"https://c1.staticflickr.com/3/2857/9403071745_4a5b13725f_b.jpg",
                   @"https://c1.staticflickr.com/6/5023/5554918737_fd26c01644_m.jpg",
                   @"https://c1.staticflickr.com/5/4051/4268429384_3efd5091c0_m.jpg",
                   @"https://c1.staticflickr.com/4/3158/2762941874_c3b59b98bb_m.jpg"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [imageArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    [cell.myImageView loadImage:[imageArray objectAtIndex:indexPath.row] forCell:cell];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
