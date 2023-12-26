//
//  UploadImage.swift
//  HoloiOS
//
//  Created by Jose Ignacio Naranjo on 12/26/23.
//

import UIKit

func uploadImages(_ images:[UIImage]){
    let url  = URL(string:"https://python-experiments-production.up.railway.app/upload")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    
    let uploadTask = URLSession.shared.uploadTask(with:request, from:images){
        data,response,error in
        if let error = error{
            print("Error Uploading image:\(error)")
            return
        }
        guard let response = response as? HTTPURLResponse,
              (200...299).contains(response.statusCode) else{
            print("server error")
            return
        }
        print("Successfully uploaded Image\(images.count)")
    }
    uploadTask.resume()
}
