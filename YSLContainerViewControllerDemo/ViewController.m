

#import "ViewController.h"
#import "SegmentContainerController.h"
#import "PlayListTableViewController.h"
#import "ArtistsViewController.h"
#import "SampleViewController.h"

@interface ViewController () <YSLContainerViewControllerDelegate>

@end

@implementation ViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NavigationBar
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectZero];
    titleView.font = [UIFont fontWithName:@"Futura-Medium" size:19];
    titleView.textColor = [UIColor colorWithRed:0.333333 green:0.333333 blue:0.333333 alpha:1.0];
    titleView.text = @"Menu";
    [titleView sizeToFit];
    titleView.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = titleView;
    
    // SetUp ViewControllers
    PlayListTableViewController *playListVC = [[PlayListTableViewController alloc]initWithNibName:@"PlayListTableViewController" bundle:nil];
    playListVC.title = @"PlayList";
    
    ArtistsViewController *artistVC = [[ArtistsViewController alloc]initWithNibName:@"ArtistsViewController" bundle:nil];
    artistVC.title = @"Artists";
    
    SampleViewController *sampleVC1 = [[SampleViewController alloc]initWithNibName:@"SampleViewController" bundle:nil];
    sampleVC1.title = @"Album";
    
    SampleViewController *sampleVC2 = [[SampleViewController alloc]initWithNibName:@"SampleViewController" bundle:nil];
    sampleVC2.title = @"Track";
    
    SampleViewController *sampleVC3 = [[SampleViewController alloc]initWithNibName:@"SampleViewController" bundle:nil];
    sampleVC3.title = @"Setting";
    
    // ContainerView
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    CGFloat topHeight = statusHeight + navigationHeight;
    
    SegmentContainerController *containerVC = [[SegmentContainerController alloc]initWithControllers:@[playListVC,artistVC]
                                               currentIndex:1 topBarHeight:topHeight parentViewController:self];
    containerVC.delegate = self;
    containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:16];
    
    [self.view addSubview:containerVC.view];
}

#pragma mark -- YSLContainerViewControllerDelegate
- (void)containerViewItemIndex:(NSInteger)index currentController:(UIViewController *)controller
{
//    NSLog(@"current Index : %ld",(long)index);
//    NSLog(@"current controller : %@",controller);
}
@end
