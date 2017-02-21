//
//  FriendsController.m
//  im
//
//  Created by 历成栋 on 2017/2/18.
//  Copyright © 2017年 cavan. All rights reserved.
//

#import "FriendsController.h"
#import "FriendsTableViewCell.h"
#import <EMSDK.h>
@interface FriendsController ()<EMChatManagerDelegate, EMContactManagerDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) NSMutableArray *buddyList;
@property (weak,nonatomic) UITableView *friendTableView ;
@end

@implementation FriendsController

- (void)viewDidLoad {
    [super viewDidLoad];
    ViewBackWhiteColor
    [[EMClient sharedClient].chatManager addDelegate:self delegateQueue:nil];

    [self s_setupViews];
    [self getFriendsAndGroupList];

    // Do any additional setup after loading the view.
}
-(void)getFriendsAndGroupList{
    NSArray *contactsSource = [[EMClient sharedClient].contactManager getContacts];
    self.buddyList = [NSMutableArray arrayWithArray:contactsSource];
    
    NSString *loginUsername = [[EMClient sharedClient] currentUsername];
    if (loginUsername && loginUsername.length > 0) {
        [self.buddyList addObject:loginUsername];
    }
    
    __weak typeof(self) weakself = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        EMError *error = nil;
        NSArray *contactsSource = [[EMClient sharedClient].contactManager getContactsFromServerWithError:&error];
        if (!error)
        {
            [[EMClient sharedClient].contactManager getBlackListFromServerWithError:&error];
            if (!error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakself.buddyList removeAllObjects];
                    
                    for (NSInteger i = 0; i < contactsSource.count; i++) {
                        NSString *username = [contactsSource objectAtIndex:i];
                        [weakself.buddyList addObject:username];
                    }
                    
                    NSString *loginUsername = [[EMClient sharedClient] currentUsername];
                    if (loginUsername && loginUsername.length > 0) {
                        
                        [weakself.buddyList addObject:loginUsername];
                    }
                    NSLog(@"%@",weakself.buddyList);
                    [weakself.friendTableView reloadData];
                });
            }
        }
    });
}

-(void)s_setupViews{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.friendTableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return _buddyList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FriendsTableViewCell *cell = [FriendsTableViewCell cellWithTableView:self.friendTableView];
    cell.nickName.text = _buddyList[indexPath.row];
    cell.headImageName.image = [UIImage imageNamed:@"background"];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 80;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.friendTableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
StatusBar
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
