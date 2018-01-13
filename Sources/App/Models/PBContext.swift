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
    var uuid: String
    var _p_parentContextInfo: String
    
    var document: Document{
        return ["_id": self._id,
                "major": self.major,
                "minor": self.minor,
                "uuid": self.uuid,
                "_p_parentContextInfo": self._id
        ]
    }
    
   
    
    init(major: Int, minor: Int, uuid: String) {
        self._id = ObjectId()
        self.major = major
        self.minor = minor
        self.uuid = uuid
        self._p_parentContextInfo = ""
    }
    
    init(id: String)throws{
        let contextId = try ObjectId(id)
        let query: Query = "_id" == contextId
        
        
        guard let context = try contextCollection.findOne(query) else{
            fatalError()
        }
        
        guard let major  = context.dictionaryRepresentation["major"] as? Int,
        let minor = context.dictionaryRepresentation["minor"] as? Int,
        let uuid = context.dictionaryRepresentation["uuid"] as? String else{
            fatalError()
        }

        self._id = ObjectId()
        self.major = major
        self.minor = minor
        self.uuid = uuid
        self._p_parentContextInfo = ""
    }
    
    func saveContext()  throws {
        try contextCollection.insert(document)
    }
}
