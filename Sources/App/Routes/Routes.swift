import Vapor
import MongoKitten


extension Droplet {
    func setupRoutes() throws {
        
        
        get("sam") { req in
            let ivan: Users = Users(userName: "Sam", email: "sam@hotmail.com")
            try ivan.save()
            
            return "sam added to the database!"
        }
        
        get("context") { req in
            let context: PBContext = PBContext(major: 11111, minor: 22222, UUID: "88888888-4444-4444-4444-111111111111")
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
