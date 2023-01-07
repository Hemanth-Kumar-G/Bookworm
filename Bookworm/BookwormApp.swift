//
//  BookwormApp.swift
//  Bookworm
//
//  Created by HEMANTH on 07/01/23.
//

import SwiftUI

@main
struct BookwormApp: App {
    
    @StateObject var dataController  = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .preferredColorScheme(.dark)
        }
    }
}
