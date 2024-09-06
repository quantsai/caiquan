//
//  Note.swift
//  sccApp
//
//  Created by 蔡铨 on 2024/9/5.
//

import SwiftUI
import ImagePickerView


struct NoteView: View {
    
    
    @StateObject var noteData = NoteData()
    
    @State var titleInput = ""
    @State var contentInput = ""
    
    @State var image: UIImage?
    @State var showImagePicker:Bool = false;
    
    
    
    func delete(at offsets: IndexSet){
        noteData.notes.remove(atOffsets: offsets)
        noteData.saveNotes()
    }
    
    var body: some View {
        
        VStack{
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 100, height: 100)
                    .cornerRadius(100)
            }
            
            VStack(spacing: 12){
                TextField("title", text: $titleInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("content", text: $contentInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                HStack{
                    Button{
                        showImagePicker.toggle()
                    }label: {
//                        RoundButton(text: "Upload Image", image: "photo")
                        HStack{
                            Image(systemName: "photo")
                            Text("Upload Image")
                        }
                        
                    }
                    .sheet(isPresented: $showImagePicker){
                        ImagePickerView(sourceType: .photoLibrary){
                            image in
                            self.image = image
                        }
                    }
                    
                    
                    
                    Spacer()
                    Button{
                        if(titleInput=="" || contentInput==""){
                            return;
                        }
                        
                        let id = UUID()
                        
                        if let data = image?.pngData() {
                            noteData.saveImage(id: id, data: data)
                        }
                        
                        
                        let newNote = Note(
                            id: id,
                            title: titleInput,
                            content: contentInput,
                            imageURLAppendix: image == nil ? nil : "\(id).png"
                        )
                        
                        noteData.notes.insert(newNote, at: 0)
                        noteData.saveNotes()
                        
                        titleInput = ""
                        contentInput = ""
                        image = nil
                        
                    }label: {
                        RoundButton(text: "ADD", image: "plus.diamond.fill")
                    }
                }
            }.padding()
            
            
            
            List{
                ForEach(noteData.notes){ note in
                    HStack{
                        if note.imageURLAppendix != nil {
                            Image(uiImage: noteData.getImage(note.imageURLAppendix!))
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 60,height: 60)
                                .cornerRadius(100)
                        }
                        
                        VStack(alignment: .center, spacing: 10){
                            Text(note.title).font(.title3).bold()
                            
                            Text(note.content).foregroundColor(.gray)
                        }
                    }
                    
                    
                    
                    
                }
                .onDelete(perform: delete)
            }
            .listStyle(SidebarListStyle())
        }
        // .navigationBarTitle("N", displayMode: .inline)
        .navigationTitle("Note")
        
        
    }
}

#Preview {
    NoteView()
}
