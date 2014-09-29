//
//  KFLogFormatter.m
//  KFLogFormatter
//
//  Copyright (c) 2013 Gunnar Herzog, KF Interactive
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "KFLogFormatter.h"

@implementation KFLogFormatter

#define kDateFormatter = @"KFDateFormatterKey"

static NSDateFormatter *dateFormatter;

- (id)init
{
    self = [super init];

    if (self)
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^
        {
            NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
            dateFormatter = threadDictionary[kDateFormatter];
            if (dateFormatter == nil)
            {
                dateFormatter = [NSDateFormatter new];
                [dateFormatter setDateFormat:[NSDateFormatter dateFormatFromTemplate:@"yMMddHHmmssSSS" options:kNilOptions locale:[NSLocale currentLocale]]];
                threadDictionary[kDateFormatter] = dateFormatter;
            }
        });
    }

    return self;
}

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    NSString *logLevel;
    switch (logMessage->logFlag)
    {
        case LOG_FLAG_ERROR:
            logLevel = @"ERROR  ";
            break;

        case LOG_FLAG_INFO:
            logLevel = @"INFO   ";
            break;
            
        case LOG_FLAG_WARN:
            logLevel = @"WARNING";
            break;

        case LOG_FLAG_VERBOSE:
            logLevel = @"VERBOSE";
            break;
            
        case LOG_FLAG_DEBUG:
            logLevel = @"DEBUG  ";
            break;

        default:
            logLevel = @"       ";
            break;
    }

    NSString *dateString = [dateFormatter stringFromDate:(logMessage->timestamp)];

    return [NSString stringWithFormat:@"%@ %@ -[%@ %@][Line %d] %@", logLevel, dateString, logMessage.fileName, logMessage.methodName, logMessage->lineNumber, logMessage->logMsg];
}

@end
