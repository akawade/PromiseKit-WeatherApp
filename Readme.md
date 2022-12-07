Project's Title
Weather App

Project Description
This app gets the weather forecast for a location.
It gets the current cordinates using Location Manager of the device and uses those  to get the weather forcast for that cordinates.
Once the cordinate are avaialbe there is another services call to get temperature details for that location for backend public API and updated to the UI components accordingly. 
The Response recieved have an Icon name for that weather . This image name is further used to  retrieve image from backend system using another API call.
and loads the image  to UI once it is available.
It uses PromiseKit framework to  all the API calls.

    Get weather details      - https://api.openweathermap.org/data/2.5/weather?lat=18.516726&lon=73.856255&appid=71274958d99855d4efc83eda8e6e2b42
 
    Get Image of the weather - "http://openweathermap.org/img/w/"

App Screen - 

![Optional Text](../development/Coverage/Screenshot.png) ![Optional Text](../development/Coverage/Coverage.png)



Project Structure

├─ Models
├─ ViewModel
├─ ViewControllers
├─ Configuration
├─ Helpers

Tools Used
PromiseKit Framework


Test Coverage as Above - 

