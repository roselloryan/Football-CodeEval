//
//  main.m
//  Football


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSString *testString = @"1 2 3 4 | 3 1 | 4 1";
        
        NSArray *countriesArray = [testString componentsSeparatedByString: @" | "];
        
        NSMutableDictionary *teamsAndCountriesDictionary = [[NSMutableDictionary alloc]init];
        
        NSMutableArray *sortedArrayOfKeys = [[NSMutableArray alloc]init];
        
        NSInteger i = 0;
        for (i = 0; i < countriesArray.count; i++) {
            
            NSArray *teamsArray = [[countriesArray objectAtIndex: i] componentsSeparatedByString:@" "];
            
            for (NSString *teamNumString in teamsArray) {
                
                if ([teamsAndCountriesDictionary.allKeys containsObject:teamNumString]) {
                    NSString *newValueString = [[teamsAndCountriesDictionary valueForKey:teamNumString] stringByAppendingString:[NSString stringWithFormat:@",%lu", i + 1]];
                    [teamsAndCountriesDictionary setValue: newValueString forKey: teamNumString];
                }
                else {
                    
                    [teamsAndCountriesDictionary setValue: [NSString stringWithFormat:@"%lu", i + 1] forKey: teamNumString];
                    
                    if (sortedArrayOfKeys.count == 0) {
                        [sortedArrayOfKeys addObject:teamNumString];
                    }
                    else {
                        NSInteger k = 0;
                        for (k = 0; k < sortedArrayOfKeys.count; k++) {
                            if ( [teamNumString integerValue] < [[sortedArrayOfKeys objectAtIndex:k] integerValue]) {
                                [sortedArrayOfKeys insertObject: teamNumString atIndex: k];
                                NSLog(@"%@", sortedArrayOfKeys);
                                break;
                            }
                            if (k == sortedArrayOfKeys.count -1) {
                                [sortedArrayOfKeys addObject: teamNumString];
                                NSLog(@"%@", sortedArrayOfKeys);
                                break;
                                
                            }
                        }
                    }
                }
            }
        }
        
        NSLog(@"teamsAndCountriesDictionary:\n%@", teamsAndCountriesDictionary);
        
        NSString *solutionString = [[NSString alloc]init];
        
        for (NSString *key in sortedArrayOfKeys) {
            solutionString = [solutionString stringByAppendingString: [NSString stringWithFormat:@"%@:", key]];
            solutionString = [solutionString stringByAppendingString: [NSString stringWithFormat:@"%@; ",[teamsAndCountriesDictionary valueForKey: key]]];
        }
        
        NSLog(@"%@",solutionString);
        
        
    }
    return 0;
}
