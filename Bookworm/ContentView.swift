//
//  ContentView.swift
//  Bookworm
//
//  Created by HEMANTH on 07/01/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
        
    ]) var books :FetchedResults<Book>
    
    @State private var showingAddSheet = false
    
    var body: some View {
        NavigationView{
            
            List{
                ForEach(books, id: \.id){ book in
                    
                    NavigationLink {
                        DetailView(book: book)
                    }  label: {
                        HStack{
                            EmojiRatingView(rating: book.rating)
                            
                            VStack{
                                Text(book.title ?? "Unkown title")
                                    .font(.headline)
                                Text(book.author ?? "author unknown")
                                    .font(.caption)
                                
                            }
                        }
                    }
                    
                } .onDelete(perform: deleteBooks)
            }
            .navigationTitle("BookWorm")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button{
                        showingAddSheet.toggle()
                    } label: {
                        Label("Add Book",systemImage: "plus")
                    }
                })
            })
            .sheet(isPresented: $showingAddSheet, content: {
                AddBookView()
            })
            
            
        }
        .padding()
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
