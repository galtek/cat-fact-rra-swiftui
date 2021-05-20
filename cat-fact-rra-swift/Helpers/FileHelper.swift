//
//  FileHelper.swift
//  cat-fact-rra-swift
//
//  Created by Rafael Rodriguez on 5/19/21.
//

import Foundation

class FileHelper {
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data

        // Check that the fileExists in the documents directory
        let filemanager = FileManager.default
        let localPath = getDocumentsDirectory().appendingPathComponent(filename)

        if filemanager.fileExists(atPath: localPath.path) {
            
            do {
                data = try Data(contentsOf: localPath)
            } catch {
               fatalError("Couldn't load \(filename) from documents directory:\n\(error)")
            }

        } else {
            // If the file doesn't exist in the documents directory load it from the bundle
            guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
            }

            do {
                data = try Data(contentsOf: file)
            } catch {
                fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
            }
        }


        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(T.self, from: data)
            return response
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
    
    func save<T: Encodable>(_ filename: String, item: T) {

        let encoder = JSONEncoder()
        do {
            let url = getDocumentsDirectory().appendingPathComponent(filename)
            let encoded = try encoder.encode(item)
            let jsonString = String(data: encoded, encoding: .utf8)
            try jsonString?.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
    }
    
    func loadCatArray(_ filename: String, arrayKey: String) -> [Cat] {
        
        // Check that the fileExists in the documents directory
        let localPath = getDocumentsDirectory().appendingPathComponent(filename)
        var loadData:[Cat] = []
        
        if let data = NSMutableData(contentsOf: localPath) {
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data as Data)
            if let anArray = unarchiver.decodeObject(forKey: arrayKey) as? [Cat]  {
                unarchiver.finishDecoding()
                loadData = anArray
            } else {
                fatalError("Couldn't load \(filename)")
            }
        }
        return loadData
    }
    

    func saveCatArray(_ filename: String, arrayKey: String, item: [Cat]) {
        let localPath = getDocumentsDirectory().appendingPathComponent(filename)

        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(item, forKey: arrayKey)
        archiver.finishEncoding()
        data.write(to: localPath, atomically: true)
    }
    

    
}
