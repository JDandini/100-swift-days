//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Javier Castañeda on 20/08/26.
//

import AVFoundation
import CodeScanner
import SwiftData
import SwiftUI

struct ProspectsView: View {
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    @Environment(\.modelContext) var modelContext
    let filter: FilterType
    @State private var isShowingScanner = false
    @State private var selectedProspects = Set<Prospect>()

    var body: some View {
        NavigationStack {
            List(prospects, selection: $selectedProspects) { prospect in
                ProspectListRow(prospect: prospect)
                    .swipeActions {
                        Button("Delete", systemImage: "trash", role: .destructive) {
                            modelContext.delete(prospect)
                        }
                        if prospect.isContacted {
                            Button(
                                "Mark Uncontacted",
                                systemImage: "person.crop.circle.badge.xmark"
                            ) {
                                prospect.isContacted.toggle()
                            }
                            .tint(.blue)
                        } else {
                            Button(
                                "Mark Contacted",
                                systemImage: "person.crop.circle.fill.badge.checkmark"
                            ) {
                                prospect.isContacted.toggle()
                            }
                            .tint(.green)
                        }
                    }
                    .tag(prospect)
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Scan", systemImage: "qrcode.viewfinder") {
                        isShowingScanner = true
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                if selectedProspects.isEmpty == false {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Delete Selected", action: delete)
                    }
                }
            }
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(
                    codeTypes: [.qr],
                    simulatedData: "Paul Hudson\npaul@hackingwithswift.com",
                    completion: handleScan
                )
            }
        }
    }

    var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contacted people"
        case .uncontacted:
            "Uncontacted people"
        }
    }

    init(filter: FilterType) {
        self.filter = filter

        if filter != .none {
            let showContactedOnly = filter == .contacted

            _prospects = Query(
                filter: #Predicate {
                    $0.isContacted == showContactedOnly
                },
                sort: [SortDescriptor(\Prospect.name)]
            )
        }
    }

    private func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }

            let person = Prospect(name: details[0], emailAddress: details[1], isContacted: false)

            modelContext.insert(person)
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
     }

    private func delete() {
        selectedProspects.forEach { prospect in
            modelContext.delete(prospect)
        }
    }
}

extension ProspectsView {
    enum FilterType {
        case none, contacted, uncontacted
    }
}
#Preview {
    ProspectsView(filter: .none)
        .modelContainer(for: Prospect.self)
}
