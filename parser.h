#ifndef __PARSER_H
#define __PARSER_H

#ifndef TEXT_LEN
#define TEXT_LEN 2048
#endif

typedef struct
{
 int line;
 char val[TEXT_LEN];
 char token[TEXT_LEN];

} STYPE;
//#define YYSTYPE char*
#define YYSTYPE STYPE	// Tell Bison to use STYPE as the stack type

#endif
