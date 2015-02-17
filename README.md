## Yelp

This is a yelp clone [Yelp API](http://www.yelp.com/developers/documentation/v2/search_api).

Time spent: `15`

### Features
- [X] Table rows should be dynamic height according to the content height
- [X] Custom cells should have the proper Auto Layout constraints
- [X] Search bar should be in the navigation bar (doesn't have to expand to show location like the real Yelp app does).
Hint: This is just a UISearchBar that is set as the navigationItem.titleView
- [ ]Optional: infinite scroll for restaurant results
- [ ]Optional: Implement map view of restaurant results
Filter page. Unfortunately, not all the filters are supported in the Yelp API.
- [X] The filters you should actually have are: category, sort (best match, distance, highest rated), radius (meters), deals (on/off).
- [X] The filters table should be organized into sections as in the mock.
- [X] You can use the default UISwitch for on/off states. Optional: implement a custom switch
- [X] Clicking on the "Search" button should dismiss the filters page and trigger the search w/ the new filter settings.
- [ ]Optional: Radius filter should expand as in the real Yelp app
- [ ]Optional: Categories should show a subset of the full list with a "See All" row to expand. Category list is here: http://www.yelp.com/developers/documentation/category_list (Links to an external site.)
- [ ] Optional: Implement the restaurant detail page.

### Walkthrough
![Video Walkthrough](http://i.imgur.com/9d4fXIm.gif)

Credits
---------
* [Yelp API](http://developer.rottentomatoes.com/docs/read/JSON)
* [AFNetworking](https://github.com/AFNetworking/AFNetworking)
