//
//  MyPageViewCtr.swift
//  Tiny App
//
//  Created by Hockey on 1/14/21.
//

import UIKit

class MyPageViewCtr: UIPageViewController {
    private var pages = [UIViewController]()
    var myDelegate: NotifyPageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let firstViewCtr = pages.first {
            // Can xet view Controller se dc hien thi mac dinh truoc
            setViewControllers([firstViewCtr], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
        }
    }
    
    required init?(coder: NSCoder) {
        // Xet kieu dich chuyen Trang la:
        // pageCurl: Ung dung Doc Sach
        // hoac: scroll
        super.init(transitionStyle: UIPageViewController.TransitionStyle.scroll, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal, options: nil)
    }
    func setDatasourceDelegate()  {
        dataSource = self
        delegate = self
    }
    
    func setUpPages(pages: [UIViewController])  {
        self.pages = pages
    }
    
    func scrollToPageIndex(index: Int) {
        // Lay current View Controller, de lay currentIndex cua TRANG hien tai
        guard index >= 0 && index < pages.count else {
            return
        }
        if let currentViewCtr = viewControllers?.first, let currentIndex = pages.firstIndex(of: currentViewCtr) {
            let nextViewCtr = pages[index];
            setViewControllers([nextViewCtr], direction: index > currentIndex ? .forward : .reverse, animated: true, completion: nil)
            self.myDelegate?.haveWalkedToPageIndex(index: index)
        }
    }
}

extension MyPageViewCtr: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // Xu ly khi nguoi dung cuon tu TRAI qua PHAI
        guard let index = pages.firstIndex(of: viewController) else {
            return nil
        }
        if index + 1 == pages.count {// La trang CUOI CUNG
            // thi tra ve trang Dau tien
            return pages[0]
        }
        return pages[index + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // Xu ly khi nguoi dung cuon tu PHAI qua TRAI
        guard let index = pages.firstIndex(of: viewController) else {
            return nil
        }
        if index == 0 {
            return pages[pages.count - 1]
        }
        return pages[index - 1]
    }
}

extension MyPageViewCtr: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if let currentViewCtr = viewControllers?.first {
            if let index = pages.firstIndex(of: currentViewCtr) {
                myDelegate?.haveWalkedToPageIndex(index: index)
            }
        }
    }
}

// Dinh nghia
protocol NotifyPageDelegate {
    func haveWalkedToPageIndex(index: Int)
}
