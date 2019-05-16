//
// SwiftGen
//
//  Copyright © 2019 The Home Assistant Authors
//  Licensed under the Apache 2.0 license
//  For more information see https://github.com/home-assistant/Iconic
//

import Commander
import PathKit
import GenumKit
import Stencil

let iconsCommand = command(
    outputOption,
    templateOption("icons"), templatePathOption,
    Option<String>("enumName", "Icon", flag: "e", description: "The name of the enum to generate"),
    Argument<Path>("FILE", description: "Icons.ttf|otf|json file to parse.", validator: fileExists)
) { output, templateName, templatePath, enumName, path in

    let filePath = String(path)

    let parser: IconsFileParser
    switch path.`extension` {
    case "ttf"?:
        let textParser = IconsFontFileParser()
        try textParser.parseFile(filePath)
        parser = textParser
    case "otf"?:
        let textParser = IconsFontFileParser()
        try textParser.parseFile(filePath)
        parser = textParser
    case "json"?:
        let textParser = IconsJSONFileParser()
        try textParser.parseFile(filePath)
        parser = textParser
    default:
        throw ArgumentError.InvalidType(value: filePath, type: "TTF, OTF or JSON file", argument: nil)
    }

    do {
        let templateRealPath = try findTemplate("icons", templateShortName: templateName, templateFullPath: templatePath)
        let template = try GenumTemplate(path: templateRealPath)
        let context = parser.stencilContext(enumName: enumName, familyName: parser.familyName)
        let rendered = try template.render(context)
        output.write(rendered, onlyIfChanged: true)

        func writeJSONData(data: NSData) {
            if let jsonString = String(data: data, encoding: NSASCIIStringEncoding) {
                switch output {
                case .Console: return
                case .File(let path):
                    do {
                        guard let jsonPath = ((path.description as NSString).stringByDeletingPathExtension as NSString).stringByAppendingPathExtension("json") else {
                            return print("Not writing the file as content is unchanged")
                        }
                        let jsonOutput = Path(jsonPath)
                        try jsonOutput.write(jsonString)
                        print("File written: \(jsonPath)")
                    } catch let e as NSError {
                        print("Error: \(e)")
                    }
                }
            }
        }

        var unicodes = [String: String]()

        for key in Array(parser.icons.keys) {
            let name = try! StringFilters.snakeToCamelCase(key) as? String

            if let name = name {
                unicodes[name] = parser.icons[key]
            }
        }

        let dict:[String: AnyObject] = ["filename": path.lastComponent,
                                        "name": path.lastComponentWithoutExtension,
                                        "unicodes": unicodes]

        let jsonData = try NSJSONSerialization.dataWithJSONObject(dict, options: .PrettyPrinted)
        writeJSONData(jsonData)
    }
    catch {
        print("Failed to render template \(error)")
    }
}
