//
//  JobsAPIRepository.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/16/20.
//

import Foundation
import Combine

struct ResponseContainer<T> {
    let data: T?
}

extension ResponseContainer: Codable where T: Codable {}

class JobsAPIRepository: JobRepository {
    
    let email = "hus.sc@aol.com"
    let baseURL = URL(string: "https://jordan-developers.com/api/v1")!
    let session: URLSession = URLSession(configuration: .default)
    
    private var cancellables: [AnyCancellable] = []
    
    init(){ }
    
    func getJobs() -> AnyPublisher<[Job], Error> {
        self.publisher(for: baseURL.appendingPathComponent("jobs"))
    }
    
    func getDetails(for job: Job) -> AnyPublisher<Job, Error> {
        publisher(for: baseURL.appendingPathComponent("jobs").appendingPathComponent("\(job.id)"))
    }
    
    func apply(to job: Job) -> AnyPublisher<JobApplyDetails, Error> {
        publisher(for: baseURL.appendingPathComponent("jobs").appendingPathComponent("\(job.id)").appendingPathComponent("apply"),
                method: "POST")
    }
    
    fileprivate func request<T: Codable>(for url: URL, method: String = "GET", completion: @escaping ((Result<T, Error>) -> Void)){
        publisher(for: url, method: method).sink { (response) in
            if case .failure(let error) = response {
                print("Error Recieved: \(error)")
                completion(.failure(error))
            }
        } receiveValue: { (details) in
            completion(.success(details))
        }.store(in: &cancellables)
    }
    
    fileprivate func publisher<T: Codable>(for url: URL, method: String = "GET") -> AnyPublisher<T, Error> {
        var request: URLRequest = .init(url: url)
        
        request.setValue(email, forHTTPHeaderField: "User-Agent")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = method
        
        return session.dataTaskPublisher(for: request)
            .tryMap { element -> Data in
            guard let httpResponse = element.response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else {
                throw URLError(.badServerResponse)
            }
            
            return element.data
        }
        .decode(type: ResponseContainer<T>.self, decoder: JSONDecoder())
            .compactMap(\.data)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
