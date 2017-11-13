
#import "MainTableViewController.h"

@interface MainTableViewController (){
    ParkDirectory *parkDir;
}

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    parkDir = [[ParkDirectory alloc]initWithAllParks];
    
    //UI Elements
    _appFonts = [[NSArray alloc]initWithObjects:
                 [UIFont fontWithName:@"Verdana-Bold" size:22],
                 [UIFont fontWithName:@"Verdana-BoldItalic" size:16],
                 [UIFont fontWithName:@"Verdana" size:20],nil];
    _colorPalette = [[NSArray alloc]initWithObjects:
                     [UIColor colorWithRed:0.48 green:.27 blue:.06 alpha:1.0],
                     [UIColor colorWithRed:.73 green:.56 blue:.37 alpha:1.0],
                     [UIColor colorWithRed:.11 green:.56 blue:.11 alpha:1.0],
                     [UIColor colorWithRed:.32 green:.66 blue:.24 alpha:1.0],
                     [UIColor colorWithRed:.46 green:.88 blue:.47 alpha:1.0],nil];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    
    UIView *navTitleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
    UILabel *myLabel = [[UILabel alloc]init];
    [myLabel setTextColor:[UIColor blackColor]];
    [myLabel setFont:[UIFont fontWithName:@"Verdana-Bold" size:36]];
    [myLabel setText:@"Florida Parks"];
    [myLabel sizeToFit];
    [navTitleView addSubview:myLabel];
    self.navigationItem.titleView = navTitleView;
    
    UINavigationBar *bar = self.navigationController.navigationBar;
    UIImage *navBarImage = [UIImage imageNamed:@"jungle"];
    [bar setBackgroundImage:navBarImage forBarMetrics:UIBarMetricsDefault];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [parkDir.allParks count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"maintableviewcell" forIndexPath:indexPath];
    Park *aPark = [parkDir.allParks objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = [aPark getParkName];
    cell.locationLabel.text = [aPark getParkLocation];
    cell.parkThumbnailImage.image = [aPark getParkThumbnail];
    
    
    cell.nameLabel.font = [_appFonts objectAtIndex:0];
    cell.locationLabel.font = [_appFonts objectAtIndex:1];
    
    if (indexPath.row % 5 == 0)
        cell.backgroundColor = [_colorPalette objectAtIndex:0];
    else if ( (indexPath.row % 5)-1 == 0)
        cell.backgroundColor = [_colorPalette objectAtIndex:1];
    else if ( (indexPath.row % 5)-2 == 0)
        cell.backgroundColor = [_colorPalette objectAtIndex:2];
    else if ( (indexPath.row % 5)-3 == 0)
        cell.backgroundColor = [_colorPalette objectAtIndex:3];
    else if ( (indexPath.row % 5)-4 == 0)
        cell.backgroundColor = [_colorPalette objectAtIndex:4];
    else
        cell.backgroundColor = [_colorPalette objectAtIndex:3];
    
    
    cell.layer.borderWidth = 2.0;
    cell.layer.borderColor = [UIColor blackColor].CGColor;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString: @"mainsegue"])
    {
        ParkViewController *destination = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Park *thePark = [parkDir.allParks objectAtIndex:indexPath.row];
        destination.thePark = thePark;
        destination.appFonts = _appFonts;
        destination.colorPalette = _colorPalette;
    }
}


@end
