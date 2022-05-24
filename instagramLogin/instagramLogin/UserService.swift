//
//  UserService.swift
//  instagramLogin
//
//  Created by 황찬미 on 2022/05/12.
//

import Foundation
import Alamofire
import UIKit

class UserService {
    static let shared = UserService()
    private init() {}
    
    // 회원가입 함수
    func signUp(email: String,
                password: String,
                completion: @escaping (NetworkResult<Any>) -> Void)
    {
        // completion 클로저를 @escaping closure로 정의합니다.
        
        // API 명세서에 있는 내용들을 준비하는 단계
        let url = APIConstants.signupURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let body: Parameters = [
            "name": email,
            "email": email,
            "password": password
        ]
        
        // 요청서
        // request 생성
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        // 서버 통신 시작 - Request 시작
        dataRequest.responseData { response in
            // 요청을 하고 넘겨받은 응답의 결과를 가지고 성공 또는 실패 분기 처리를 합니다.
            switch response.result {
            case .success:
                // 성송시에는 상태코드(status code)와 값(value)이 넘어오겠죠?
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                
                // 해당 응답을 통해 case 분기 처리를 한다. 200, 400, 500인지... 200: 성공을 해서 데이터를 잘 받았는지 확인.
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
                // 실패시에는 바로 networkFail라는 신호를 알립니다.
            case .failure:
                completion(.networkFail)
            }
        }
        
        // 상태 코드와 값(value, data)를 가지고 통신의 결과를 핸들링하는 함수
    }
    
    // 로그인 함수
    func login(name: String,
               email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> Void)
    {
        // completion 클로저를 @escaping closure로 정의합니다.
        // API 명세서에 있는 내용들을 준비하는 단계.
        let url = APIConstants.loginURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let body: Parameters = [
            "name": name,
            "email": email,
            "password": password
        ]
        
        // 요청서 - Request 생성
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        // 서버 통신 시작 - Request 시작
        dataRequest.responseData { response in
            // 요청을 넘겨받은 응답의 결과를 가지고 성공 또는 실패 분기 처리를 합니다.
            switch response.result {
            case .success:
                // 성공시에는 상태코드, 값이 넘어온다.
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                print(statusCode)
                print(value)
                
                // 해당 응답을 가지고 분기 처리를 한다. 200, 400, 500인지... 성공을 해서 데이터를 잘 받았는지.
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
                // 실패시에는 바로 networkFail이라는 신호를 알립니다.
            case .failure:
                completion(.networkFail)
            }
            
        }
    }
    
    // 상태 코드와 값(value, data)를 가지고 통신의 결과를 핸들링하는 함수
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
            // 성공시에는 넘겨받은 데이터를 decode하는 함수를 호출합니다.
        case 200: return decodeVaildData(data: data, LoginResponse.self)
        case 201: return decodeVaildData(data: data, SignUpResponse.self)
        case 404: return .pathErr
        case 409: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    // 성공시 넘겨받은 데이터를 decode 하는 함수입니다
    // 이때 우리가 codable을 채택해서 만들어 놓은 구조체 형식의 데이터 모델을 사용합니다.
    private func decodeVaildData<T: Codable>(data: Data,_ object: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(object.self, from: data)
        else { return .pathErr
            print("제발...!")
        }
        
        return .success(decodedData as Any)
    }
}
