//
//  MainPageViewController.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 5/19/23.
//
import Foundation
import UIKit

class MainPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    private var viewControllerArray: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the dataSource to self
        self.dataSource = self
        
        // Instantiate your view controllers
        let firstViewController = FirstViewController()
        let secondViewController = SecondViewController()
        let thirdViewController = ThirdViewController()
        
        // Add the view controllers to the array
        viewControllerArray = [firstViewController, secondViewController, thirdViewController]
        
        // Set the initial view controller
        if let firstViewController = viewControllerArray.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // MARK: - UIPageViewControllerDataSource Methods
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = viewControllerArray.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = currentIndex - 1
        if previousIndex >= 0 {
            return viewControllerArray[previousIndex]
        }
        
        // Wrap around to the last view controller
        return viewControllerArray.last
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = viewControllerArray.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = currentIndex + 1
        if nextIndex < viewControllerArray.count {
            return viewControllerArray[nextIndex]
        }
        
        // Wrap around to the first view controller
        return viewControllerArray.first
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllerArray.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let currentViewController = pageViewController.viewControllers?.first else {
            return 0
        }
        
        return viewControllerArray.firstIndex(of: currentViewController) ?? 0
    }
}
