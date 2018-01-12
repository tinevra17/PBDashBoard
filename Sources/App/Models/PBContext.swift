//
//  PBContext.swift
//  PBDashBoardPackageDescription
//
//  Created by samuel tinevra on 1/11/18.
//

import Foundation
import Vapor
import MongoKitten


public let database = try! Database("mongodb://sam:sam@ds133428.mlab.com:33428/heroku_dmnl45q2")
public let contextCollection = database["PBContext"]



final class PBContext{
    var _id: ObjectId
    var major: Int
    var minor: Int
    var UUID: String
    
    var document: Document{
        return ["_id": self._id,
                "major": self.major,
                "minor": self.minor,
                "uuid": self.UUID
        ]
    }
    
    init(major: Int, minor: Int, UUID: String) {
        self._id = ObjectId()
        self.major = major
        self.minor = minor
        self.UUID = UUID
    }
    
    func saveContext()  throws {
        
        try contextCollection.insert(document)
        
    }
}
