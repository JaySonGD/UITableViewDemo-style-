

//
//  ViewController.m
//  UITableViewDemo
//
//  Created by czljcb on 16/3/28.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate , UITableViewDataSource>

@end

@implementation ViewController


#pragma mark **************************************************************************************************
#pragma mark life cylce





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, 100, 64);
    headerView.backgroundColor = [UIColor yellowColor];
    
    
    
        self.tableView.tableHeaderView = headerView;//;[UISwitch new];
    self.tableView.tableHeaderView.backgroundColor = [UIColor purpleColor];
    
    
    
        self.tableView.tableFooterView = [UISwitch new];
    
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.sectionFooterHeight = 100;
    self.tableView.sectionHeaderHeight = 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSLog(@"%zd", section);
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
    
    if (headerView==nil) {
        headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"headerView"];
    }
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [headerView addSubview:view];
    
    view.backgroundColor = [UIColor redColor];
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    NSLog(@"-----------------%zd", section);
    UITableViewHeaderFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"footerView"];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    if (footerView==nil) {
        footerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:@"footerView"];
    }
    [footerView addSubview:view];
    view.backgroundColor = [UIColor orangeColor];
    
    
    return footerView;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat sectionHeaderHeight = 40;
    
    NSLog(@"%f",scrollView.contentOffset.y);
    NSLog(@"---g--%f",scrollView.contentOffset.y);

    
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        
        NSLog(@"---f--%f",scrollView.contentInset.top);
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }
    else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        NSLog(@"---f--%f",scrollView.contentOffset.y);

        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zd ---%zd ",indexPath.section , indexPath.row];
    
    return cell;
}

@end
