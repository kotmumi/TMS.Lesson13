//
//  Data.swift
//  Lesson13_Kotylo
//
//  Created by Кирилл Котыло on 13.04.25.
//

import Foundation

struct Data {
//
    let sections: [SettingsItem] = [
        
        SettingsItem(title: "Search", type: [
            .searchItem(model: SearchItem(title: "Настройки"))
        ]),
        
        SettingsItem(title: "Аккаунт", type: [
            .acountItem(model: AccountItem(title: "Кирилл Котыло", discription: "Аккаунт Apple, iCloud+ и другое", image: "person.circle")),
            .lableItem(model: LableItem(title: "Предложения аккаунта Apple", discription: "2", image: ""))
        ]),
        
        SettingsItem(title: "Управление", type: [
            .switchItem(model: SwitchItem(title: "Авиарежим", isOn: false, image: "airplaneMode")),
            .lableItem(model: LableItem(title: "Wi-Fi", discription: "kv11", image: "Wi-Fi")),
            .lableItem(model: LableItem(title: "Bluetooth", discription: "Вкл", image: "bluetooth")),
            .defaultItem(model: DefaultItem(title: "Сотовая связь", image: "cellular-network")),
            .defaultItem(model: DefaultItem(title: "Режим модема", image: "modemMode")),
            .defaultItem(model: DefaultItem(title: "Аккумулятор", image: "battery")),
            .lableItem(model: LableItem(title: "VPN", discription: "Не подключено", image: "vpn")),
            ]),
        
        SettingsItem(title: "Основные", type: [
            .lableItem(model: LableItem(title: "Основные", discription: "1", image: "settings")),
            .defaultItem(model: DefaultItem(title: "Универсальный доступ", image: "human")),
            .defaultItem(model: DefaultItem(title: "Камера", image: "camera")),
            .defaultItem(model: DefaultItem(title: "Обои", image: "wallpaper")),
            .defaultItem(model: DefaultItem(title: "Ожидание", image: "clock")),
            .defaultItem(model: DefaultItem(title: "Поиск", image: "search")),
            .defaultItem(model: DefaultItem(title: "Пункт управления", image: "control")),
            .defaultItem(model: DefaultItem(title: "Экран \"Домой\" и библиотека приложений", image: "homeScreen")),
            .defaultItem(model: DefaultItem(title: "Экран и яркость", image: "brightness")),
            .defaultItem(model: DefaultItem(title: "Siri", image: "siri")),
            ]),
        
        SettingsItem(title: "Уведомления", type: [
            .defaultItem(model: DefaultItem(title: "Уведомления", image: "notifications")),
            .defaultItem(model: DefaultItem(title: "Звуки и вибрация", image: "sound")),
            .defaultItem(model: DefaultItem(title: "Фокусирование", image: "moon")),
            .defaultItem(model: DefaultItem(title: "Экранное время", image: "hourglass")),
            ]),
        
        SettingsItem(title: "Безопасность", type: [
            .defaultItem(model: DefaultItem(title: "Face ID и код-пароль", image: "faceId")),
            .defaultItem(model: DefaultItem(title: "Экстренный вызов - SOS", image: "sos")),
            .defaultItem(model: DefaultItem(title: "Конфиденциальность и безопасность", image: "hand")),
            ]),
        
        SettingsItem(title: "", type: [
            .defaultItem(model: DefaultItem(title: "Game Center", image: "game")),
            .defaultItem(model: DefaultItem(title: "iCloud", image: "icloud")),
            .defaultItem(model: DefaultItem(title: "Wallet и Apple Pay", image: "wallet")),
            ]),
        
        SettingsItem(title: "Приложения", type: [
            .defaultItem(model: DefaultItem(title: "Приложения", image: "apps")),
            ]),
        
        SettingsItem(title: "Разработчик", type: [
            .defaultItem(model: DefaultItem(title: "Разработчик", image: "hammer")),
            ]),
        ]
    }
