//: Foundation Data
// Data è un tipo di dato UInt8
//E' un tipo di value
//FileManager.default -> Creare directory, leggere directory ...

import UIKit
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
//Transform data in string
let content2String = String(bytes: contentFile2!, encoding: .utf8)

try? fm.createFile(atPath: (fileName2?.path)!, contents: contentFile2, attributes: nil)

//Metodo per prendere un imagine tramite url
let imgUrl = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png")

let dataImg = try? Data(contentsOf: imgUrl!)

let pokeImg = UIImage(data: dataImg!)

let dataImg2 = try? UIImagePNGRepresentation(pokeImg!)

let imgFileName = directoryName?.appendingPathComponent("shiny").appendingPathExtension("png")

try? dataImg?.write(to: imgFileName!)







