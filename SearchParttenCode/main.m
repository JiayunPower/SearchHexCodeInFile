//
//  main.m
//  SearchParttenCode
//
//  Created by qiuchenly on 2023/10/13.
//

#import <Foundation/Foundation.h>
#import "Utils.h"


void SurgeHelperScaner(void){
    hookPtrByMatchMachineCode("/Applications/Surge.app/Contents/Library/LaunchServices/com.nssurge.surge-mac.helper",@"55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 58 48 89 FB 4C 8D 7D C0 49 C7 07 00 00 00 00 48 8B 3D 7D F7 01 00 48 8B 53 20 48 8B 35 6A F0 01 00 4C 8B 35 FB 97 01 00 41 FF D6 48 89 C7 31 F6 4C 89 FA E8 8B 2A 01 00 48 8D 3D B4 AA 01 00 4C 8D 65 C8 31 F6 4C 89 E2 E8 6A 2A 01 00 49 8B 3F 49 8B 14 24 BE 04 00 00 00 E8 5F 2A 01 00 89 45 BC 49 8B 3F E8 A0 29 01 00 49 8B 3C 24 E8 97 29 01 00 48 8D 3D 9A AA 01 00 31 F6 4C 89 E2 E8 34 2A 01 00",@"FF C3 02 D1 FA 67 06 A9 F8 5F 07 A9 F6 57 08 A9 F4 4F 09 A9 FD 7B 0A A9 FD 83 02 91 F3 03 00 AA BF 83 1B F8 19 01 00 B0 20 27 43 F9 62 12 40 F9 12 46 00 94 A2 23 01 D1 01 00 80 52 03 3F 00 94 C0 00 00 F0 00 E0 3C 91 E2 43 01 91 01 00 80 52 F8 3E 00 94 A0 83 5B F8 E2 2B 40 F9 81 00 80 52 F7 3E 00 94 F5 03 00 AA A0 83 5B F8 9A 3E 00 94 E0 2B 40 F9 98 3E 00 94 C0 00 00 F0 00 60 3D 91 E2 43 01 91 01 00 80 52",1);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        SurgeHelperScaner();
        NSLog(@"Hello, World!");
    }
    return 0;
}
