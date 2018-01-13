import Vapor
import MongoKitten


extension Droplet {
    func setupRoutes() throws {
        
        
        get("sam") { req in
            let context: PBContext = PBContext(major: 22222, minor: 11111, uuid: "88888888-4444-4444-4444-111111111111")
            
            //let contextInfo: PBContextInfo
            
            return "sam added to the database!"
        }
        
        get("context") { req in
            let context: PBContext = PBContext(major: 11111, minor: 22222, uuid: "88888888-4444-4444-4444-111111111111")
            try context.saveContext()
            
            return "context added to the db"
        }
        
        get("delete") { req in
            let query: Query = "name" == "sam"
            try userCollection.remove(query)
            return "deleted!"
        }
        
        get("hello") { req in
            return "hello!"
        }
        
        try resource("posts", PostController.self)
    }
}
