//
//  DIYItems.swift
//  VirtualDIY
//
//  Created by STDC_6 on 22/12/2024.
//

import SwiftUI
import Foundation

// Model for DIY Item
struct DIYItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let materials: [String]
    let tutorialURL: URL
}

// Sample DIY Items Data
let diyItems: [DIYItem] = [
    DIYItem(
        title: "Wood Sofa Bed",
        imageName: "WoodSofa",
        materials: [
            "(6) 2 x 12 Southern yellow pine",
            "(5) 2 x 3 lumber",
            "(6) 1 x 4 lumber",
            "1/2-inch dowels",
            "Lots of screws",
            "Wood glue"
        ],
        tutorialURL: URL(string: "https://youtu.be/jPXwq0enhvE?si=Qh8Pm2Pe8l-3uiQ_")!
    ),
    DIYItem(
        title: "Twin Bunk Bed",
        imageName: "bunkbed",
        materials: [
            "2x4s, 2x6s, and plywood sheets",
            "Screws and Bolts",
            "Wood Glue",
            "Sandpaper or Sander",
            "Safety Railings",
            "Ladder Materials: Additional lumber & screws"
        ],
        tutorialURL: URL(string: "https://youtu.be/EzQTtEqP-8o?si=oOayHtZmBBHuDc9Q")!
    ),
    DIYItem(
        title: "Simple Dresser",
        imageName: "simpledresser",
        materials: [
            "3/4' plywood for the dresser frame and drawer fronts",
            "1/4' plywood for the drawer bottoms and back panel",
            "2x2 boards for the dresser frame",
            "1x2 boards for drawer supports and guides",
            "Drawer slides (16' recommended)",
            "Handles or knobs for the drawers",
            "Pocket hole screws (1 1/4' and 2 1/2')",
            "Wood screws for assembly",
            "1 1/4' finish nails",
            "Wood glue"
        ],
        tutorialURL: URL(string: "https://youtu.be/faObh6a7kAc?si=XG2sO9Q5L0NSrzig")!
    ),
    DIYItem(
        title: "Origami Suprise Box",
        imageName: "surprisebox",
        materials: [
            "Colored Paper",
            "Scissors",
            "Glue or Double-Sided Tape",
            "Ruler",
            "Pencil",
            "Decorative Elements (optional)"
        ],
        tutorialURL: URL(string: "https://youtu.be/zH33mzDF__o?si=gjbKdL1aLvXhoEWr")!
    ),
    DIYItem(
        title: "Plastic Planter Pot",
        imageName: "planterpot",
        materials: [
            "Plastic Bottles",
            "Cutting Tools",
            "Paints and Brushes",
            "Sandpaper",
            "Soil and Plants"
        ],
        tutorialURL: URL(string: "https://youtu.be/pewsevBPKK8?si=ShYr4q5Sg3e5IUbU ")!
    ),
    DIYItem(
        title: "Kids Finger Knitting",
        imageName: "fingerknit",
        materials: ["Yarn"],
        tutorialURL: URL(string: "https://youtu.be/BC4efJK4hd0?si=vN_vAsNxQWELBcOX ")!
    ),
    DIYItem(
        title: "Ceiling Fan Self-repair",
        imageName: "ceilingfan",
        materials: [
            "Replacement Capacitor",
            "Screwdriver Set",
            "Multimeter",
            "Insulated Pliers",
            "Electrical Tape",
            "Ladder or Step Stool",
            "Safety Gear"
        ],
        tutorialURL: URL(string: "https://youtu.be/xD67mpLm-Ys?si=hdLH2rm51UMKhS4- ")!
    ),
    DIYItem(
        title: "RFID Door Lock System",
        imageName: "rfidlockdoor",
        materials: [
            "Arduino Board",
            "RFID Reader Module",
            "RFID Tags/Cards",
            "Servo Motor",
            "Breadboard and Jumper Wires",
            "Power Supply",
            "Resistors and LEDs (optional)"
        ],
        tutorialURL: URL(string: "https://youtu.be/GOO84CGBPz8?si=e7-KcWo422CbTg39")!
    ),
    DIYItem(
        title: "Automated Watering System",
        imageName: "wateringsystem",
        materials: [
            "Arduino Board",
            "RFID Reader Module (e.g., MFRC522)",
            "RFID Tags/Cards",
            "Servo Motor (e.g., SG90 Micro-servo)",
            "Breadboard and Jumper Wires",
            "LEDs (Red and Green)",
            "Buzzer",
            "Power Supply",
            "Resistors"
        ],
        tutorialURL: URL(string: "https://youtu.be/ciD3ILxgXzU?si=Jc2x-aabr9hXZEUc")!
    )
]

