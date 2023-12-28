//
//  UploadImage.swift
//  HoloiOS
//
//  Created by Jose Ignacio Naranjo on 12/26/23.
//

import UIKit

func uploadImages(_ images:[UIImage]){
    var imageData = [Data]()
    
    for image in images{
        if let data = image.jpegData(compressionQuality:0.5){
            imageData.append(data)
        }
    }
    
    let url  = URL(string:"https://python-experiments-production.up.railway.app/upload")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    let boundary = "Boundary-\(NSUUID().uuidString)"
    request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
    var body = Data() 
    
    for data in imageData{
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"file\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(data)
        body.append("\r\n".data(using: .utf8)!)
    }
    
    body.append("--\(boundary)--\r\n".data(using:.utf8)!)
    request.httpBody = body
    
    let uploadTask = URLSession.shared.uploadTask(with:request, from:nil){
        data,response,error in
        if let error = error{
            print("Error Uploading image:\(error)")
            return
        }
        guard let response = response as? HTTPURLResponse,
              (200...299).contains(response.statusCode) else{
            print(response ?? "x")
            return
        }
        print("Successfully uploaded Image\(images.count)")
    }
    uploadTask.resume()
}
