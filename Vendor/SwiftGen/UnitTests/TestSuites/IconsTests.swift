//
//  IconsTests.swift
//  SwiftGen
//
//  Copyright © 2019 The Home Assistant Authors
//  Licensed under the Apache 2.0 license
//  For more information see https://github.com/home-assistant/Iconic
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

    func testFontAwesomeFile() {
        let parser = IconsFontFileParser()
        do {
            try parser.parseFile(fixturePath("fontAwesome.ttf"))
        } catch {
            XCTFail("Exception while parsing file: \(error)")
        }

        let template = GenumTemplate(templateString: fixtureString("icons-default.stencil"))
        let result = try! template.render(parser.stencilContext(familyName: "fontAwesome"))

        let expected = self.fixtureString("Icons-FontAwesome.swift.out")
        XCTDiffStrings(result, expected)
    }

    func testFontalokFile() {
        let parser = IconsFontFileParser()
        do {
            try parser.parseFile(fixturePath("fontalok.ttf"))
        } catch {
            XCTFail("Exception while parsing file: \(error)")
        }

        //validate parser
        XCTAssertEqual("fontalok", parser.familyName!)
        XCTAssertEqual(5, parser.icons.count)

        //sanity check
        let template = GenumTemplate(templateString: fixtureString("icons-default.stencil"))
        let result = try! template.render(parser.stencilContext(familyName: "fontalok"))

        let expected = self.fixtureString("Icons-Fontalok.swift.out")
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
