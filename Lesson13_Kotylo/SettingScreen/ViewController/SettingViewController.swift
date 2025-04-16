//
//  SettingViewController.swift
//  Lesson13_Kotylo
//
//  Created by Кирилл Котыло on 15.04.25.
//

import UIKit

class SettingViewController: UIViewController {
    
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
        settingView.settingsTableView.register(AcountCell.self, forCellReuseIdentifier: AcountCell.identifier)
        settingView.settingsTableView.register(DefaultCell.self, forCellReuseIdentifier:
                                            "DefaultCell")
        settingView.settingsTableView.register(LabelCell.self, forCellReuseIdentifier: "LabelCell")
        settingView.settingsTableView.register(SwitchCell.self, forCellReuseIdentifier: "SwitchCell")
        settingView.settingsTableView.register(SearchCell.self, forCellReuseIdentifier: "SearchCell")
    }
}
// MARK: - extension
extension SettingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        data.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.sections[section].type.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
           return 8
       }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
      }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = data.sections[indexPath.section].type[indexPath.row]
        
        var maskCorner: CACornerMask = []
                
        if indexPath.row == 0 {
            if tableView.numberOfRows(inSection: indexPath.section) == 1 {
                maskCorner = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            } else {
                maskCorner = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            }
        } else if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            maskCorner = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        
      // print("section:\(indexPath.section) row:\(indexPath.row)")
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
}

extension SettingViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
 
        let maxHeight: CGFloat = 32
        let minHeight: CGFloat = 0
        let offsetY = view.safeAreaLayoutGuide.layoutFrame.minY + scrollView.contentOffset.y
        //print("offsetY: \(offsetY)")
        var newHeight = max(minHeight, maxHeight - offsetY)
        if newHeight < 0 {
            newHeight = 0
        } else if newHeight > maxHeight {
            newHeight = maxHeight
        }
        //print ("newHeight: \(newHeight)")
        
        guard let tableView = scrollView as? UITableView else { return }
        
        tableView.visibleCells.forEach { cell in
            guard let resizableCell = cell as? SearchCell else { return }
           // resizableCell.frame.size = CGSize(width: resizableCell.frame.width, height: newHeight)
            //print("frameCell: \(offsetY)")
            //print("safeArea: \(view.safeAreaLayoutGuide.layoutFrame.minY)")
            if offsetY > view.safeAreaLayoutGuide.layoutFrame.minY {
                navigationItem.title = "Настройки"
            } else {
                navigationItem.title = ""
            }
            
            resizableCell.topAnchorConstraint.constant = 40 - newHeight//- scrollLabel
            if newHeight == 0 {
                resizableCell.search.isHidden = true
            } else { resizableCell.search.isHidden = false }
            resizableCell.heightConstraint.constant = newHeight
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
        let item = data.sections[indexPath.section].type[indexPath.row]
        var title = ""
        switch item {
        case .acountItem(model: let model):
            title = model.title
        case .defaultItem(model: let model):
            title = model.title
        case .switchItem(model: let model):
            title = model.title
        case .lableItem(model: let model):
            title = model.title
        case .searchItem(model: _):
            return
        }
        present(NewViewController(title: title), animated: true)
          // print("indexPath.row \(indexPath.row), section \(indexPath.section)")
       }
}
