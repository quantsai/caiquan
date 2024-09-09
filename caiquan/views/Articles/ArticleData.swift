//
//  ArticleData.swift
//  caiquan
//
//  Created by 蔡铨 on 2024/9/6.
//

import Foundation
import SwiftUI

// Model
struct Article: Codable, Identifiable {
    var id:UUID
    var title:String
    var content:String
    var imageURLAppendix: String?
}

// ModelView
class ArticleData: ObservableObject {
    @Published var notes:[Article] = []
    
    static let sandboxURL = FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask
    )[0]
    let notesURL = sandboxURL.appendingPathComponent("notes.json")
    
    init() {
       notes = getNotes()
    }
    
    func getNotes()->[Article] {
        var result: [Article] = []
        
        if FileManager.default.fileExists(atPath: notesURL.path){
            let data = try! Data(contentsOf: notesURL)
            result = try! JSONDecoder().decode([Article].self, from: data)
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
        let url = ArticleData.sandboxURL.appendingPathComponent(imageURLAppendix)
        // 读取文件数据
        let imageData = try! Data(contentsOf: url)
        // 将数据生成图片
        return UIImage(data: imageData, scale: 1)! // 此处用于预览，缩小0.5倍
        
        
    }
    
    func saveImage(id:UUID, data:Data){
        DispatchQueue.global(qos: .userInitiated).async {
            let url = ArticleData.sandboxURL.appendingPathComponent("\(id).png")
            
            try? data.write(to: url)
        }
    }
    
    
}

