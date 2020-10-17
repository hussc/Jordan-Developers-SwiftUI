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
    func getJobs(completion: @escaping ((Result<[Job], Error>) -> Void))
    
    /**
     Returns the details for the job, especially filling the description
     */
    func getDetails(for job: Job, completion: @escaping ((Result<Job, Error>) -> Void))
    
    /**
     gets the apply details for a job
     */
    func apply(to job: Job, completion: @escaping ((Result<JobApplyDetails, Error>) -> Void))
}

