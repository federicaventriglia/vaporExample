import Vapor

let drop = Droplet()

drop.get { request in
   // return "Hello, Beyoncé"
    return try JSON(node: [
        "message" : "All The Single Ladies"
        ])
}

drop.get("/"){ request in
    return "Hello, World"
}

drop.get("queen") { request in
    // return "Hello, Beyoncé"
    return try JSON(node: [
        "message" : "Oh Oh Oh, Oh Oh Oh"
        ])
}


drop.get("queen" , "bey") { request in
    // return "Hello, Beyoncé"
    return try JSON(node: [
        "message" : "If you liked then you should've put a ring on it"
        ])
}

drop.get("amount", Int.self) { request, lol in
    return try JSON(node: [
        "message": "You have, \(lol) CD's of Beyoncé"
        ] )
}

drop.post("post") { request in
    guard let name = request.data["name"]?.string else {
        throw Abort.badRequest
    }
    return try JSON(node: ["message":"Queen \(name)"])
}

drop.get("/name",":name") { request in
    if let name = request.parameters["name"]?.string {
        return try JSON(node: [
            "email":"\(name)@mammt.it",
            "name": "\(name)",
            "message":"mammt"
            ])
       // return "Hello \(name), Mammt!"
    }
    return "Error Retrieving Parameters"
}

drop.get("template") { request in
    return try drop.view.make("welcome", [
        "message": "Hello, world!"
        ])
}

drop.get("view") { request in
    return try drop.view.make("view.html")
}

drop.get("html") { request in
    return try drop.view.make("welcome.leaf")
}

drop.get("hello") { request in
    guard let name = request.data["name"]?.string else {
        throw Abort.badRequest
    }
    return "Hello, \(name)!"
}

drop.get("json") { request in
    guard let name = request.json?["name"]?.string else {
        throw Abort.badRequest
    }
    return "Hello,\(name)"
}

drop.run()
