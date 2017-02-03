//
//  Database.swift
//  Notes Clone
//
//  Created by Filza Mazahir on 1/25/16.
//  Copyright © 2016 Filza Mazahir. All rights reserved.
//

import Foundation
class Database {
    // get the full path to the Documents folder
    static func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        return paths[0]
    }
    // get the full path to file of project
    static func dataFilePath(_ schema: String) -> String {
        return "\(Database.documentsDirectory())/\(schema)"
    }
    static func save(_ arrayOfObjects: [AnyObject], toSchema: String, forKey: String) {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(arrayOfObjects, forKey: "\(forKey)")
        archiver.finishEncoding()
        data.write(toFile: Database.dataFilePath(toSchema), atomically: true)
    }
}
