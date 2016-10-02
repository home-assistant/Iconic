//
//  IconsFileParser.swift
//  Pods
//
//  Created by Ignacio Romero on 5/23/16.
//
//

import Foundation
import CoreText

public protocol IconsFileParser {
    var familyName:String? { get }
    var icons: [String: String] { get }
}

// MARK: - TTF/OTF File Parser

public final class IconsFontFileParser: IconsFileParser {
    
    public var familyName:String? = ""
    public var icons = [String: String]()
    
    public init() {}
    
    public func parseFile(path: String) throws {
        
        let fileURL = NSURL(fileURLWithPath: path)

        let descs = CTFontManagerCreateFontDescriptorsFromURL(fileURL) as NSArray?
        guard let desc = (descs as? [CTFontDescriptorRef])?.first else {
            print("failed to get font description from \(path)")
            return
        }
        
        let ctFont = CTFontCreateWithFontDescriptorAndOptions(desc, 0.0, nil, [.PreventAutoActivation])
        let characterSet = CTFontCopyCharacterSet(ctFont)
        let cgFont = CTFontCopyGraphicsFont(ctFont, nil)
        
        familyName = CTFontCopyFamilyName(ctFont) as String
        
        
        // Private Use Area (PUA)
        // Defined in https://en.wikipedia.org/wiki/Private_Use_Areas#Assignment
        for unicode in 0xE000...0xF8FF {
            
            let unicodeScalar = UnicodeScalar(unicode)
            let uniChar = UniChar(unicodeScalar.value)
            
            // Checks if the unicode is member of the character set
            if CFCharacterSetIsCharacterMember(characterSet, uniChar) {
                
                var code_point: [UniChar] = [uniChar]
                var glyphs: [CGGlyph] = [0, 0]
                
                // Gets the Glyph
                CTFontGetGlyphsForCharacters(ctFont, &code_point, &glyphs, 1)
                
                if glyphs.count == 0{
                    continue
                }
                
                // Gets the name of the Glyph, to be used as key
                if let name = CGFontCopyGlyphNameForGlyph(cgFont, glyphs[0]) {
                    
                    let key = String(name)
                    let value = String(format:"%X", unicode)
                    
                    icons[key] = value
                } else {
                    print("failed to get glyph name for:\(unicode)")
                }
            }
        }
    }
}

// MARK: - JSON File Parser

public final class IconsJSONFileParser: IconsFileParser {
    
    public var familyName: String?
    public var icons = [String: String]()
    
    public init() {}
    
    public func parseFile(path: String) throws {
        if let JSONdata = NSData(contentsOfFile: path),
            let json = try? NSJSONSerialization.JSONObjectWithData(JSONdata, options: []),
            let dict = json as? [String: String] {
                for (key, value) in dict {
                    icons[key] = value
                }
        }
    }
}
