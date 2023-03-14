# Project 3 - *Name of App Here*

Submitted by: Jonathan Velez

**Flixster Part 2** is an app that introduces networking to fetch real data from a third party server

Time spent: **10** hours spent in total

## Required Features

The following **required** functionality is completed:

- [X] Implement network call and table view to display a list of movies currently playing (title, description, image)
- [X] App has a collection view with the same list of movies
- [X] Uses a tab bar controller to switch between collection view and table view screens
 
The following **optional** features are implemented:

- [ ] Make an additional network call to another end-point.	
- [ ] Allow users to scroll when context items are off-screen (table view implemention)

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

## Video Walkthrough

Here's a walkthrough of implemented user stories:

https://imgur.com/a/FYPLQCb.gif

GIF created with MacOS Screen Record and Imgur
<!-- Recommended tools:

## Notes

One of the challenges I faced was getting to a detail view from my poster view. Because Poster view is a different
struct I could not just segue back to the original moviedetailview controller. I created my JSON variables in my Poster Struct
and passed them into a new detail view controller. Another challenge I faced was implementing the stretch feature that would pointed
to a new endpoint. I knew I had to pass the movie_id into the new URL to point to the new end point but I could not come up with 
an efficient way to pass the movie_id into the new URL.

## License

    Copyright [2023] [Jonathan Velez]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
