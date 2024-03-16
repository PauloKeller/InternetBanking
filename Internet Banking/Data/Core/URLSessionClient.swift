//
//  URLSessionClient.swift
//  Internet Banking
//
//  Created by Paulo Keller on 16/03/24.
//

import Foundation

protocol URLSessionClientProtocol {
  var session: URLSession { get }
  func request(parameters: URLSessionRequestParameters, completion: @escaping URLSessionClientCompletion)
}

struct URLSessionRequestParameters {
  var path: String
  var method: HTTPMethod
  var headers: [HTTPHeader]?
  var body: Data?
  var queryItems: [URLQueryItem]?
}

enum URLSessionError: Error {
  case invalidURL
  case requestFailed
  case decodingFailure
}

struct HTTPHeader {
  let field: String
  let value: String
}

enum HTTPMethod: String {
  case get = "GET"
  case put = "PUT"
  case post = "POST"
  case delete = "DELETE"
  case head = "HEAD"
  case options = "OPTIONS"
  case trace = "TRACE"
  case connect = "CONNECT"
}

struct URLSessionResponse<Body> {
  let statusCode: Int
  let body: Body
}

extension URLSessionResponse where Body == Data? {
    func decode<BodyType: Decodable>(to type: BodyType.Type) throws -> URLSessionResponse<BodyType> {
        guard let data = body else {
            throw URLSessionError.decodingFailure
        }
        let decodedJSON = try JSONDecoder().decode(BodyType.self, from: data)
        return URLSessionResponse<BodyType>(statusCode: self.statusCode, body: decodedJSON)
    }
}

enum APIResult<T> {
  case success(URLSessionResponse<T>)
  case failure(URLSessionError)
}

typealias URLSessionClientCompletion = (APIResult<Data?>) -> Void

class URLSessionClient {
  private(set) var session: URLSession
  var baseURL: URL
  
  init (baseURL: URL, session: URLSession = URLSession.shared) {
    self.baseURL = baseURL
    self.session = session
  }
}

extension URLSessionClient: URLSessionClientProtocol {
  func request(parameters: URLSessionRequestParameters, completion: @escaping URLSessionClientCompletion) {
    var urlComponents = URLComponents()
    urlComponents.scheme = baseURL.scheme
    urlComponents.host = baseURL.host
    urlComponents.path = baseURL.path
    urlComponents.queryItems = parameters.queryItems
    
    guard let url = urlComponents.url?.appendingPathComponent(parameters.path) else {
      completion(.failure(.invalidURL)); return
    }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = parameters.method.rawValue
    urlRequest.httpBody = parameters.body
    
    parameters.headers?.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.field) }
    
    let task = session.dataTask(with: url) { (data, response, error) in
      guard let httpResponse = response as? HTTPURLResponse else {
        completion(.failure(.requestFailed)); return
      }
      completion(.success(URLSessionResponse<Data?>(statusCode: httpResponse.statusCode, body: data)))
    }
    task.resume()
  }
}


