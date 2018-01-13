//
//  PBFacility.swift
//  PBDashBoardPackageDescription
//
//  Created by samuel tinevra on 1/12/18.
//

import Foundation
import Vapor
import MongoKitten

public let facilityCollection = database["PBFacility"]


final class PBFacility{
    var _id: ObjectId
    var name: String

    var document: Document{
        return ["_id": self._id,
                "name": self.name,
        ]
    }
    
    init(name: String) {
        self.name = name
        self._id = ObjectId()
    }
    
    func saveFacility()  throws {
        try facilityCollection.insert(document)
    }
}
