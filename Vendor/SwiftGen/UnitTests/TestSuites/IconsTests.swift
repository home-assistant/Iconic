//
//  IconsTests.swift
//  SwiftGen
//
//  Created by Ignacio Romero on 5/23/16.
//  Copyright © 2016 AliSoftware. All rights reserved.
//

import XCTest
import GenumKit
import PathKit

class IconsTTFFileTests: XCTestCase {
    
    func testEmpty() {
        let parser = IconsFontFileParser()
        
        let template = GenumTemplate(templateString: fixtureString("icons-default.stencil"))
        let result = try! template.render(parser.stencilContext(familyName: "fontAwesome"))
        
        let expected = self.fixtureString("Icons-Empty.swift.out")
        XCTDiffStrings(result, expected)
    }
    
    func testTTFFileWithDefaults() {
        let parser = IconsFontFileParser()
        do {
            try parser.parseFile(fixturePath("fontAwesome.ttf"))
        } catch {
            XCTFail("Exception while parsing file: \(error)")
        }
        
        let template = GenumTemplate(templateString: fixtureString("icons-default.stencil"))
        let result = try! template.render(parser.stencilContext(familyName: "fontAwesome"))
        
        let expected = self.fixtureString("Icons-File-TTF.swift.out")
        XCTDiffStrings(result, expected)
    }
    
    func testOTFFileWithDefaults() {
        let parser = IconsFontFileParser()
        do {
            try parser.parseFile(fixturePath("fontAwesome.otf"))
        } catch {
            XCTFail("Exception while parsing file: \(error)")
        }
        
        let template = GenumTemplate(templateString: fixtureString("icons-default.stencil"))
        let result = try! template.render(parser.stencilContext(familyName: "fontAwesome"))
        
        let expected = self.fixtureString("Icons-File-OTF.swift.out")
        XCTDiffStrings(result, expected)
    }
}

class IconsJSONFileTests: XCTestCase {
    
    func testEmpty() {
        let parser = IconsJSONFileParser()
        
        let template = GenumTemplate(templateString: fixtureString("icons-default.stencil"))
        let result = try! template.render(parser.stencilContext(familyName: "fontAwesome"))
        
        let expected = self.fixtureString("Icons-Empty.swift.out")
        XCTDiffStrings(result, expected)
    }
    
    func testFileWithDefaults() {
        let parser = IconsJSONFileParser()
        do {
            try parser.parseFile(fixturePath("fontAwesome.json"))
        } catch {
            XCTFail("Exception while parsing file: \(error)")
        }
        
        let template = GenumTemplate(templateString: fixtureString("icons-default.stencil"))
        let result = try! template.render(parser.stencilContext(familyName: "fontAwesome"))
                
        let expected = self.fixtureString("Icons-File-Defaults.swift.out")
        XCTDiffStrings(result, expected)
    }
}
