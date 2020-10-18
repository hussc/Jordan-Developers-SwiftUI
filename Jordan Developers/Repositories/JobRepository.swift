//
//  JobRepository.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/17/20.
//

import Foundation
import Combine

protocol JobRepository {
    
    /**
     Returns a list of jobs available
     */
    func getJobs() -> AnyPublisher<[Job], Error>
    
    /**
     Returns the details for the job, especially filling the description
     */
    func getDetails(for job: Job) -> AnyPublisher<Job, Error> 
    
    /**
     gets the apply details for a job
     */
    func apply(to job: Job) -> AnyPublisher<JobApplyDetails, Error>
}

