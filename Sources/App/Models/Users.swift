//
//  Users.swift
//  PBDashBoardPackageDescription
//
//  Created by samuel tinevra on 1/11/18.
//

import Foundation
import Vapor
import MongoKitten



//public let database = try! Database("mongodb://tinevra17:sam@ds249787.mlab.com:49787/projects")
public let userCollection = database["users"]



final class Users{
    
    var ID: ObjectId
    var userName: String
    var email: String
    
    var document: Document{
        return ["_id": self.ID,
                "userName": self.userName,
                "email": self.email
        ]
    }
    
    
    var documentForSave: Document{
        return [
            "userName": self.userName,
            "email": self.email
        ]
    }
    
    
    init(userName: String, email: String) {
        self.userName = userName
        self.email = email
        self.ID = ObjectId()
    }
    
    //    init(id: String)throws{
    //        let objectID = try ObjectId(sid)
    //        let query: Query = "_id" == objectID
    //
    //
    //        guard let user = try userCollection.findOne(query) else{
    //            fatalError()
    //        }
    //
    //        guard let userName = user.dictionaryRepresentation["userName"] as? String,
    //            let email = user.dictionaryRepresentation["email"] as? String else{
    //                fatalError()
    //        }
    //
    //
    //        self.ID = objectID
    //        self.userName = userName
    //        self.email = email
    //    }
    
    // MARK
    func save()  throws {
        
        try userCollection.insert(document)
        
    }
    func delete() throws{
        // try userCollection.remove(query:document)
    }
}
