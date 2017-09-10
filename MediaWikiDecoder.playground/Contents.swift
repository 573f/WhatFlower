//: Playground - noun: a place where people can play

import Foundation

let json = """
{
  "batchcomplete" : "",
  "query" : {
    "pageids" : [
      "7239883"
    ],
    "redirects" : [
      {
        "to" : "Echinacea purpurea",
        "from" : "Purple Coneflower"
      }
    ],
    "pages" : {
      "7239883" : {
        "pageid" : 7239883,
        "title" : "Echinacea purpurea",
        "extract" : "Echinacea purpurea (eastern purple coneflower, hedgehog coneflower, or purple coneflower) is a North American species of flowering plant in the sunflower family. It is native to eastern North America and present to some extent in the wild in much of the eastern, southeastern and midwestern United States as well as in the Canadian Province of Ontario. It is most common in the Ozarks and in the Mississippi/Ohio Valley.",
        "ns" : 0
      }
    }
  }
}
""".data(using: .utf8)!

struct Response : Codable {
    struct Page : Codable {
        let extract: String
        let ns: Int
        let pageid: Int
        let title: String
    }
    
    struct Query : Codable {
        struct Redirect: Codable {
            let to: String
            let from: String
        }
        
        let pageids: [String]
        let redirects: [Redirect]
        let pages: Array<Dictionary<String, Page>>
    }
    
    let batchComplete: String
    let query: Query
}

let decoder = JSONDecoder()
let response = try decoder.decode(Response.self, from: json) 
print(response)
