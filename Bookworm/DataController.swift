//
//  DataFoundation.swift
//  days100
//
//  Created by HEMANTH on 07/01/23.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        
        container.loadPersistentStores { description, error in
            
            if let error = error {
                print("core data failed to load : \(error.localizedDescription)")
            }
            
            
        }
    }
}
