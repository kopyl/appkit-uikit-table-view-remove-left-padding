import Cocoa

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
        let textLabel = NSTextField(labelWithString: items[row])
        textLabel.wantsLayer = true
        textLabel.layer?.backgroundColor = .black
        return textLabel
    }
}
