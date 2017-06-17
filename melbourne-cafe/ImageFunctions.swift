//
//  UploadImage.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 9/6/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import Foundation
import Alamofire

class ImageFunctions {
    private var _serverResponse: String!
    
    var _image: UIImage!
    
    
    var serverResonse: String {
        get {
            if _serverResponse == nil {
                _serverResponse = ""
            }
            
            return _serverResponse
        }
    }
    
    func uploadImage(image: UIImage, email: String, complete: @escaping ()->()) {
        
        let imageData = UIImageJPEGRepresentation(image, 0.2)!
        
        let parameters = [
            "Email": email
        ]
        
        let imageName = email + ".jpeg"
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imageData, withName: "fileToUpload",fileName: imageName, mimeType: "image/jpeg")
            for (key, value) in parameters {
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
            }
        },
                         to: UPLOAD_IMAGE_URL)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (progress) in
                    print("Upload Progress: \(progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    print(response.result.value!)
                }
                
            case .failure(let encodingError):
                print(encodingError)
            }
            
            complete()
            
            
        }
    }
    
        func loadImage(url: String, complete: @escaping ()->()) {
            Alamofire.request(url, method: .get).responseData { response in
                if let data = response.result.value {
                    let image = UIImage(data: data)!
                    self._image = image
                    print("load image successfully")
                } else {
                    print("error")
                }
                complete()
            }
        }
    
    
}
