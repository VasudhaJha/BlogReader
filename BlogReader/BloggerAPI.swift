//
//  BloggerAPI.swift
//  BlogReader
//
//  Created by Jha, Vasudha on 17/05/18.
//  Copyright © 2018 Jha, Vasudha. All rights reserved.
//

import Foundation

struct BloggerAPI {
    
    private static let baseUrl = "https://www.googleapis.com/blogger/v3/blogs"
    private static let apiKey = "AIzaSyBPnWHXMLMFVraqNf-xlv_2SLVLQPkNCdk"
    private static let blogId = "10861780"
    
    //https://www.googleapis.com/blogger/v3/blogs/2399953/posts?key=AIzaSyBPnWHXMLMFVraqNf-xlv_2SLVLQPkNCdk
    static func bloggerUrl() -> URL{
        var components = URLComponents(string: baseUrl + "/"+blogId+"/posts" )
        var queryItems = [URLQueryItem]()
        
        let baseParam = ["key" : apiKey]
        
        for (key,value) in baseParam {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        components?.queryItems = queryItems
        
        guard let url = components?.url else {
            print("URL not found")
            return URL(string: "")!
        }
        print(url)
        return url
    }
    
    // parsing blog data
    static func blogDetails(fromJSONData data: Data) -> [[AnyHashable : Any]] {
    
        do {
           let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
           guard
            let jsonDictionary = jsonObject as? [AnyHashable : Any],
            let items = jsonDictionary["items"] as? [[AnyHashable : Any]] else {
                print("JSON Parse error")
                return [["": ""]]
            }
            return items
            
        } catch{
            print("Unable to parse json")
        }
     return [["": ""]]
    }
    
    }
