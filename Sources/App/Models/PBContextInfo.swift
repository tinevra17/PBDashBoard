//
//  PBContextInfo.swift
//  PBDashBoardPackageDescription
//
//  Created by samuel tinevra on 1/12/18.
//

import Foundation
import Vapor
import MongoKitten


public let contextInfoCollection = database["PBContext"]

final class PBContextInfo{
    var _id: ObjectId
    var major: Int
    var minor: Int
    var uuid: String
    var _p_parentContextInfo: String
    
    var document: Document{
        return ["_id": self._id,
                "major": self.major,
                "minor": self.minor,
                "uuid": self.uuid
            "_p_parentContextInfo": self._id
        ]
    }
    
    init(major: Int, minor: Int, uuid: String) {
        self._id = ObjectId()
        self.major = major
        self.minor = minor
        self.UUID = uuid
    }
    
    
    init(major: Int, minor: Int, uuid: String) {
        self._id = ObjectId()
        self.major = major
        self.minor = minor
        self.uuid = uuid
        self.uuid = ObjectId()?
    }
    
    init(id: String)throws{
            let context = try ObjectId(sid)
            let query: Query = "_id" == context
        
        
            guard let context = try contextCollection.findOne(query) else{
                fatalError()
            }
        
            guard let  = user.dictionaryRepresentation["userName"] as? String,
                let email = user.dictionaryRepresentation["email"] as? String else{
                    fatalError()
            }
        
        
            self.ID = objectID
            self.userName = userName
            self.email = email
    }
    
    func saveContext()  throws {
        try contexInfoCollection.insert(document)
    }
}
