//
//  DevITjobsView.swift
//  lab5_Jiaxuan_Cao
//
//  Created by Jiaxuan on 10/13/24.
//

import SwiftUI

struct Job: Decodable {
    let jobUrl: String
    let cityCategory: String
    let stateCategory: String
    let tier: String
    let companyType: String
    let hasVisaSponsorship: String
    let name: String
    let company: String
    let jobType: String
    let annualSalaryFrom: Int?
    let annualSalaryTo: Int?
    
    enum CodingKeys: String, CodingKey {
        case jobUrl = "jobUrl"
        case cityCategory = "cityCategory"
        case stateCategory = "stateCategory"
        case tier = "tier"
        case companyType = "companyType"
        case hasVisaSponsorship = "hasVisaSponsorship"
        case name = "name"
        case company = "company"
        case jobType = "jobType"
        case annualSalaryFrom = "annualSalaryFrom"
        case annualSalaryTo = "annualSalaryTo"
    }
}

struct DevITjobsView: View {
    @State private var jobs = [Job]()
    
    var body: some View {
        List(jobs, id: \..jobUrl) { job in
            VStack(alignment: .leading) {
                Text("Job Title: \(job.name)")
                    .font(.headline)
                    .foregroundColor(.cyan)
                Text("Company: \(job.company)")
                    .font(.body)
                    .foregroundColor(.indigo)
                Text("City: \(job.cityCategory)")
                    .font(.body)
                    .foregroundColor(.indigo)
                Text("State: \(job.stateCategory)")
                    .font(.body)
                    .foregroundColor(.indigo)
                Text("Tier: \(job.tier)")
                    .font(.body)
                    .foregroundColor(.indigo)
                Text("Company Type: \(job.companyType)")
                    .font(.body)
                    .foregroundColor(.indigo)
                Text("Visa Sponsorship: \(job.hasVisaSponsorship)")
                    .font(.body)
                    .foregroundColor(.indigo)
                Text("Job Type: \(job.jobType)")
                    .font(.body)
                    .foregroundColor(.indigo)
                if let salaryFrom = job.annualSalaryFrom, let salaryTo = job.annualSalaryTo {
                    Text("Salary: \(salaryFrom) - \(salaryTo)")
                        .font(.body)
                        .foregroundColor(.indigo)
                }
            }
        }
        .navigationTitle("Find an IT Job")
        .task {
            await fetchjobsData()
        }
    }
    
    func fetchjobsData() async {
            guard let url = URL(string: "https://devitjobs.com/api/jobsLight") else {
                print("Hey Man, THIS URL DOES NOT WORK!")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Raw JSON response: \(jsonString)")
                }
                if let decodedResponse = try? JSONDecoder().decode([Job].self, from: data) {
                    jobs = decodedResponse
                } else {
                    print("Decoding failed")
                }
            } catch {
                print("Failed to fetch data: \(error.localizedDescription)")
            }
        }
    }

    struct DevITjobsView_Previews: PreviewProvider {
        static var previews: some View {
            DevITjobsView()
        }
    }
