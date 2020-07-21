# BoostContacts

BoostContacts is an iOS app that load and save contacts in JSON files. It utilizes MVVM architecture and [Combine framework](https://developer.apple.com/documentation/combine)

## Setting up

```bash
git clone git@github.com:faizmokhtar/BoostContacts.git
cd BoostContacts/
```

Open `BoostContacts.xcodeproj` and run!

## Requirements

- Xcode 11.6
- iOS 13 and above

# Architecture Decisions

- This project is using MVVM architecture
- In some parts it utilizes the new Apple Combine framework to subscribe to changes.
- This project is using repository pattern in `ContactsRepository`
- Unit tests files are put in the same level as the class files. For example
````
/Models/
    |
    +---- Contact.swift
    |
    +---- ContactTests.swift
````
- Github Actions have also been set up for this project. You can take a look of the sample test runs [here](https://github.com/faizmokhtar/BoostContacts/runs/895500351?check_suite_focus=true)


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)