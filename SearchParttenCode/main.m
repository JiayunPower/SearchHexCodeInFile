//
//  main.m
//  SearchParttenCode
//
//  Created by qiuchenly on 2023/10/13.
//

#import <Foundation/Foundation.h>
#import "Utils.h"


void SurgeHelperScaner(NSDictionary* jsonDict){
   
}

void CleanMyMacX(void){
    hookPtrByMatchMachineCode("/Users/qiuchenly/Downloads/com.macpaw.CleanMyMac4.Agent",
                              @"55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 58 48 89 D7 48 8B 05 8E 4F 02 00 48 8B 00 48 89 45 D0 FF 15 91 50 02 00 49 89 C6 31 C0 48 89 45 A8 48 89 45 B8 48 89 45 B0 4D 85 F6 74 15 48 8B 15 5C 55 04 00 48 8D 7D 80 4C 89 F6 E8 D0 BE 00 00 EB 0B 0F 57 C0 0F 29 45 90 0F 29 45 80 48 8B 3D F4 73 04 00 48 8B 35 55 57 04 00 48 8B 1D 36 50 02 00 48 8D 55 80 B9 20 00 00 00 FF D3 48 89 C7 E8 AD BE 00 00 49 89 C7 48 8B 05 F9 4F 02 00 48 8B 00 48 8D 4D C0 48 89 01 48 8D 55 C8 4C 89 3A",
                              @"FF 03 02 D1 F6 57 05 A9 F4 4F 06 A9 FD 7B 07 A9 FD C3 01 91 E0 03 02 AA 1F 20 03 D5 C8 49 18 58 08 01 40 F9 A8 83 1D F8 38 2A 00 94 F3 03 00 AA FF FF 02 A9 FF 13 00 F9 A0 00 00 B4 E8 03 00 91 E0 03 13 AA 7E 2F 00 94 03 00 00 14 00 E4 00 6F E0 03 00 AD 1F 20 03 D5 20 03 26 58 E2 03 00 91 03 04 80 52 96 31 00 94 FD 03 1D AA 30 2A 00 94 F4 03 00 AA 1F 20 03 D5 E8 4D 18 58 08 01 40 F9 E8 1F 00 F9 A0 03 1D F8 1F 20 03 D5 80 00 26 58 A2 C3 00 D1 E3 E3 00 91 24 00 80 52 50 32 00 94 FD 03 1D AA",
                              1);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        const char * target = argv[1];
        if (target == NULL){
            NSLog(@"请提供目标参数！");
            return -3;
        }
        
        NSString *executablePath = [[NSBundle mainBundle] executablePath];
        NSString *executableDirectory = [executablePath stringByDeletingLastPathComponent];
        executableDirectory = [executableDirectory stringByAppendingString:@"/"];

        //NSLog(@"可执行文件所在的目录：%@", executableDirectory);
        
        
        /**
         文件内容格式示例
         {
           "surge": {
             "locate": "/Applications/Surge.app/Contents/Library/LaunchServices/com.nssurge.surge-mac.helper",
             "arm": "FF C3 02 D1 FA 67 06 A9 F8 5F 07 A9 F6 57 08 A9 F4 4F 09 A9 FD 7B 0A A9 FD 83 02 91 F3 03 00 AA BF 83 1B F8 19 01 00 B0 20 ?? 43 F9 62 12 40 F9 ?? 46 00 94 A2 23 01 D1 01 00 80 52 ?? 3F 00 94 C0 00 00 F0 00 E0 3C 91 E2 43 01 91 01 00 80 52 ?? ?? 00 94 A0 83 5B F8 E2 2B 40 F9 81 00 80 52 ?? ?? 00 94 F5 03 00 AA A0 83 5B F8 ?? 3E 00 94 E0 2B 40 F9 ?? 3E 00 94 C0 00 00 F0 00 60 3D 91 E2 43 01 91 01 00 80 52",
             "x86": "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 58 48 89 FB 4C 8D 7D C0 49 C7 07 00 00 00 00 48 8B 3D ?? ?? 01 00 48 8B 53 20 48 8B 35 ?? ?? 01 00 4C 8B 35 ?? ?? 01 00 41 FF D6 48 89 C7 31 F6 4C 89 FA E8 ?? ?? 01 00 48 8D 3D ?? ?? 01 00 4C 8D 65 C8 31 F6 4C 89 E2 E8 ?? ?? 01 00 49 8B 3F 49 8B 14 24 BE 04 00 00 00 E8 ?? ?? 01 00 89 45 BC 49 8B 3F E8 ?? ?? 01 00 49 8B 3C 24 E8 ?? ?? 01 00 48 8D 3D ?? ?? 01 00 31 F6 4C 89 E2 E8 ?? 2A 01 00",
             "out": "surge.sh",
             "replaceIntel": "{{intel}}",
             "replaceARM": "{{arm64}}"
           }
         }
         */
        NSString *filePath = [executableDirectory stringByAppendingString: @"Patch.json"];

        // 读取文件内容
        NSError *error;
        NSString *jsonString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];

        if (error) {
            NSLog(@"读取文件出错：%@", error);
            return -2;
        }

        // 解析 JSON 数据
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];

        if (error) {
            NSLog(@"解析 JSON 数据出错：%@", error);
            return -1;
        }

        NSDictionary *jsonDict = (NSDictionary *)jsonObject;
        
        NSDictionary *info = jsonDict[[NSString stringWithUTF8String:target]];
        
        if(info == nil) {
            NSLog(@"没有找到记录对应的数据！ %s", target);
            return -4;
        }
        
        NSMutableDictionary* res = hookPtrByMatchMachineCode([info[@"locate"] UTF8String],
                                  info[@"x86"],
                                  info[@"arm"],
                                  1);
        
        NSString *targetFile = [executableDirectory stringByAppendingString:info[@"out"]];
        NSError *fileError;
        NSString *fileContent = [NSString stringWithContentsOfFile:targetFile encoding:NSUTF8StringEncoding error:&error];
        if (fileContent) {
            NSString *keyIntel = info[@"replaceIntel"];
            NSString *keyARM = info[@"replaceARM"];
            
            NSString *modifiedContent = [fileContent stringByReplacingOccurrencesOfString:keyIntel withString:res[@"x86"]];
            
            modifiedContent = [modifiedContent stringByReplacingOccurrencesOfString:keyARM withString:res[@"arm"]];
            
            BOOL success = [modifiedContent writeToFile:targetFile atomically:YES encoding:NSUTF8StringEncoding error:&fileError];
            if (success) {
                NSLog(@"成功更新了目标文件中的内容.");
            } else {
                NSLog(@"更新参数失败！ %@", error);
            }
        } else {
            NSLog(@"无法读取待更新参数的文件错误: %@", error);
        }
//        CleanMyMacX();
    }
    return 0;
}
