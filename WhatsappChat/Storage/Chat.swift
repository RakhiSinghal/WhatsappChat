//
//  Chat.swift
//  WhatsappChat
//
//  Created by Rakhi Singhal on 30/05/24.
//

import Foundation
import CoreData
import UIKit
class Chat: NSManagedObject, Identifiable {
  @NSManaged var imagePath: String?
  @NSManaged var name: String
  @NSManaged var mesage: String
  @NSManaged var date: Date
  
  /// Convenience to load a `UIImage` from a path.
  var albumCover: UIImage? {
    guard let path = imagePath else {
      return nil
    }

    let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
                                                      in: .userDomainMask).first!
    let url = documentsDirectory.appendingPathComponent(path)
    guard let data = try? Data(contentsOf: url) else {
      return nil
    }

    return UIImage(data: data)
  }
  
  /// Stores an image in the documents directory and assigns `imagePath`
  /// - Parameter image: The `UIImage` to store and assign.
  func setAlbumCover(_ image: UIImage) {
    guard let jpeg = image.jpegData(compressionQuality: 1) else {
      return
    }
    
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
                                                      in: .userDomainMask).first!
    
    if let oldFile = imagePath {
      let oldPath = documentsDirectory.appendingPathComponent(oldFile).path
      if FileManager.default.fileExists(atPath: oldPath) {
        try? FileManager.default.removeItem(atPath: oldPath)
      }
    }
    
    let path = "\(UUID().uuidString).jpeg"
    
    let url = documentsDirectory.appendingPathComponent(path)
    do {
      try jpeg.write(to: url)
      imagePath = path
    } catch {
      imagePath = nil
      print(error)
    }
  }
  
  /// Allows us to set default values for properties in our model as soon as we insert a managed object into a context
  override public func awakeFromInsert() {
    super.awakeFromInsert()
      date = Date()
  }
}
//MARK: fetch requests
extension Chat {
  static func fetchRequest() -> NSFetchRequest<Chat> {
    return NSFetchRequest(entityName: "ChatEntity")
  }

  static var sortedByName: NSFetchRequest<Chat> {
    let request: NSFetchRequest<Chat> = fetchRequest()

    request.sortDescriptors = [
      NSSortDescriptor(keyPath: \Chat.name, ascending: true)
    ]
    return request
  }
}

