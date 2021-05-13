/// The type can read a numbers from the standard input stream in various ways.
///
/// Created by Alexander Svalov on 05.09.2020.
///

import Foundation

class Console {
  
    enum Report: String, Error {
        case NoError = "The input data is correct."
        case IncorrectData = "The input data is not correct."
        case EmptyData = "The input data is empty."
        
        var message: String { rawValue }
        var error: Error { self }
    }
    
    var report: Report

    private var substringIndex: Int = 0
    private var substrings: [Substring] = []

    init() {
        report = Report.NoError
    }

    /// Clears the buffer of the standard input stream.
    func deleteInputSequence() {
        substrings = []
        substringIndex = 0
        report = Report.NoError
    }

    /// Reads a number from the standard input stream.
    func readInt() -> Int? { read{Int($0)} }
    func readUInt() -> UInt? { read{UInt($0)} }
    func readInt64() -> Int64? { read{Int64($0)} }
    func readUInt64() -> UInt64? { read{UInt64($0)} }
    func readFloat() -> Float? { read{Float($0)} }
    func readDouble() -> Double? { read{Double($0)} }
    
    /// Reads a sequence of numbers from the standard input stream.
    func nextInt() -> Int? { readNext{Int($0)} }
    func nextUInt() -> UInt? { readNext{UInt($0)} }
    func nextFloat() -> Float? { readNext{Float($0)} }
    func nextDouble() -> Double? { readNext{Double($0)} }

    /// Reads an array of numbers from the standard input stream.
    func readIntArray() -> [Int?] { readNumberArray{Int($0)} }
    func readUIntArray() -> [UInt?] { readNumberArray{UInt($0)} }
    func readFloatArray() -> [Float?] { readNumberArray{Float($0)} }
    func readDoubleArray() -> [Double?] { readNumberArray{Double($0)} }
    
    /// Reads a generic number from the standard input stream.
    private func read<T>(_ convert: (String) -> T?) -> T? {
        substringIndex = 0
        if var line = readLine() {
            line = line.trimmingCharacters(in: .whitespaces)
            if line.isEmpty {
                report = Report.EmptyData
                return nil
            }
            if let number = convert(line) {
                report = Report.NoError
                return number
            }
        }
        report = Report.IncorrectData
        return nil
    }

    /// Creates an array of substrings from the standard input stream.
    private func readSubstrings() -> [Substring] {
        substringIndex = 0
        var result: [Substring] = []
        if var line = readLine() {
            line = line.trimmingCharacters(in: .whitespaces)
            result = line.split(separator: "\u{20}")
        }
        return result
    }

    /// Reads the next number from a sequence.
    private func readNext<T>(_ convert: (String) -> T?) -> T? {
        if substringIndex == 0 {
            report = Report.NoError
            substrings = readSubstrings()
            if substrings.isEmpty {
                report = Report.EmptyData
                return nil
            }
        }

        let currentNumber = String(substrings[substringIndex])
        if substringIndex < substrings.count - 1 {
            substringIndex += 1
        } else {
            substringIndex = 0
        }
        
        if let number = convert(currentNumber) {
            return number
        }
        report = Report.IncorrectData
        return nil
    }

    /// Returns an array of numbers from the standard input stream.
    private func readNumberArray<T>(_ convert: (String) -> T?) -> [T?] {
        report = Report.NoError
        var result: [T?] = []
        let substrings = readSubstrings()
        if substrings.isEmpty {
            report = Report.EmptyData
            return result
        }
        for substring in substrings {
            if let number = convert(String(substring)) {
                result.append(number)
            } else {
                report = Report.IncorrectData
                result.append(nil)
            }
        }
        return result
    }
}
