//
//  UsersViewController.swift
//  OppousPrueba
//
//  Created by Kevin Bolivar on 2/23/16.
//  Copyright © 2016 Kevin Bolivar. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    private lazy var refreshControl: UIRefreshControl =
    {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "handleRefresh:", forControlEvents: UIControlEvents.ValueChanged)
        refreshControl.tintColor = UIColor.blueColor()
        return refreshControl
    }()
    
    private var users: [User] = []
    {
        didSet
        {
            animateTable()
        }
    }
    
    //MARK: IBOutlets:
    
    @IBOutlet var userName: UILabel!
    
    @IBOutlet var usersTableView: UITableView!
    
    //MARK: UIView Life Cycle:
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Register User TableView Cell
        let emptyNib = UINib(nibName: "UserTableViewCell", bundle: nil)
        self.usersTableView.registerNib(emptyNib, forCellReuseIdentifier: "UserCell")
        
        //For now:
        for var i = 0; i<=3 ; i++
        {
            let user = User()
            users.append(user)
        }
        
        usersTableView.tableFooterView = UIView(frame: CGRectZero)
        usersTableView.addSubview(refreshControl)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - refresh Control:
    
    func handleRefresh(refreshControl: UIRefreshControl)
    {
        
    }

    
    func animateTable()
    {
        usersTableView.reloadData()
        
        let cells = usersTableView.visibleCells
        let tableHeight: CGFloat = usersTableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animateWithDuration(1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.TransitionNone, animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
            index += 1
        }
    }
    
    //MARK: UITableView DataSource:
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
            return users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("UserCell") as! UserTableViewCell
        cell.loadData(users[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 60
    }
    
    
}
