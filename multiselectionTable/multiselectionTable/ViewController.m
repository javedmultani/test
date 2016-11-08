//
//  ViewController.m
//  multiselectionTable
//
//  Created by Administrator on 29/07/16.
//  Copyright © 2016 Tenacious Techies. All rights reserved.
//

#import "ViewController.h"
#import "SimpleTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray *arrayData;
    NSMutableArray *selectedObjects;
}
@property (weak, nonatomic) IBOutlet UITableView *tableVIew;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableVIew.delegate=self;
    self.tableVIew.dataSource=self;
    selectedObjects=[NSMutableArray new];
   // @"Javed",@"Multani",@"iOS",@"iPhone",@"Developer",@"iPad","@iPod"
   arrayData = [NSArray arrayWithObjects: @"Jill Valentine", @"Peter Griffin", @"Meg Griffin", @"Jack Lolwut",
                        @"Mike Roflcoptor", @"Cindy Woods", @"Jessica Windmill", @"Alexander The Great",
                        @"Sarah Peterson", @"Scott Scottland", @"Geoff Fanta", @"Amanda Pope", @"Michael Meyers",
                        @"Richard Biggus", @"Montey Python", @"Mike Wut", @"Fake Person", @"Chair",
                        nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrayData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    SimpleTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"SimpleTableViewCell"];
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.labelName.text=[arrayData objectAtIndex:indexPath.row];
    if ([selectedObjects containsObject:[arrayData objectAtIndex:indexPath.row]]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [selectedObjects addObject:[arrayData objectAtIndex:indexPath.row]];
      NSLog(@"Arr Value : %@",selectedObjects);
    [tableView  cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [selectedObjects removeObject:[arrayData objectAtIndex:indexPath.row]];
      NSLog(@"Deselected index : %ld",(long)indexPath.row);
    [tableView  cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
    
}
- (IBAction)click:(id)sender {
    NSLog(@"Final Arr:%@",selectedObjects);
}

@end
