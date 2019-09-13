//
// Created by Harish Bohara on 24/07/19.
//

#include <stdio.h>
#include <assert.h>
#include "rocksdb/db.h"
#include "rocksdb/db.h"
#include "rocksdb/slice.h"
#include "rocksdb/options.h"
#include "rocksdb/slice_transform.h"
#include <iostream>
#include <time.h>
#include <nlohmann/json.hpp>
#include "json_file.h"
#include <cppkafka/cppkafka.h>

using namespace ns;
using namespace rocksdb;
using namespace std;
using namespace cppkafka;
using json = nlohmann::json;
std::string kDBPath = "/tmp/rocksdb_simple_example";
std::string kDBPath1 = "/tmp/rocksdb_column_families_example";

int _main() {
    rocksdb::DB *db;
    Status s;

    // open DB with two column families
    rocksdb::Options dbOptions;
    dbOptions.create_if_missing = true;
    dbOptions.create_missing_column_families = true;
    dbOptions.prefix_extractor.reset(rocksdb::NewFixedPrefixTransform(3));

    std::vector<ColumnFamilyHandle *> handles;
    std::vector<ColumnFamilyDescriptor> column_families;
    column_families.emplace_back(kDefaultColumnFamilyName, ColumnFamilyOptions());
    column_families.emplace_back("new_cf", ColumnFamilyOptions());

    s = DB::Open(dbOptions, kDBPath1, column_families, &handles, &db);
    assert(s.ok());

    // put and get from non-default column family
    s = db->Put(WriteOptions(), handles[1], Slice("key"), Slice("value"));
    assert(s.ok());
    std::string value;
    s = db->Get(ReadOptions(), handles[1], Slice("key"), &value);
    assert(s.ok());

    // atomic write
    WriteBatch batch;
    batch.Put(handles[0], Slice("key2"), Slice("value4"));
    batch.Put(handles[1], Slice("key2"), Slice("value3"));
    // batch.Delete(handles[0], Slice("key"));
    s = db->Write(WriteOptions(), &batch);
    assert(s.ok());

    s = db->Get(ReadOptions(), handles[0], Slice("key2"), &value);
    // cout << value << "\n";
    s = db->Get(ReadOptions(), handles[1], Slice("key2"), &value);
    // cout << value << "\n\n\n";

    std::vector<std::string> values;
    std::vector<Slice> keys;
    keys.emplace_back(Slice("key2"));
    keys.emplace_back(Slice("key2"));
    db->MultiGet(ReadOptions(), handles, keys, &values);

    std::for_each(values.begin(), values.end(), [](auto value) {
        std::cout << value << '\n';
    });

    // drop column family
    // s = db->DropColumnFamily(handles[1]);
    assert(s.ok());


    ns::person p{"Ned Flanders", "744 Evergreen Terrace", 60};
    json jr = p;
    std::cout << jr << std::endl;
    s = db->Put(WriteOptions(), Slice("keyh"), Slice(jr.dump()));

    std::cout << "*********\n";
    auto iter = db->NewIterator(ReadOptions());
    iter->Seek("key");
    for (iter->Seek("key"); iter->Valid(); iter->Next()) {
        std::cout << iter->key().ToString(false) << " " << iter->value().data() << "\n";
    }

    // close db
    for (auto handle : handles) {
        delete handle;
    }
    delete db;

    return 0;
}

int main() {

    // Create the config
    Configuration config = {
            { "metadata.broker.list", "127.0.0.1:9092" }
    };

    // Create the producer
    Producer producer(config);

    // Produce a message!
    string message = "hey there!";
    producer.produce(MessageBuilder("my_topic").partition(0).payload(message));
    producer.flush();

    _main();
    return 0;

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
