//
//  SettingsItem.swift
//  Lesson13_Kotylo
//
//  Created by Кирилл Котыло on 15.04.25.
//

import UIKit

struct SettingsItem {
    let title: String
    let type: [itemType]
}

enum itemType {
    case acountItem(model: AccountItem)
    case switchItem(model: SwitchItem)
    case lableItem(model: LableItem)
    case defaultItem(model: DefaultItem)
    case searchItem(model: SearchItem)
}

struct AccountItem {
    let title: String
    let discription: String
    let image: String
}
struct SwitchItem {
    let title: String
    let isOn: Bool
    let image: String
}
struct LableItem {
    let title: String
    let discription: String
    let image: String
}
struct DefaultItem {
    let title: String
    let image: String
}
struct SearchItem {
    let title: String
}
