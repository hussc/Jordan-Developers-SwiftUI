//
//  JobsConstantRepository.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/17/20.
//

import Foundation

class TestDataJobRepository: JobRepository {
    func getJobs(completion: @escaping ((Result<[Job], Error>) -> Void)) {
        
    }
    
    func getDetails(for job: Job, completion: @escaping ((Result<Job, Error>) -> Void)) {
        
    }
    
    func apply(to job: Job, completion: @escaping ((Result<JobApplyDetails, Error>) -> Void)) {
        
    }
}
