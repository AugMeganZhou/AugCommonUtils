//
//  SynthesizeSingleton.h
//
//  Created by Megan on 12/9/13.
//  Copyright (c) 2013 Megan. All rights reserved.
//

#define SYNTHESIZE_SINGLETON_DEFINITION(classname) \
+ (classname *)shared##classname; \

#define SYNTHESIZE_SINGLETON_IMPLEMENTION(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
  @synchronized(self) \
  { \
    if (shared##classname == nil) \
    { \
      shared##classname = [[self alloc] init]; \
    } \
  } \
  \
  return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
  @synchronized(self) \
  { \
    if (shared##classname == nil) \
    { \
      shared##classname = [super allocWithZone:zone]; \
      return shared##classname; \
    } \
  } \
  \
  return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
  return self; \
} \
\
