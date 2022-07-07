//
//  ImageService.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/05/14.
//

import Alamofire
import UIKit

class ImageService {
    static let shared = ImageService()
    private init() {}
    
    
    // 이미지 함수
    func getImage(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.imageURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let parameter: Parameters = ["page": 1, "limit": 4]
        
        let dataRequest = AF.request(url,
                                     method: .get,
                                     parameters: parameter,
                                     encoding: URLEncoding.default,
                                     headers: header)
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let stausCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = NetworkHelper.parseJSON(by: stausCode, data: value, type: [ImageResponse].self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
