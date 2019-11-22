//
//  ContentViewModel.swift
//  SwiftUImvvm


import SwiftUI
import Alamofire

class ContentViewModel: ObservableObject {
    @Published var photosArray = [Photos]()
    @Published var isLoading = true
    var counter = Int()
    let limit = 10
    
    init() {
        getData()
    }
    
    func getData() {
        DispatchQueue.main.async {
            self.isLoading = true
            AF.request("http://jsonplaceholder.typicode.com/photos?_start=\(self.counter)&_limit=\(self.limit)", parameters: nil)  .validate(statusCode: 200..<300) .validate(contentType: ["application/json"]).response { response in
                do {
                    let res = try JSONDecoder().decode([Photos].self, from: response.data!)
                    self.isLoading = false
                    self.photosArray += res
                    self.counter += self.limit
                } catch {
                    
                }
            }
        }
    }
}
