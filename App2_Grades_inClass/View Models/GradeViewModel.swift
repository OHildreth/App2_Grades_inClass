//
//  GradeViewModel.swift
//  App2_Grades_inClass
//
//  Created by Owen Hildreth on 2/9/24.
//

import Foundation
import SwiftUI


class GradesViewModel: ObservableObject {
    
    var courseResults = CourseResults(withTestData: true)
    
    var students: [Student] = []
    
    @Published var sortOrder: [KeyPathComparator<Student>] = [
        .init(\.name, order: .forward)
    ] {
        didSet {
            self.updateState()
        }
        
    }
    
    func updateState() {
        self.students = Array(courseResults.students.values).sorted(using: sortOrder)
        
    }
    
    init() {
        setNotifications()
        updateState()
    }
    
    private func setNotifications() {
        NotificationCenter.default.addObserver(forName: .studentsDidChange,
                                               object: nil,
                                               queue: nil,
                                               using: studentStateDidChange)
    }
    
    private func studentStateDidChange(_ notification: Notification) {
        self.updateState()
    }
    
    
    
}





