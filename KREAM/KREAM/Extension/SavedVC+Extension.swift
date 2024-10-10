//
//  Saved+Extension.swift
//  KREAM
//
//  Created by KKM on 10/11/24.
//

import UIKit

extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count  // 테이블뷰에 표시할 데이터 수
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedItemCell.identifier, for: indexPath) as? SavedItemCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        return cell
    }
}
