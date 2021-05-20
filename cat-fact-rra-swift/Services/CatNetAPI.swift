//
//  CatNetAPI.swift
//  cat-fact-rra-swift
//
//  Created by Rafael Rodriguez on 5/17/21.
//

import Combine
import SwiftUI


class CatNetAPI: ObservableObject {
    
    var catsNoId = [CatNoId]()
    @Published var cats = [Cat]()
    @Published var netLatency: Int {
        didSet {
            UserDefaults.standard.setValue(netLatency, forKey: "netLatency")
        }
    }

    var startDate:Date = Date()
    
    var catListFull:Bool = false
    var isProcessing:Bool = false
    
    var page:Int = 0
    static var limit:Int = 30
    
    
    var fileHelper = FileHelper()


    init() {
        self.netLatency = UserDefaults.standard.object(forKey: "netLatency") as? Int ?? 0
        
        let url = URL(string: "https://catfact.ninja/breeds?limit=\(CatNetAPI.limit)&page=\(page+1)")!
        self.startDate = Date()
        print("Start Date: \(self.startDate)")
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let catData = data {
                    self.isProcessing = true
                    self.fileHelper.save("catOfflineJSON", item: catData)
                    
                    let decodedData:Jsondata = try JSONDecoder().decode(Jsondata.self, from: catData)
                    DispatchQueue.main.async {
                        self.isProcessing = false
                        self.catsNoId = decodedData.data
                        //Identifiable for NavigationLink
                        for catNoId in self.catsNoId {
                            self.cats.append(Cat(_breed: catNoId.breed, _country: catNoId.country, _origin: catNoId.origin, _coat: catNoId.coat, _pattern: catNoId.pattern))
                        }
                        let diffTime = Date().timeIntervalSince(self.startDate) * 1000
                        print("Diff Date: \(diffTime)")
                        self.netLatency = Int(diffTime)
                    }
                } else {
                    print("No data")
                    let decodedFile:Data = self.fileHelper.load("catOfflineJSON")
                    let decodedDataFile:Jsondata = try JSONDecoder().decode(Jsondata.self, from: decodedFile)
                    
                    DispatchQueue.main.async {
                        self.isProcessing = false
                        self.catsNoId = decodedDataFile.data
                        //Identifiable for NavigationLink
                        for catNoId in self.catsNoId {
                            self.cats.append(Cat(_breed: catNoId.breed, _country: catNoId.country, _origin: catNoId.origin, _coat: catNoId.coat, _pattern: catNoId.pattern))
                        }
                    }
                    
                }
            } catch {
                self.isProcessing = false
                print("Error \(error)")
            }
        }.resume()
    }
    
    func fetchCats(){
        page = page + 1
        
        self.netLatency = UserDefaults.standard.object(forKey: "netLatency") as? Int ?? 0
        let url = URL(string: "https://catfact.ninja/breeds?limit=\(CatNetAPI.limit)&page=\(page+1)")!
        self.startDate = Date()
        print("Start Date: \(self.startDate)")
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let catData = data {
                    self.isProcessing = true
                    self.fileHelper.save("catOfflineJSON", item: catData)
                    let decodedData = try JSONDecoder().decode(Jsondata.self, from: catData)
                    DispatchQueue.main.async {
                        self.isProcessing = false
                        self.catsNoId = decodedData.data
                        //Identifiable for NavigationLink
                        for catNoId in self.catsNoId {
                            self.cats.append(Cat(_breed: catNoId.breed, _country: catNoId.country, _origin: catNoId.origin, _coat: catNoId.coat, _pattern: catNoId.pattern))
                        }
                        let diffTime = Date().timeIntervalSince(self.startDate) * 1000
                        print("Diff Date: \(diffTime)")
                        self.netLatency = Int(diffTime)
                    }
                } else {
                    print("No data")
                    self.page = self.page - 1
                    let decodedFile:Data = self.fileHelper.load("catOfflineJSON")
                    let decodedDataFile:Jsondata = try JSONDecoder().decode(Jsondata.self, from: decodedFile)
                    
                    DispatchQueue.main.async {
                        self.isProcessing = false
                        self.catsNoId = decodedDataFile.data
                        //Identifiable for NavigationLink
                        for catNoId in self.catsNoId {
                            self.cats.append(Cat(_breed: catNoId.breed, _country: catNoId.country, _origin: catNoId.origin, _coat: catNoId.coat, _pattern: catNoId.pattern))
                        }
                    }
                }
            } catch {
                self.isProcessing = false
                print("Error \(error)")
            }
        }.resume()
        
    }


}

extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}
