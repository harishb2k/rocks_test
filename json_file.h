//
// Created by Harish Bohara on 26/07/19.
//

#ifndef ROCKSDB_APP_JSON_FILE_H
#define ROCKSDB_APP_JSON_FILE_H

#include <stdio.h>
#include <iostream>
#include <nlohmann/json.hpp>

using namespace std;
using json = nlohmann::json;


namespace ns {
    struct person {
        std::string name;
        std::string address;
        int age;
    };

    void to_json(json &j, const person &p);
    void from_json(const json &j, person &p);
}

class json_file {

};

#endif //ROCKSDB_APP_JSON_FILE_H
