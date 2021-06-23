---
tags: wp2.2, wp2, deliverable
title: 3.APIs and Labels
---

# Schema 

[Schema on Miro.com](https://miro.com/app/board/o9J_l_s2-0k=/)

# API Labeling

The SIFIS-Home framework defines generic APIs and makes them available for SIFIS-Home-aware apps developers.
A generic API implements functionalities of a device and possibly operates on data.
For example, an API called `turnOnOven` switches the oven on, while an API called `recordVideo` acquires the video signal coming from a video camera and stores it locally.

The execution of an API may imply obvious, as well as subtle, risks.
We identified two categories of possible risks: safety and privacy.
Safety risks are mainly due to APIs that trigger an actuator and impinge upon the physical realm.
On the other hand, privacy risks are related to APIs that access resources and read the data they produce. Accessing an actuator means being able to read its state, while accessing a sensor means being able to read the data it collects. Also APIs that collect auxiliary data, such as logs, fall in this category.

In SIFIS-Home, every API is associated with a label that describes possible risks deriving from its execution.
The `turnOnOven` API performs an action that can potentially set the house on fire, so its label will include the tag "Fire danger". The `recordVideo` API may store frames containing children, which could represent a privacy concern for the end user; the tag "Children recording" will be embedded in the API label.

All the labels of the APIs invoked by an app contribute to the definition of a general label (called *app label*) which resides in the app contract, inside the app bundle. 

The advantage brought by this labeling mechanism is twofold: (i) it informs the end user about app's behaviour and possible risks, and (ii) it seamlessly integrates with user-defined policies, thus denying the execution of APIs labeled with tags that would violate rules defined by the user. 



# Labels

Safety:
* Fire danger
* High power consumption
* Surge hazard
* Unauthorised physical access
* Rotten food
 
Privacy:
* Video and audio streaming
* Video and audio recording and storing
* Logging usage time
* Logging energy consumption
* Recording user preferences
* Recording issued commands
* Taking pictures
* Make device screenshot


# Association among APIs and Labels
In the following, we report a non-exhaustive list of APIs  and their labels.


| API                       | Label     |
| --------                  | --------  | 
| turnOnOven                | Fire danger, High power consumption   |
| recordVideo               | Video and audio recording and storing | %Tenants recording, Children recording
| lowerFridgeTemperature    | Power consumption                     |
| raiseFridgeTemperature    | Rotten food                           |
| orderFood                 | Wallet access                         | % da includere nella lista?
| turnOnAirConditioner      | Power consumption                     |
| turnOnVacuumCleaner       | Power consumption, Long lasting resource lock | % da includere nella lista?
| disarmAlarm               | Unauthorised physical access          |
| openShutters              | Unauthorised physical access          |
| streamMicAudio            | Tenants' voice streaming, Children's voice streaming | % da includere nella lista?
| unlockDoor                | Unauthorised physical access          |


# Label Format (JSON)

We introduce the JSON label format through an example for the API `turnOnOven`.
The `label` property is an object that contains two properties representing the two categories: `safety` and `privacy`.
Each property contains an array populated by objects with the same structure.
These objects identify the risks associated with the API, and they are composed of the properties called `name` and `description`. The latter gives a human-readable description of the risk.
```
{
  "apiName": "turnOnOven",
  "label": {
    "safety": [
      {
        "name": "Fire danger",
        "description": "The execution may cause fire."
      },
      {
        "name": "High Power Consumption",
        "description": "High instantaneous power. The execution may cause power outage."
      }
    ],
    "privacy": [
      {
        "name": "Logging energy consumption",
        "description": "The execution allows the app to register information about energy consumption."
      }
    ]
  }
}
```