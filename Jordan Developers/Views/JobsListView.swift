//
//  JobsListView.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/15/20.
//

import SwiftUI



struct JobsListView: View {

    @ObservedObject var viewModel = JobListViewModel()
   
    @State var isSheetPresented: Bool = false
    @State var itemDetailSelection: Job?
    
    var body: some View {
        switch viewModel.state {
        case .idle, .loading:
            let items = Array(repeating: Job.sample(), count: 5).map { JobCellItemViewModel(job: $0) }
            return AnyView(bodyForContentState(for: items).redacted(reason: .placeholder))
        case .failed(let error):
            return AnyView(
                ErrorView(error: error){
                    self.performTheLoad()
                }
            )
        case .loaded(let items):
            return AnyView(bodyForContentState(for: items).redacted(reason: []))
        }
    }
    
    func bodyForContentState(for viewModels: [JobCellItemViewModel]) -> some View {
        NavigationView {
            ScrollView {
                VStack(spacing: -15) {
                    ForEach(viewModels) { item in
                        JobCell(jobCellVM: item).onTapGesture {
                            self.itemDetailSelection = item.job
                        }
                    }
                }
            }
            .navigationBarTitle("Recent Jobs")
            .sheet(item: $itemDetailSelection, content: { item in
                JobDetailsView(detailsViewModel: .init(job: item)){
                    self.itemDetailSelection = nil
                }
            })
        }
    }
    
    func performTheLoad(){
        self.viewModel.performTheFuckingLoad()
    }
}

struct JobsListView_Previews: PreviewProvider {
    static var previews: some View {
        JobsListView()
    }
}

