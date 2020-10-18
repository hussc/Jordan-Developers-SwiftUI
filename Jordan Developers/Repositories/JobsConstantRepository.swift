//
//  JobsConstantRepository.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/17/20.
//

import Foundation
import Combine

class TestDataJobRepository: JobRepository {
    func getDetails(for job: Job) -> AnyPublisher<Job, Error> {
        return Just(job).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
    
    func apply(to job: Job) -> AnyPublisher<JobApplyDetails, Error> {
        let sampleDetails = JobApplyDetails(type: .redirect, url: "")
        
        return Just(sampleDetails).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
    
    func getJobs() -> AnyPublisher<[Job], Error> {
        let jobs: [Job] = [
            .sample(),
            .sample(),
            .sample()
        ]
        
        return Just(jobs).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
}
