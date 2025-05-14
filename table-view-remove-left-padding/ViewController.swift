import Cocoa

class NoPaddingCellView: NSTableCellView {
    override func layout() {
        super.layout()
        if let subview = subviews.first {
            subview.frame.origin.x = -6
        }
    }
}

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    let tableView = NSTableView()
    let items = ["Row 1"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("Column"))
        tableView.addTableColumn(column)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.focusRingType = .none
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        selectFirstRow()
    }
    
    func selectFirstRow() {
        DispatchQueue.main.async {
            self.tableView.selectRowIndexes([0], byExtendingSelection: false)
        }
    }

    func numberOfRows(in tableView: NSTableView) -> Int {
        return items.count
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = NoPaddingCellView()
        let label = NSTextField(labelWithString: items[row])
        label.translatesAutoresizingMaskIntoConstraints = false
        cell.addSubview(label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
            label.topAnchor.constraint(equalTo: cell.topAnchor),
            label.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
        ])

        return cell
    }
}
