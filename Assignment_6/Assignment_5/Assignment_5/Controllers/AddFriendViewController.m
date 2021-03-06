
#import "AddFriendViewController.h"


@interface AddFriendViewController ()

@end

@implementation AddFriendViewController
@synthesize textFieldFirstName,textFieldState,textFieldLastName,textFieldCity;
@synthesize isEdit;
@synthesize buttonSaveData;
@synthesize rowIndex;
@synthesize person;
- (void)viewDidLoad {
    [super viewDidLoad];
    if(isEdit == YES)
    {
        textFieldFirstName.text = person.firstName;
        textFieldLastName.text = person.lastName;
        textFieldCity.text = person.city;
        textFieldState.text = person.state;
        [buttonSaveData setTitle:@"Edit" forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (IBAction)saveFriendsDetalis:(id)sender {
    
    
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *newManagedObject;
    
    if(isEdit)
    {
        NSManagedObjectContext *context;

        
        NSFetchRequest *fetchRequest=[NSFetchRequest fetchRequestWithEntityName:@"PersonInfo"];
        
        context = [self managedObjectContext];
        newManagedObject = [[context executeFetchRequest:fetchRequest error:nil] objectAtIndex:rowIndex];
        
        [newManagedObject setValue:textFieldFirstName.text forKey:@"firstName"];
        [newManagedObject setValue:textFieldLastName.text forKey:@"lastName"];
        [newManagedObject setValue:textFieldCity.text forKey:@"city"];
        [newManagedObject setValue:textFieldState.text forKey:@"state"];
        
        
        [self.managedObjectContext save:nil];
    }
    else{
        
        
        newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:@"PersonInfo" inManagedObjectContext:context];
        
        
        [newManagedObject setValue:self.textFieldFirstName.text forKey:@"firstName"];
        [newManagedObject setValue:self.textFieldLastName.text forKey:@"lastName"];
        [newManagedObject setValue:textFieldCity.text forKey:@"city"];
        [newManagedObject setValue:textFieldState.text forKey:@"state"];
        
        NSError *error = nil;
        // Save the object to persistent store
        if (![context save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        }
        
    }
    
    [self.navigationController popViewControllerAnimated:true];
    
    
}



@end
