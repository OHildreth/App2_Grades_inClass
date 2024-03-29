//
//  CourseResults.swift
//  App2_Grades_inClass
//
//  Created by Owen Hildreth on 2/9/24.
//

import Foundation
import SwiftUI

class CourseResults: ObservableObject {
    var students: [Student.ID : Student] = [:] {
        didSet {
            NotificationCenter.default.post(name: .studentsDidChange, object: self)
        }
    }
    
    var assignmentGroups: [AssignmentGroup.ID : AssignmentGroup] = [:]
}
