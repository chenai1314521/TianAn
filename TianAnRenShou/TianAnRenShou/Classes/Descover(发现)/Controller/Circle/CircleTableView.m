////
////  CircleTableView.m
////  TianAn
////
////  Created by han on 15/3/27.
////  Copyright (c) 2015年 changweitu@app660.com. All rights reserved.
////
//
#import "CircleTableView.h"
//#import "Twitter.h"
//#import "TwitterFrame.h"
//#import "TwitterCell.h"
//#import "Twitter+TwitterRequest.h"
//#import "CircleTitleView.h"
//#import "UserIconView.h"
//#import "MJRefresh.h"
//#import "CircleTableView.h"
//
//
////tableView 的 titleView的高度
//#define TITLEVIEWH (SCREEN_HEIGHT * 0.5)
//
//@interface CircleTableView () <UIActionSheetDelegate>
//
//@end
//
@implementation CircleTableView
//
//- (void)viewDidLoad {
//    
//    [super viewDidLoad];
//    
//    
//
//    [self loadCirleTitleView];
//    [self setUserIcon];
//    
//    
//    
//    
//    
//    
//    //取消选中状态
//    self.tableView.allowsSelection = NO;
//    self.tableView.backgroundColor = setColor(234, 234, 241, 1);
////    [self reloadFetchedResults:nil];
//    //加载数据
//    [self fetchTwitter];
//    
//
//    
//    
//    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//        self.automaticallyAdjustsScrollViewInsets = YES;
//        self.extendedLayoutIncludesOpaqueBars = YES;
//    }
//    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    
//    
//    [self setupRefresh];
//    
//
//}
///**
// *  集成刷新控件
// */
//- (void)setupRefresh
//{
//    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
//    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
//#warning 自动刷新(一进入程序就下拉刷新)
//    [self.tableView headerBeginRefreshing];
//    
//    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
//    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
//    
//    // 设置文字(也可以不设置,默认的文字在MJRefreshConst中修改)
//    self.tableView.headerPullToRefreshText = @"下拉可以刷新了";
//    self.tableView.headerReleaseToRefreshText = @"松开马上刷新了";
//    self.tableView.headerRefreshingText = @"MJ哥正在帮你刷新中,不客气";
//    
//    self.tableView.footerPullToRefreshText = @"上拉可以加载更多数据了";
//    self.tableView.footerReleaseToRefreshText = @"松开马上加载更多数据了";
//    self.tableView.footerRefreshingText = @"MJ哥正在帮你加载中,不客气";
//}
//#pragma mark 开始进入刷新状态
//- (void)headerRereshing
//{
//    // 1.添加假数据
//    for (int i = 0; i<5; i++) {
//        //[self.fakeData insertObject:MJRandomData atIndex:0];
//    }
//    
//    // 2.2秒后刷新表格UI
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        // 刷新表格
//        [self.tableView reloadData];
//        
//        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
//        [self.tableView headerEndRefreshing];
//    });
//}
//
//- (void)footerRereshing
//{
//    // 1.添加假数据
//    for (int i = 0; i<5; i++) {
//        //  [self.fakeData addObject:MJRandomData];
//    }
//    
//    // 2.2秒后刷新表格UI
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        // 刷新表格
//        [self.tableView reloadData];
//        
//        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
//        [self.tableView footerEndRefreshing];
//    });
//}
//
//
//
//
////设置用户头像
//
//- (void)setUserIcon
//{
//#warning  设置头像图片
//    UserIconView *icon = [[UserIconView alloc] init];
//    [icon setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"tuxiang"]];
//
//    CGFloat iconH = 65;
//    CGFloat iconW = 65;
//    CGFloat iconX = (SCREEN_WIDTH - PADDING) - iconW;
//    CGFloat iconY = self.tableView.tableHeaderView.height - iconH * 1.3;
//    icon.frame = CGRectMake(iconX, iconY, iconW, iconH);
//    [self.tableView.tableHeaderView addSubview:icon];
//}
////设置HeaderView
//- (void)loadCirleTitleView
//{
//#warning 设置展位图片和url
//    UIImage *placeholderImage = [UIImage imageNamed:@"我的圈子_02"];
//
//    
//    CGRect titleViewRect = CGRectMake(0, -40, SCREEN_WIDTH, TITLEVIEWH);
//    CircleTitleView *titleView = [[CircleTitleView alloc] initWithFrame:titleViewRect];
//    [titleView setImageWithURL:[NSURL URLWithString:@""] placeholderImage:placeholderImage];
//    
////    CGRect bgViewRect = CGRectMake(0, -40, SCREEN_WIDTH, TITLEVIEWH);
//    UIView *bgView = [[UIView alloc] initWithFrame:titleViewRect];
//    [bgView addSubview:titleView];
//
//    self.tableView.tableHeaderView = bgView;
//    
//    
//}
//
//- (void)reloadFetchedResults:(NSNotification*)note {
//    
//    NSError *error = nil;
//    if (![[self fetchedResultsController] performFetch:&error]) {
//        /*
//         Replace this implementation with code to handle the error appropriately.
//         
//         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
//         */
//                NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//        abort();
//    }
//    
//    if (note) {
//        [self.tableView reloadData];
//    }
//}
//- (void)fetchTwitter
//{
//    [Twitter fetchTwitters:^(NSArray *objects, NSError *error)
//    {
//        NSLog(@"twitter:%@",objects);
//        if (objects.count > 0)
//        {
////            id firstItem = objects[0];
////            id lastItem = [objects lastObject];
////            
////            NSMutableArray *workingArray = [objects mutableCopy];
////            
////            // Add the copy of the last item to the beginning
////            [workingArray insertObject:lastItem atIndex:0];
////            
////            // Add the copy of the first item to the end
////            [workingArray addObject:firstItem];
////            
////            // Update the collection view's data source property
////            self.ads = [NSArray arrayWithArray:workingArray];
////            [self.collectionView reloadData];
////            [self addTimer];
//            
//
//        }
//    } indexPath:nil];
//}
//- (NSFetchedResultsController *)fetchedResultsController {
//    // Set up the fetched results controller if needed.
//    if (_fetchedResultsController == nil) {
//        self.fetchedResultsController = [Twitter MR_fetchAllSortedBy:@"content" ascending:YES withPredicate:nil groupBy:nil delegate:self];
//    }
//    
//    return _fetchedResultsController;
//}
//
//#pragma mark - Table view data source
//
//
//#pragma mark -
//#pragma mark Table view methods
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    Twitter *twitter = (Twitter *)[self.fetchedResultsController objectAtIndexPath:indexPath];
//    TwitterFrame *TF = [[TwitterFrame alloc] init];
//    TF.twitter = twitter;
//    return TF.cellHeight;
//}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    
//    NSInteger count = [[self.fetchedResultsController sections] count];
//    
//    return count;
//}
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSInteger numberOfRows = 0;
//    
//    if ([[self.fetchedResultsController sections] count] > 0) {
//        id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
//        numberOfRows = [sectionInfo numberOfObjects];
//    }
//    
//    return numberOfRows;
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    // Dequeue or if necessary create a RecipeTableViewCell, then set its recipe to the recipe for the current row.
//    static NSString *RecipeCellIdentifier = @"RecipeCellIdentifier";
//    
//    TwitterCell *recipeCell = [tableView dequeueReusableCellWithIdentifier:RecipeCellIdentifier];
//    if (recipeCell == nil) {
//        recipeCell = [[TwitterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:RecipeCellIdentifier];
//       // recipeCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    }
//    recipeCell.backgroundColor = setColor(234, 234, 241, 1);
//    
//    [self configureCell:recipeCell atIndexPath:indexPath];
//    
//    return recipeCell;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //取消选择
////    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
//    TwitterFrame *TF = [[TwitterFrame alloc] init];
//    
//    TF.twitter = (Twitter *)[self.fetchedResultsController objectAtIndexPath:indexPath];
//    
//}
//
//- (void)configureCell:(TwitterCell *)cell atIndexPath:(NSIndexPath *)indexPath {
//    // Configure the cell
//    Twitter *twitter = (Twitter *)[self.fetchedResultsController objectAtIndexPath:indexPath];
//    TwitterFrame *TF = [[TwitterFrame alloc] init];
//    TF.twitter = twitter;
//    cell.twitterFrame = TF;
//    cell.commentBlock = ^(UIButton *btn)
//    {
//#warning 实现写代理方法
//        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"title,nil时不显示" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"评论",@"赞", @"分享",nil];
//        [actionSheet showInView:self.tableView];
//    };
//}
//
///*
// /**
// Delegate methods of NSFetchedResultsController to respond to additions, removals and so on.
// */
//
//- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
//    // The fetch controller is about to start sending change notifications, so prepare the table view for updates.
//    [self.tableView beginUpdates];
//}
//
//
//- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
//    UITableView *tableView = self.tableView;
//    
//    switch(type) {
//        case NSFetchedResultsChangeInsert:
//            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
//            break;
//            
//        case NSFetchedResultsChangeDelete:
//            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//            break;
//            
//        case NSFetchedResultsChangeUpdate:
//            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
//            break;
//            
//        case NSFetchedResultsChangeMove:
//            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
//            break;
//    }
//}
//
//
//- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
//    switch(type) {
//        case NSFetchedResultsChangeInsert:
//            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
//            break;
//            
//        case NSFetchedResultsChangeDelete:
//            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
//            break;
//    }
//}
//
//
//- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
//    // The fetch controller has sent all current change notifications, so tell the table view to process all updates.
//    [self.tableView endUpdates];
//}
//
//
//
//
//
///*
//
//
////最后用隐藏tabbar
//- (void)hideTabBar {
//    if (self.tabBarController.tabBar.hidden == YES) {
//        return;
//    }
//    UIView *contentView;
//    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
//        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
//    else
//        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
//    contentView.frame = CGRectMake(contentView.bounds.origin.x,  contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
//    self.tabBarController.tabBar.hidden = YES;
//    
//    
//    
//}
//
// //这个方法来隐藏默认的TabBar，然后在显示自定义的TabBar的时候又出现问题，就是有自定义TabBar的view push到另一个view,然后返回的时候，隐藏系统TabBar后，显示自定义的TabBar会出现闪动的现象，可以看到系统TabBar隐藏，接着视图尺寸改变，自定义的TabBar由原来被系统的TabBar挤上去的位置向底部移动，这样就影响了用户体验。
// //最后试出的解决方法是：
// 
//-(void) viewDidAppear:(BOOL)animated
//{
//    self.hidesBottomBarWhenPushed = YES;
//}
//
//-(void)viewWillAppear:(BOOL)animated
//{
//    [self hideTabBar];
//}
//
//*/
@end
