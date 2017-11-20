//: Foundation Data
// Data è un tipo di dato UInt8
//E' un tipo di value
//FileManager.default -> Creare directory, leggere directory ...

import Foundation
let fm = FileManager.default
let docDirectories = fm.urls(for: .documentDirectory, in: .userDomainMask)

let docDirectory = docDirectories.first
let docDirectory2 = try? fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)

let directoryName = docDirectory2?.appendingPathComponent("image", isDirectory: true)

if !fm.fileExists(atPath: (directoryName?.path)!){
    do{
    try fm.createDirectory(at: directoryName!, withIntermediateDirectories: false)
    }catch{
        let errorMsg = error
        print(errorMsg)
    }
}

//Metodo 1 per creare file scrivendo da string
let content = "Hello World"
let fileName = directoryName?.appendingPathComponent("helloworld").appendingPathExtension("txt")

fileName?.path

try? content.write(to: fileName!, atomically: true, encoding: .utf8)

//Metodo 2 per creare file usando Data
let fileName2 = directoryName?.appendingPathComponent("helloworld2").appendingPathExtension("txt")
fileName?.path
let contentFile2 = try? Data(contentsOf: fileName!)

try? fm.createFile(atPath: (fileName2?.path)!, contents: contentFile2, attributes: nil)




