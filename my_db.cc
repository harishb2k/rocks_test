//
// Created by Harish Bohara on 24/07/19.
//

#include <stdio.h>
#include <assert.h>
#include "rocksdb/db.h"
#include "rocksdb/db.h"
#include "rocksdb/slice.h"
#include "rocksdb/options.h"
#include <iostream>
#include <time.h>

using namespace rocksdb;
using namespace std;
std::string kDBPath = "/tmp/rocksdb_simple_example";

int main() {
    Status status;
    rocksdb::DB *db;
    Options options;
    options.create_if_missing = true;

    options.delete_obsolete_files_period_micros = 1;

    status = DB::Open(options, kDBPath, &db);
    if (!status.ok()) cout << status.ToString() << "\n";

    for (int i = 0; i < 1000; i++) {
        std::string key = "key_";
        key += std::to_string(i);
        key += to_string(time(NULL));

        status = db->Put(WriteOptions(), key, to_string(time(NULL)));
        if (!status.ok()) cout << status.ToString() << "\n";
    }


    int count = 0;
    Iterator *it = db->NewIterator(ReadOptions());
    for (it->SeekToFirst(); it->Valid(); it->Next()) {
        cout << it->key().ToString() << ": " << it->value().ToString() << endl;
        count++;
    }
    assert(it->status().ok()); // Check for any errors found during the scan
    delete it;


    cout << "Count is: " << count << "\n";
    delete db;
    return 0;
}
