//
//  NetworkManager.swift
//  PokemonLib
//
//  Created by Артур on 16.10.23.
//

import Foundation

class NetworkManager {
    
    private static let defaultSession = URLSession(configuration: .default)
    private static var dataTask: URLSessionDataTask?
    
    static func makeRequest(completion: @escaping (Result<APIResponseModel?, Error>) -> Void) {
        guard var urlComponents = URLComponents(string: APIConstants.baseUrl +  APIConstants.pokemon) else { return }
        
        urlComponents.queryItems = [URLQueryItem(name: APIConstants.offset, value: String(0)),
                                    URLQueryItem(name: APIConstants.limit, value: String(20))]
        
        guard let url = urlComponents.url else { return }
        
        dataTask = defaultSession.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {return print(error!.localizedDescription)}
            
            do {
                let responseResult = try JSONDecoder().decode(APIResponseModel.self, from: data)
                completion(.success(responseResult))
            } catch {
                completion(.failure(error))
            }
            
        }
        
        dataTask?.resume()
    }
    
    static func makePokemonRequest(url: String?, completion: @escaping (Result<PokemonResponseModel?, Error>) -> Void) {
        
        guard let url = URL(string: url ?? "") else { return print("no url: makePokemonRequest")}
        
        dataTask = defaultSession.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {return print(error!.localizedDescription)}
            
            do {
                let responseResult = try JSONDecoder().decode(PokemonResponseModel.self, from: data)
                completion(.success(responseResult))
            } catch {
                completion(.failure(error))
            }
            
        }
        
        dataTask?.resume()
        
    }
}

