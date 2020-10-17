import UIKit

class HomeTableViewController: UITableViewController {
    private var sharedAppearance = AppearanceHandler()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerViews()
        setUpViews()
     //   tableView.layer.cornerRadius = 6.0

    }

    func registerViews() {
        let cellNib = UINib(nibName: "ImageViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "ImageViewCell")
        let nib = UINib(nibName: "HeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "HeaderView")
    }

    func setUpViews() {
     //   tableView.layer.cornerRadius = 10
      //  tableView.layer.masksToBounds = true

        self.title = CommonStrings.AppTitle
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: sharedAppearance.headingText]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? HeaderView
        return header
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageViewCell") as? ImageViewCell
        cell?.contentView.layer.cornerRadius = 0
        cell?.contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return cell ?? UITableViewCell()
    }

    public override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 66
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            let headerView = view as? UITableViewHeaderFooterView
            headerView?.contentView.layer.cornerRadius = 15
            headerView?.contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

//    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//            let headerView = view as? UITableViewHeaderFooterView
//            headerView?.contentView.layer.cornerRadius = 15
//            headerView?.contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//    }
}

