//
//  PBContextInfo.swift
//  PBDashBoardPackageDescription
//
//  Created by samuel tinevra on 1/12/18.
//

import Foundation
import Vapor
import MongoKitten


public let contextInfoCollection = database["PBContextInfo"]

final class PBContextInfo{
    var _id: ObjectId
    var type: String
    var cellData: [JSON]
    var _p_parentFacility: ObjectId

    var document: Document{
        return ["_id": self._id,
                "major": self.major,
                "minor": self.minor,
                "uuid": self.uuid
                "_p_parentFacility": self._p_parentFacility
        ]
    }
    
    init(type: String, cellData: [JSON]) {
        self._id = ObjectId()
        self.type = type
        self.cellData = cellData
        self._p_parentFacility = nil
    }
    

    init(id: String) throws{
            let contextInfo = try ObjectId(id)
            let query: Query = "_id" == contextInfo
        
        
            guard let DocumentInfo = try contextInfoCollection.findOne(query) else{
                fatalError()
            }
        
            guard let type = DocumentInfo.dictionaryRepresentation["type"] as? String,
            let cellData = DocumentInfo.dictionaryRepresentation["cellData"] as? String,else{
                    fatalError()
            }
        
        
            self._id = id
            self.type = type
            self.cellData = cellData
            self._p_parentFacility = nil
    }
    
    func saveContextInfo()  throws {
        try contexInfoCollection.insert(document)
    }
}
