# SCCarHelper
This app is used for displaying car images and details
----
### 1. Initialize main display view
#### 1) Init a collection view which displays 2 columns in portrait and 3 columns in landscape
#### 2) Custom a collection view cell
#### 3) Fill default data and do autosize to do auto size to fit from iPhone5s to iPad Pro (3rd gen) 12.9""
### 2. Init details view controller
#### 1) Setup a collection view to display images
#### 2) Add labels for price, location, and sale status
#### 3) Setup a text view for showing comments
#### 4) Setup a separator view by using a view with 1 pixel height in dark gray color
### 3. Build view model
#### 1) Write network manager functions for loading car basic information and car details information
#### 2) Write view model functions for controllers
#### 3) According to the JSON, build models and then transfer JSON to model
#### 4) Fill data to collection views and labels
### 4. Adjust Rotation direction
#### 1) Custom a navigation controller to disable rotation according to navigation controller's children. For example, if the children number is equal to 2, it means details view is being shown. Because the main view is embeded in a navigation controller.
#### 2) Force details view controller to display in portrait
### 5. Test this app on both simulator and devices
----
## Starting Time: From 9:30 am to 7:00 pm on 27 of June
