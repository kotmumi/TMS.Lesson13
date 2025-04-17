//
//  SettingViewController.swift
//  Lesson13_Kotylo
//
//  Created by Кирилл Котыло on 15.04.25.
//

import UIKit

class SettingViewController: UIViewController {
    
    private let maxHeight: CGFloat = 32
    private let minHeight: CGFloat = 0
    private var newHeight: CGFloat = 32
    
    private let data = Data()
    private let settingView = SettingView()
    
    override func loadView() {
        view = settingView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        settingView.settingsTableView.delegate = self
        settingView.settingsTableView.dataSource = self
        
        settingView.settingsTableView.register(AcountCell.self, forCellReuseIdentifier: AcountCell.identifier)
        settingView.settingsTableView.register(DefaultCell.self, forCellReuseIdentifier:
                                            "DefaultCell")
        settingView.settingsTableView.register(LabelCell.self, forCellReuseIdentifier: "LabelCell")
        settingView.settingsTableView.register(SwitchCell.self, forCellReuseIdentifier: "SwitchCell")
        settingView.settingsTableView.register(SearchCell.self, forCellReuseIdentifier: "SearchCell")
    }
}
// MARK: - TableViewDataSource
extension SettingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        data.sections.count
    }
    // MARK: - numberOfRowsInSectiom
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.sections[section].type.count
    }
    // MARK: - cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = data.sections[indexPath.section].type[indexPath.row]
        
        let maskCorner: CACornerMask = cornerRadiusMask(index: indexPath.row, countRowsInSection: tableView.numberOfRows(inSection: indexPath.section))
                
        switch item {
        case .acountItem(model: let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AcountCell.identifier, for: indexPath) as? AcountCell else { return UITableViewCell()}
            cell.setConfig(item: model, maskCorner: maskCorner)
            return cell
        case .switchItem(model: let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as? SwitchCell else { return UITableViewCell()}
            cell.setConfig(item: model, maskCorner: maskCorner)
            return cell
        case .lableItem(model: let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as? LabelCell else { return UITableViewCell()}
            cell.setConfig(item: model, maskCorner: maskCorner)
            return cell
        case .defaultItem(model: let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath) as? DefaultCell else { return UITableViewCell()}
            cell.setConfig(item: model, maskCorner: maskCorner)
            return cell
        case .searchItem(model: _):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as? SearchCell else { return UITableViewCell()}
            return cell
        }
    }
// MARK: - HeightForHeaderInSection
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
           return 8
       }
// MARK: - ViewForHeaderInSection
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
      }
}
// MARK: -TableViewDelegat
extension SettingViewController: UITableViewDelegate {
    // MARK: - ScrollViewDidEndDragging
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        guard let tableView = scrollView as? UITableView else { return }
        
        tableView.visibleCells.forEach { cell in
            guard let resizableCell = cell as? SearchCell else { return }
            
            if newHeight < maxHeight/5 {
                newHeight = 0
            } else {
                newHeight = maxHeight
                UIView.animate(withDuration: 0.8) {
                    scrollView.contentOffset.y = -self.view.safeAreaLayoutGuide.layoutFrame.minY
                }
            }
            resizeCell(cell: resizableCell)
        }
    }
    // MARK: - ScrollViewDidScroll
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
 
        let offsetY = view.safeAreaLayoutGuide.layoutFrame.minY + scrollView.contentOffset.y
         newHeight = max(minHeight, maxHeight - offsetY)
        if newHeight < 0 {
            newHeight = 0
        } else if newHeight > maxHeight {
            newHeight = maxHeight
        }
        
        guard let tableView = scrollView as? UITableView else { return }
        
        tableView.visibleCells.forEach { cell in
            guard let resizableCell = cell as? SearchCell else { return }

            if offsetY > view.safeAreaLayoutGuide.layoutFrame.minY {
                navigationItem.title = "Настройки"
            } else {
                navigationItem.title = ""
            }
            resizeCell(cell: resizableCell)
        }
    }
    // MARK: - DidSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
        let item = data.sections[indexPath.section].type[indexPath.row]
        var title = ""
        switch item {
        case .acountItem(model: let model):
            title = model.title
        case .defaultItem(model: let model):
            title = model.title
        case .switchItem(model: _):
            guard let cell = tableView.cellForRow(at: indexPath) as? SwitchCell else {return}
                cell.switchControl.setOn(!cell.switchControl.isOn, animated: true)
            return
        case .lableItem(model: let model):
            title = model.title
        case .searchItem(model: _):
            return
        }
        present(NewViewController(title: title), animated: true)
       }
}
// MARK: - resize Cell and Corner mask
extension SettingViewController {
    
    private func resizeCell(cell: SearchCell) {
        cell.topAnchorConstraint.constant = 40 - newHeight
        self.view.layoutIfNeeded()
        if newHeight == 0 {
            cell.search.isHidden = true
        } else { cell.search.isHidden = false }
        cell.heightConstraint.constant = newHeight
        UIView.animate(withDuration: 0.8) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func cornerRadiusMask(index: Int, countRowsInSection: Int) -> CACornerMask {
        if index == 0 {
            if countRowsInSection == 1 {
                return [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            } else {
                return [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            }
        } else if index == countRowsInSection - 1 {
            return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        return []
    }
}
