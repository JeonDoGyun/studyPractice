//
//  RunPythonScript.swift
//  SwiftSoup-Ex
//
//  Created by 전도균 on 2023/03/28.
//

import Foundation
import PythonKit

func RunPythonScript() -> PythonObject {
    let sys = Python.import("sys")
    sys.path.append("/Users/jeondogyun/Developer/studyPractice/SwiftSoup-Ex/SwiftSoup-Ex/")
    let file = Python.import("print_hello.py")
    let response = file.print_hello()
    print(response)
    return response
}
