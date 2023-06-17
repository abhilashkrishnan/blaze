#ifndef COMPILER_H
#define COMPILER_H
#include "../vm/chunk.h"
#include "../vm/object.h"

bool compile(const char* source, Chunk* chunk);

#endif