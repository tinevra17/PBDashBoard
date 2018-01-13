import Vapor
import MongoKitten


extension Droplet {
    func setupRoutes() throws {
        
        
        get("sam") { req in
            let context: PBContext = PBContext(major: 22222, minor: 11111, uuid: "88888888-4444-4444-4444-111111111111")
            
//            let cellData: JSON = JSON([{
//                                    "title": "Cowork Oasis Conference Room",
//                                    "type": "title",
//                                    "description": "This is the Cowork Oasis conference room. To schedule, talk to staff or ask the owners to let me integrate into their system!"
//                                    },
//                                  {
//                                    "type": "photoPager",
//                                    "url": "https://coworkoasis.com",
//                                    "images": [{
//                                                "__type": "File",
//                                                "url": "http://parabeac-dev.herokuapp.com/parse/files/parabeacDev/5472014bbea28a24cc190c2553b3e71b_file.bin",
//                                                "name": "5472014bbea28a24cc190c2553b3e71b_file.bin"
//                                                }]
//                                    }])
            
            
            
            let contextInfo: PBContextInfo = PBContextInfo(type: "SVS", cellData: <#T##[JSON]#>)
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
