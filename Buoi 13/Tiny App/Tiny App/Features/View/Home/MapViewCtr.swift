//
//  MapViewCtr.swift
//  Tiny App
//
//  Created by Hockey on 1/18/21.
//

import UIKit
import MapKit
import CoreLocation

private extension MKMapView {
    func centerToLocation(_ location: CLLocation,
                          regionRadius: CLLocationDistance = 1000 ){
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}

class MapViewCtr: UIViewController {
    
    @IBOutlet weak var ibMap: MKMapView!
    let initialLocation = CLLocation(latitude: 10.772352689692497, longitude: 106.68991412704463)
    
    
    private let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let lpgr = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureReconizer:)))
        //          lpgr.minimumPressDuration = 0.5
        //          lpgr.delaysTouchesBegan = true
        //          lpgr.delegate = self
        //          self.ibMap.addGestureRecognizer(lpgr)
        
        //        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        //        tapGestureRecognizer.delegate = self
        //        tapGestureRecognizer.numberOfTapsRequired = 2
        //        ibMap.addGestureRecognizer(tapGestureRecognizer)
        
        // Add a center den vi tri khoi tao
        ibMap.centerToLocation(initialLocation)
        // Rang buoc camera
        
        let saigonCenter = CLLocation(latitude: 10.77283, longitude:  106.69049)
        let region = MKCoordinateRegion(
            center: saigonCenter.coordinate,
            latitudinalMeters: 50000,
            longitudinalMeters: 60000)
        if #available(iOS 13.0, *) {
            ibMap.setCameraBoundary(
                MKMapView.CameraBoundary(coordinateRegion: region),
                animated: true)
        } else {
            // Fallback on earlier versions
        }
        
        if #available(iOS 13.0, *) {
            let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
            ibMap.setCameraZoomRange(zoomRange, animated: true)
        } else {
            // Fallback on earlier versions
        }
        
        
        ibMap.delegate = self
        
        // Show artwork on map
        let artwork = Artwork(
            title: "Dinh Thống Nhất",
            locationName: "Nguyen Thi Minh Khai",
            discipline: "landmark",
            coordinate: CLLocationCoordinate2D(latitude: 10.773155437350965, longitude: 106.69049938233076))
        let hoaSen = Artwork(title: "Dai hoc Hoa Sen", locationName: "Nguyen Van Trang", discipline: "school", coordinate: CLLocationCoordinate2D(latitude: 10.770248176133876, longitude: 106.69237661952297))
        
        let bvMatSG = Artwork(title: "Benh Vien Mat Sai Gon", locationName: "Le Thi Rieng", discipline: "school", coordinate: CLLocationCoordinate2D(latitude: 10.771343826826012, longitude: 106.69091900070015))
        
        let taoDanPark = Artwork(title: "Cong Vien Tao Dan", locationName: "Truong Dinh", discipline: "school", coordinate: CLLocationCoordinate2D(latitude: 10.774415898734446, longitude: 106.69228579439732))
        
        ibMap.addAnnotations([artwork, hoaSen, bvMatSG, taoDanPark])
        
        
        
        requestLocationAuth()
    }
    
    
    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
            let touchLocation = gestureReconizer.location(in: ibMap)
            let locationCoords = ibMap.convert(touchLocation, toCoordinateFrom: ibMap)
            print("Did select: \(locationCoords)")
        }
    }
    
    
    
    func requestLocationAuth() {
        
        // 1
        guard CLLocationManager.locationServicesEnabled() else {
            return
        }
        // 2
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        // 3
        locationManager.delegate = self
        // 4
        if #available(iOS 14.0, *) {
            if locationManager.authorizationStatus == .notDetermined {
                locationManager.requestWhenInUseAuthorization()
            } else {
                locationManager.requestLocation()
            }
        } else {
            // Fallback on earlier versions
        }
        ibMap.showsUserLocation = true
    }
    
    @IBAction func reset(_ sender: Any) {
        ibMap.centerToLocation(initialLocation)
    }
    
    @objc func doubleTap() {
        navigationController!.setNavigationBarHidden( !navigationController!.isNavigationBarHidden, animated: true)
        tabBarController?.tabBar.isHidden = !tabBarController!.tabBar.isHidden
    }
    
}


extension MapViewCtr: UIGestureRecognizerDelegate {
    //    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    //        return !touch.isKind(of: MKAnnotationView.self)
    //    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if otherGestureRecognizer.isKind(of: UITapGestureRecognizer.self) {
            if otherGestureRecognizer.numberOfTouches == 2 {
                return false
            }
        }
        
        return true
    }
    
}

extension MapViewCtr: MKMapViewDelegate {
    // 1
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 2
        guard let annotation = annotation as? Artwork else {
            return nil
        }
        // 3
        let identifier = "artwork"
        var view: MKMarkerAnnotationView
        // 4
        if let dequeuedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            // 5
            view = MKMarkerAnnotationView(
                annotation: annotation,
                reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    func mapView(
        _ mapView: MKMapView,
        annotationView view: MKAnnotationView,
        calloutAccessoryControlTapped control: UIControl
    ) {
        guard let artwork = view.annotation as? Artwork else {
            return
        }
        
        let launchOptions = [
            MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
        ]
        artwork.mapItem?.openInMaps(launchOptions: launchOptions)
    }
    
    //    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    //        print("Did select: \(view.annotation?.coordinate)")
    //    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchPoint = touch.location(in: self.ibMap)
            let location = self.ibMap.convert(touchPoint, toCoordinateFrom: self.ibMap)
            print ("\(location.latitude), \(location.longitude)")
        }
    }
    
    func mapView(_ mapView: MKMapView,
                 didUpdate userLocation: MKUserLocation) {
        print("My Location 2: \(userLocation.coordinate)")
    }
}


extension MapViewCtr: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let userLat = location.coordinate.latitude
        let userLng = location.coordinate.longitude
        print("My Location: \(userLat), \(userLng)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
}
