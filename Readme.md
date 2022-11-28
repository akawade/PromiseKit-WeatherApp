Project's Title
Weather App

Project Description
This app gets the weather forecast for a location.
It gets the current cordinates using Location Manager and uses those to get the weather forcast for that cordinates.
When the cordinate are avaialbe there is another services call to get temperature for backend public API and updates the UI
accordingly. The Response recieved have an Icon name for that weather which can be later retrieved using another API call to backend public API.
and loads the image once it is available.
It uses PromiseKit framework to  all the API calls.

Project Structure

├─ Models
├─ ViewModel
├─ ViewControllers
├─ Configuration
├─ Helpers

Tools
PromiseKit Framework

