import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=785d24e0fb588c513528cd8e54ff96fd&units=metric"
    
    func fetchWeather(cityName:String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString : String){
        // create a URL
        if let url = URL(string: urlString){
            
            // create a URL session
            let session = URLSession(configuration: .default)
            
            // give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString ?? "None")
                }
            }
            
            //start the task
            task.resume()
            
        }
    }
 
}


