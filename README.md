Looking for *collaborators* and *maintainers*. Feel free to connect!
# **Developer Portfolio ⚡️**
## *It's minimal, beautiful and responsive!*
### **Don't have or don't know Flutter?**
- ### **Editing a JSON is all you have to do.**
Made for people who are looking for a ready-made portfolio. Because making a portfolio out of scratch is tiring. Feel free to use it as-is or customise it just the way you want it to be.

### **Portfolio Sections**
✔️ Skills\
✔️ Summary and About me\
✔️ Contact me\
✔️ Education\
✔️ Work Experience\
✔️ Open Source Projects Connected hosted with GitHub\
✔️ Other Projects\
✔️ Achievements

## **Change and customize every section according to your need**

#### Personalize page content in `/assets/portfolio.json` and modify it as per your needs. You can also change the title in `web/index.html` to change the title of your portfolio site. **For reference, check out my personal [portfolio.json](https://github.com/danger-ahead/flutter_dev_folio/blob/personal/assets/portfolio.json).**
***IMPORTANT: Don't want to share some details or don't have an image file? Keep the value of the respective field empty (will load a template image or in case of text, will display no text. Your site won't look bad 😉)***
- Your name and link.
```json
"name_and_link": [
    "your name",
    "a link (preferably github) of your choice"
],
```
- The tagline section in the home page, add as many as you want.
```json
"designation": [
    "first tagline",
    "second tagline"
],
```
- Your social media handles. **Currently supports icons for Facebook, GitHub, LeetCode, Linkedin, Twitter, Medium, Stack Overflow, Twitter and email. Specify the name of the social media in small letters in the json**. *If you want to add link to something else, simply keep the name value empty (will load a button with template image).*
```json
"social_media": {
    "1": [
        "your github link",
        "specify the name of the social media"
    ],
    "2": [
        "https://linkedin.com/example",
        "linkedin"
    ],
    "3": [
        "https://another-link.com",
        ""
    ],
},
```
- About and Bio section.
```json
"about": "a small about section for the home page",
"bio": "a more detailed about for the contact me page"
```
- Adding proficiency and used tools in What I do page.<br>Simply place the image files (64x64) in `assets/what_i_do/` and add the names in the json accordingly. In the example below, I have places 2 images (flutter.png and linux.png) under `assets/what_i_do/`.<br>To add proficiency in a particular language or tool, place it like this: `tool--proficiency_percentage`. Add as many tools or proficiency items as you want.
```json
"what_i_do": {
    "tools": [
        "flutter.png",
        "linux.png",
    ],
    "proficiency": [
        "Flutter--50",
        "C/C++/Java/Python--60",
    ]
},
```
- Education page.<br>Place institute logo image file (128x128) under `assets/education/`.
```json
"education": {
    "1": {
        "institute": "RCC Institute of Information Technology",
        "location": "Kolkata",
        "years": "2020 - 2024",
        "description": "B.Tech in CSE",
        "grades": "9.53 YGPA",
        "logo": "rcciit.png"
    },
    "2": {
        "institute": "Gitaram Academy",
        "location": "Berhampore",
        "years": "2018 - 2020",
        "description": "Physics, Chemistry, Mathematics, Computer Science",
        "grades": "84%",
        "logo": ""
    },
},
```
- Experience page.<br>Place logo image file (128x128) under `assets/experience/`.
```json
"experience": {
    "1": {
        "name": "Google Developer Student Club",
        "role": "Cybersecurity core member",
        "period": "September, 2021 - Present",
        "description": "Helped in organizing and conducting technical workshops, for community members.",
        "image_name": "GDSC.png"
    },
},
```
- Projects page.<br>**You can either fill out all the details of a particular project or just the GitHub link (if you want to fetch and use the details provided in the GitHub repo).**<br>***Note:** The GitHub link (in both the cases) is required to fetch the number of stars and forks.*
```json
"projects": {
    "1": {
        "name": "flutter_dev_folio",
        "tech_stack_used": "Flutter",
        "description": "Minimal, Beautiful and responsive portfolio site template",
        "general_or_github_link": "https://github.com/danger-ahead/flutter_dev_folio"
    },
    "2": {
        "name": "",
        "tech_stack_used": "",
        "description": "",
        "general_or_github_link": "https://github.com/danger-ahead/roBOT"
    },
}
```
- Achievements page.<br>You can add a link where visitors can view or validate your achievement.
```json
"achievements": {
    "1": {
        "description": "your achievement",
        "link": "https://some-link.com/view-certificate"
    },
}
```
- Contact me page.
```json
"contact_me": {
    "location": "your location",
    "open_for_opportunities": "Yes or No",
    "picture": "picture.png"
},
```

## How to deploy, run or test locally
```bash
# Clone this repository
git clone https://github.com/danger-ahead/flutter_dev_folio

# Go into the repository
cd flutter_dev_folio

# Create dotenv. No need to add any token now, GitHub API serves requests without authorisation.
: > dotenv

# Get dependencies
flutter pub get

# Start a local dev server
# We'll be using the HTML renderer
flutter run -d chrome --web-renderer html
```

## **Deployment**
flutter_dev_folio uses the GitHub API for fetching details from GitHub. The API is currently rate limited to 60 requests/hour. To overcome this, we would need a `GitHub Personal Access Token` placed in the `dotenv`.

**[Generate a new token](https://github.com/settings/tokens) with only `public_repo` scope.**<br><br>***IMPORTANT NOTE: TO USE PERSONAL ACCESS TOKEN FOR API CALLS, YOU NEED TO MANUALLY DEPLOY THE BUILT PROJECT. AS YOU CAN'T VERSION CONTROL THE `dotenv`***.<br><br>Create a `dotenv` file here:
```bash
- flutter_dev_folio
  - assets
  - lib
  - web
  - dotenv         <-- create it here
  - .gitignore
  - pubspec.lock
  - pubspec.yaml
  - README.md
```
Then paste the PERSONAL ACCESS TOKEN and run `flutter build web --web-renderer html --release`. This will create the `build/` directory containing all your build files. You can now simply deploy the `build/web/`.

**Or,** You can create an empty `dotenv` file and run (and deploy) the project. *Caution: This will limit the GitHub API to 60 requests/hour.*

***Or alternatively, Enable workflows in your fork and edit the json (and/or other files as per your wish) in your fork. Then commit and push. GitHub actions will soon generate the build files in the `master-deploy` branch. The generated build files will have rate limited API access.***

## For the future
This project is still very much in beta stage.
- Adding more sections
- Adding animations in different parts while loading the screens
- Embedding and connecting Twitter, Medium or Linkedin

Consider opening a PR if you can help me with these.

---
If you'd like to contribute and make this much better for other users, have a look at the [issues](https://github.com/danger-ahead/flutter_dev_folio/issues).

Created something awesome for your fork of the portfolio and want to share it? Feel free to open a [pull request](https://github.com/danger-ahead/flutter_dev_folio/pulls).
