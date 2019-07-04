//
// Created by yuvalgelles on 16/05/2019.
//

#ifndef HW3_SYMBOLTABLE_H
#define HW3_SYMBOLTABLE_H


#include <vector>
#include <stack>
#include <string>
#include <cstring>
namespace Symbol {
    class VarTable {
        VarTable *parent;
        int minusOffset;
        int minusOffsetInitial;
        int offset;
        int offsetInitial;
    public:
        static std::vector<std::string> names;
        static std::vector<std::string> types;
        static std::vector<std::string> argsNames;
        static std::vector<std::string> argsTypes;
        VarTable(VarTable *parent = NULL,int offset = 0,int minusOffset = -1) : parent(parent), minusOffset(minusOffset),minusOffsetInitial(minusOffset),offset(offset),offsetInitial(offset) {
          names.resize(offset);
          types.resize(offset);
          argsNames.resize(-1-minusOffset);
          argsTypes.resize(-1-minusOffset);
        }

        void InsertVar(std::string name, std::string type) {
          names.push_back(name);
          types.push_back(type);
          this->offset++;
        }
        void InsertArg(std::string name, std::string type) {
          argsNames.push_back(name);
          argsTypes.push_back(type);
          this->minusOffset--;
        }

        std::string GetName(int offset){
          if(offset>=0) {
            return names.at(offset);
          }
          return argsNames.at(-1-offset);
        }
        std::string GetType(int offset){
          if(offset>=0) {
            return types.at(offset);
          }
          return argsTypes.at(-1-offset);
        }
        int GetOffset(){
          return offset;
        }
        int GetMinusOffset(){
          return minusOffset;
        }
        int GetOffsetInitial(){
          return offsetInitial;
        }
        int GetMinusOffsetInitial(){
          return minusOffsetInitial;
        }
        VarTable* GetParent(){
          return parent;
        }
    };
    std::vector<std::string> VarTable::names=std::vector<std::string>();
    std::vector<std::string> VarTable::types=std::vector<std::string>();
    std::vector<std::string> VarTable::argsNames=std::vector<std::string>();
    std::vector<std::string> VarTable::argsTypes=std::vector<std::string>();
    class FuncTable {
        FuncTable *parent;
    public:
        int offset;
        int offsetInitial;

        static std::vector<std::string> names;
        static std::vector<std::string> types;
        FuncTable(FuncTable *parent = NULL,int offset = 0) : parent(parent),offset(offset),offsetInitial(offset) {
          names.resize(offset);
          types.resize(offset);
        }

        void InsertFunc(std::string name, std::string type) {
          names.push_back(name);
          types.push_back(type);
          this->offset++;
        }

        std::string GetName(int offset){
          return names.at(offset);
        }
        std::string GetType(int offset){
          return types.at(offset);
        }
        int GetOffset(){
          return offset;
        }

        int GetOffsetInitial(){
          return offsetInitial;
        }
        FuncTable* GetParent(){
          return parent;
        }
    };
    std::vector<std::string> FuncTable::names=std::vector<std::string>();
    std::vector<std::string> FuncTable::types=std::vector<std::string>();
    std::stack<Symbol::VarTable> TableStackVar;
    std::stack<Symbol::FuncTable> TableStackFunc;
}
#endif //HW3_SYMBOLTABLE_H
