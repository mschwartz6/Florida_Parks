
#import "ParkMapViewController.h"

@interface ParkMapViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *mapImageView;

@end

@implementation ParkMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [self.colorPalette objectAtIndex:0];
    
    self.mapImageView.image = self.map;
}
-(void)viewWillAppear:(BOOL)animated
{
    UIView *navTitleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
    UILabel *myLabel = [[UILabel alloc]init];
    [myLabel setTextColor:[UIColor blackColor]];
    [myLabel setFont:[UIFont fontWithName:@"Verdana-Bold" size:24]];
    [myLabel setText:self.parkName];
    [myLabel sizeToFit];
    [navTitleView addSubview:myLabel];
    self.navigationItem.titleView = navTitleView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
