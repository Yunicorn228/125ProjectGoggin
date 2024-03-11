//
//  HealthManager.swift
//  Goggin
//
//  Created by Zixu Yu on 3/11/24.
//

import Foundation
import HealthKit

extension Date {
    static var startOfDay: Date {
        Calendar.current.startOfDay(for: Date())
    }
}

class HealthManager: ObservableObject{
    
    let healthStore = HKHealthStore()
    
    @Published var cal: String = ""
    @Published var step: String = ""
    @Published var sleep: String = ""
    
    
    init(){
        let steps = HKQuantityType(.stepCount)
        
        let healthTypes: Set = [steps]
        
        Task{
            do{
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
                fetchTodayCal()
                fetchTodaySleep()
                fetchTodaySteps()
            }catch {
                print("Error fetching health data")
            }
        }
    }
    
    func fetchTodaySteps(){
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate){_, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else{
                print("Error feeching todays steps")
                return
            }
            
            let stepCount = quantity.doubleValue(for: .count())
            self.step = stepCount.formattedString() ?? "N/A"
            print(self.step)
        }
        healthStore.execute(query)
        
    }
    
    func fetchTodayCal(){
        let cal = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())

        let query = HKStatisticsQuery(quantityType: cal, quantitySamplePredicate: predicate){_, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else{
                print("Error feeching todays calories")
                return
            }
            
            let calCount = quantity.doubleValue(for: .count())
            self.cal = calCount.formattedString() ?? "N/A"
            print(self.cal)
        }
        healthStore.execute(query)
        
    }
    
    func fetchTodaySleep() {
        guard let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else {
            print("Sleep Analysis is not available in HealthKit")
            return
        }
        
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())

        
        let query = HKSampleQuery(sampleType: sleepType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { _, samples, error in
            guard let sleepSamples = samples as? [HKCategorySample], error == nil else {
                print("Error fetching today's sleep data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            let totalSleepTime = sleepSamples.reduce(0) { (result, sample) -> TimeInterval in
                return result + sample.endDate.timeIntervalSince(sample.startDate)
            }
            
            let totalSleepHours = totalSleepTime / 3600 // Convert seconds to hours
            
            // Update UI by dispatching to the main thread
            DispatchQueue.main.async {
                // Assuming you have a published property for sleep hours in your HealthManager
                self.sleep = totalSleepHours.formattedString() ?? "N/A"
            }
            
            print("Total sleep time for today: \(totalSleepHours) hours")
        }
        
        healthStore.execute(query)
    }


}

extension Double{
    func formattedString() -> String?{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        
        return numberFormatter.string(from: NSNumber(value: self))
    }
}
