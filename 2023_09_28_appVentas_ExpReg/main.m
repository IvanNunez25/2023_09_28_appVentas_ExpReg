//
//  main.m
//  2023_09_28_appVentas_ExpReg
//
//  Created by Ivanovicx Nuñez on 28/09/23.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Mi ferretería");
        
        NSError *error = nil;
        
        NSString *fileName = @"/Users/ivanovicxnunez/Documents/EJESAD 23/venta1.txt";
        NSString *contenido = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSASCIIStringEncoding error:&error];
        
        NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:@"Orden: \\d+" options:0 error:&error];
        
        long nMatches = [regex numberOfMatchesInString:contenido options:0 range:NSMakeRange(0, contenido.length)];
        
        NSLog(@"Número de coincidencias: %ld", nMatches);
        
        NSArray *matches = [regex matchesInString:contenido options:0 range:NSMakeRange(0, contenido.length)];
        
        for(NSTextCheckingResult *match in matches){
            NSString *matchText = [contenido substringWithRange:[match range]];
            NSLog(@"Orden encontrada: %@", matchText);
        }
        
        
    }
    return 0;
}
