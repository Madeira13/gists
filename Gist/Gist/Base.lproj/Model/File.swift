//
//  File.swift
//  Gist
//
//  Created by Vinicius on 13/01/18.
//  Copyright © 2017 Vinicius Minozzi. All rights reserved.
//

import Foundation

struct FileMinozzi: Mappable {
    
    var fileList: FileList?
    
    init?(data: Data) {
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        for key in container.allKeys {
             try fileList = container.decode(FileList.self, forKey: key)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Whatever.self)
        
        try container.encode(fileList, forKey: .fileList)
    }
    
    fileprivate enum Whatever: String, CodingKey {
        case fileList
    }

    fileprivate struct CodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?

        init?(intValue: Int) {
            self.intValue = intValue
            self.stringValue = ""
        }

        init?(stringValue: String) {
            self.stringValue = stringValue
        }
    }
    
    static func ==(lhs: FileMinozzi, rhs: FileMinozzi) -> Bool {
        return lhs.fileList == rhs.fileList
    }
}

struct FileList: Mappable {
    
    var filename = ""
    var type = ""
    
    init?(data: Data) {
        
    }
    
    static func ==(lhs: FileList, rhs: FileList) -> Bool {
        return lhs.filename == rhs.filename && lhs.type == rhs.type
    }
}
