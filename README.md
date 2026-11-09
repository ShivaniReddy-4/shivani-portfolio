# Shivani Reddy Portfolio

Flutter web portfolio for Kondla Shivani Reddy, using the indigo/lavender home, About and Projects format of https://paridhiprasanna.github.io/Portfolio-UI-Flutter/. Independently implemented with details from the supplied resume. Uses initials because no portrait was provided. Training and learning projects remain labeled ongoing; no unverified project links or outcomes are claimed.

## Run

```sh
flutter pub get
flutter run -d chrome
```

## Validate and build

```sh
flutter analyze
flutter test
flutter build web --release --base-href /shivani-portfolio/
```

## Publish

Push to `ShivaniReddy-4/shivani-portfolio` on `main`, then select **GitHub Actions** in repository Settings → Pages → Build and deployment. The included workflow builds and deploys to https://shivanireddy-4.github.io/shivani-portfolio/.

Contact links open email, LinkedIn and GitHub. Resume PDF and phone number are not bundled; the site uses professional details and the email supplied for contact.
