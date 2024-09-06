//
//  NoteData.swift
//  sccApp
//
//  Created by 蔡铨 on 2024/9/5.
//

import Foundation
import SwiftUI


// Model
struct Note: Codable, Identifiable {
    var id:UUID
    var title:String
    var content:String
    var imageURLAppendix: String?
}

// ModelView
class NoteData: ObservableObject {
    @Published var notes:[Note] = []
    
    static let sandboxURL = FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask
    )[0]
    let notesURL = sandboxURL.appendingPathComponent("notes.json")
    
    init() {
       notes = getNotes()
    }
    
    func getNotes()->[Note] {
        var result: [Note] = []
        
        if FileManager.default.fileExists(atPath: notesURL.path){
            let data = try! Data(contentsOf: notesURL)
            result = try! JSONDecoder().decode([Note].self, from: data)
        }
        
        return result;
    }
    
    func saveNotes(){
        
        // 放后台线程操作
        DispatchQueue.global(qos: .userInitiated).async {
            let data = try? JSONEncoder().encode(self.notes)
            try? data?.write(to: self.notesURL)
        }
    }
    
    
    func getImage(_ imageURLAppendix:String)->UIImage{
        let url = NoteData.sandboxURL.appendingPathComponent(imageURLAppendix)
        // 读取文件数据
        let imageData = try! Data(contentsOf: url)
        // 将数据生成图片
        return UIImage(data: imageData, scale: 1)! // 此处用于预览，缩小0.5倍
        
        
    }
    
    func saveImage(id:UUID, data:Data){
        DispatchQueue.global(qos: .userInitiated).async {
            let url = NoteData.sandboxURL.appendingPathComponent("\(id).png")
            
            try? data.write(to: url)
        }
    }
    
    
}
