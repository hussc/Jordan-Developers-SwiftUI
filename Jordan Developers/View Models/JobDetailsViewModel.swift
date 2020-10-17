//
//  JobDetailsViewModel.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/16/20.
//

import Foundation
import Combine
import Resolver

class JobDetailsViewModel: Identifiable, ObservableObject {
        
    @LazyInjected var repository: JobRepository
    
    @Published var job: Job
    @Published var description: String = ""
    @Published var link: JobApplyDetails?
    
    var id: Int = -1
   
    private var cancellables = Set<AnyCancellable>()
    
    init(job: Job){
        self.job = job
        
        $job.compactMap { $0.id }
          .assign(to: \.id, on: self)
          .store(in: &cancellables)
        
        $job.compactMap { $0.description }
            .assign(to: \.description, on: self)
            .store(in: &cancellables)
        
        $job.sink { (job) in
            self.repository.apply(to: job, completion: self.apply)
            }
        .store(in: &cancellables)
        
        self.repository.getDetails(for: job) { (result) in
            if case .success(let newJob) = result {
                self.job = newJob
            }
        }
    }
    
    func apply(_ result: Result<JobApplyDetails, Error>){
        if case .success(let link) = result {
            self.link = link
        }
    }
}
