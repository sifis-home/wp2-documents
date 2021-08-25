---
tags: wp2.2, wp2, deliverable
title: 3.APIs and Labels
---

<!-- # Introduction -->

A [study](https://iotsecurityprivacy.org) conducted by researchers at the Carnegie Mellon University pointed out that security and privacy practices adopted by smart devices companies are rarely available to consumers before purchase.
Following on from this, they came up with the idea of providing IoT devices with an explanatory label, which conveys information about security mechanisms, data practices, and other details about the device, e.g., manufacturer country, device compatibility, etc.
According to their standard, the label can be printed on the device package or retrieved online by means of a QR code to inform the customer about security features and data management.
Transparency is good business and is important as much for customers as it is for vendors.
It is up to vendors whether to adopt this new standard or not, but for sure, giving more information about a product can boost brand reputation.

Similar to this mechanism, but at a different level, we want to provide SIFIS-Home-aware applications with labels describing security risks deriving from app's code execution.
To this aim, we start at a fine grain by giving labels to APIs that developers use when writing their applications.
Eventually, a label will be provided for the application as a whole, and it will be composed of all the labels of the APIs within the code.

Our proposal is analogous to the [Permissions mechanism](https://developer.android.com/guide/topics/permissions/overview) of Android operating system, and our label could resemble their Manifest file, but it actually differs in some crucial aspects.
In SIFIS-Home, the user (or a maintainer on user's behalf) defines policies to be enforced within his smart home.
Policies definition is a simple and intuitive process which allows the user to declare which actions and operations can be performed by applications in his smart home environment and which cannot.
In SIFIS-Home, this process is eased by novel mechanisms which make use of artificial intelligence and natural language, and described in WP4.
Our label is shown to the user during app installation with an informative purpose, and it highlights if some of the risks go against the user-defined policies.
If no risk contradicts user's policies, the app is installed straightaway.
Otherwise, the user can decide whether to edit his policies, finalise app installation, or not to finalise it.
On the contrary, the Android permissions mechanism just informs the user about the permissions the app requires to run all its features.
Permissions contained in the manifest file are just shown to the user, which oftentimes is not aware of what some entries pertain to.
Lately, Android introduced runtime allowance for dangerous permissions, meaning that the user is asked to give permission within the app when first using a feature that requires such a permission.
However, this approach is not convenient in our scenario because it requires user interaction with the app, which might be unfeasible in some cases.

<!--
> chiede i permessi al momento dell'installazione, mentre noi usiamo una strategia diversa facendo definire le policy prima.

> In SIFIS, potremmo anche pensare di generare nuove policy durante l'installazione se l'utente vuole concedere all'app determinati "permessi" (cioè, se l'utente si fida e vuole correre determinati rischi con quell'app).
-->

# The SIFIS-Home Developer APIs

<!--
[Schema on Miro.com](https://miro.com/app/board/o9J_l_s2-0k=/)
-->
![](https://i.imgur.com/IJIJaCc.png =300x)


As shown in Figure, the SIFIS-Home Developer APIs are designed to extend and improve service level APIs such as those offered by WebThings or Yggio.
The SIFIS-Home developers APIs build upon this already existing model, which is used to abstract from the specific producer-based implementation of functionalities used to provide generic services, such as "Switch on Light", "Open Lock", "Increase Temperature", etc. 
Following the Web of Things terminology, we can name these services "Capabilities". 
The Capabilities help developers of third-party applications to provide applications able to invoke these generic services, without having to be worried about the actual implementation which in general is device specific.
To clarify, let us suppose, for example, that two device manufacturers provide for their device "Refrigerator", two different implementations of the "lowerFridgeTemp()" API, to decrease the current temperature in the refrigerator by 1 °C.
To offer this API to third party developers, not having to foresee two distinct invocations, one for Manufacturer 1 and one for Manufacturer 2, the manufacturers describe the API as a capability "lowerFridgeTemp()", exposed by SIFIS-Home.
In such a way, the developer shall simply invoke the capability and the actual implementation, or the specific refrigerator present in a home, are fully transparent to him. 

To define the SIFIS-Home developer APIs, we build upon the currently existing frameworks, focusing in particular on Web of Things and FIWARE.
SIFIS-Home, in fact, is focused on the security and safety aspects of the smart home management.
For this reason, it is not in the scope of our activities developing a new standard.
Still, both standards are still pretty new and only few, basic capabilities have actually been defined.
We are thus drawing from other non-standardised framework such as IFTTT, Home Assistant, and OpenHab to define some additional capabilities useful for representing desired features and functionalities, still bringing potential security and safety issues.
As it currently happens for Web of Things and FIWARE, new capabilities can be proposed by device producers and application developers, to represent functionalities that can be offered to third-party applications. 

To be able to handle the privacy, safety, and security issues, within the activities of Task T2.3, we have defined a set of "Labels" representing safety, integrity, security, and privacy issues intrinsically related to the execution of each specific developer API.
Such risks are generally related to either a misuse, or a malicious use of the functionality, e.g., decreasing excessively the refrigerator temperature to cause a greater energy consumption.
The user must be informed of this possibility when installing an application on his SIFIS-Home devices, with the possibility of controlling the possibility of executing risky operations, by means of security and safety policies.
We recall from D1.1 that such policies can be defined either by the user himself or by an external, expert maintainer.
By binding the labels to specific APIs (API label in Figure), we ensure that if an API is invoked, the corresponding label is associated to the application, similarly to what happens with Android permissions.
The application will thus carry an application label (App Label) made by the combination of the API labels invoked by the application source code.
The App Label, together with the code quality information provided by Task 2.1 and 2.2, together with other metadata, build the App Contract. 

The App Contract is a structured document, which is both human readable and machine interpretable (being based on a markup language), which is bound by means of digital signature to the application code.
The contract provides information on the application quality, on the identity and reputation of the developer, on the resources that can be controlled by the application and the correlated risk, which might stem from misuses of such resources.
This document provides useful information to the user, for deciding whether to install or not the application.
At the same time, the contract is analysed by the SIFIS-Home framework, which, according to the enforced policies, will handle the privacy, security, and safety risk by possibly limiting the application functionalities, and/or warning the user or maintainer about possible inconsistencies with the user decision of enabling the application functionalities, and about identified misbehaviours.
In the following, we will report the process of defining API labels for the SIFIS-Home developer APIs, also by discussing some proposed capabilities.
We assume that for new proposed capabilities, the assignment of one or more API labels will be performed by a SIFIS-Home aware certifier.
This certifier will also have the task of periodically reviewing those APIs which are connected to each SIFIS-Home API.



# Labelling Mechanism

The SIFIS-Home framework defines APIs and makes them available for SIFIS-Home-aware apps developers.
A generic API implements functionalities of either a service or a device and possibly operates on data.
However, the execution of an API may imply obvious, as well as subtle, risks.
We identified three categories of possible risks: *safety*, *privacy*, and *financial risks*.

Safety risks are mainly due to events that produce a direct effect on the physical realm.
Therefore, many APIs that trigger an actuator are associated with this kind of risk.
Indeed, the smart home environment includes appliances that may cause injury, or even death, if misused. For instance, a smart cooktop could set the house on fire if unattended.
Furthermore, safety risks regard all the threats that may put people and assets in danger.
An undesired release of the door lock may lead to  physical intrusion.

Privacy risks are related to operations that manage sensitive information.
This kind of risk is associated with APIs that access resources and read data.
APIs that get data from sensors, e.g., audio/video streams or temperature readings, as well as APIs that get the state from actuators, e.g., on/off state of a light bulb, are straightforward examples.
Also APIs that collect auxiliary data, such as logs, fall in this category.

Financial risks are related to operations that produce an expense.
This kind of risk characterises APIs that lead to a monetary expense, either directly or indirectly. 
APIs that access user's "wallet" to place an order, e.g., to order food, or to pay a subscription fee, e.g., periodic renewal of pay-per-view services, are examples of *direct financial risks*. 
On the contrary, with the term *indirect financial risks* we refer to those operations that generate an indirect monetary cost for the user. 
In other terms, APIs that affect energy consumption (electricity, gas, water, etc.) bring an indirect financial risk.
Of course, the extent of the risk differs from API to API and, more in general, from device to device.

In SIFIS-Home, we associate every API with a *security label* that describes possible risks deriving from its execution.
The security label consists of a list of *tags*, each one identifying a risk.
A tag contains (i) the risk name, (ii) a description, and, optionally, (iii) the *risk score*, a decimal value in the range [0,1] which indicates the gravity of the risk.
To make some practical examples, an API which has the effect of turning the oven on performs an operation that consumes a high instantaneous power and could potentially set the house on fire, so its label will include, among others, the tag "FIRE_HAZARD" and the tag "ELECTRIC_ENERGY_CONSUMPTION" with a risk score of 0.8.
Another example is an API that acquires video signal from a video camera and stores it locally; this API may store frames containing children, which could represent a privacy concern for the end user; the tag "CHILDREN_RECORDING" will be embedded in the API label.
Again, an API that authorises the payment of an asset will have a label embedding the tag "SPEND_MONEY". 

Developers use our set of APIs to build SIFIS-Home-aware apps. 
When an app is ready for deployment, it is packaged in an *app bundle*.
The app bundle contains the *application*, i.e., the executable, and the *app contract*, which consists of the *app label* and *code quality metadata*.
The app label is automatically generated during the packaging phase and is populated with all the labels belonging to the APIs used within the app code.

When a user wishes to install an app from our marketplace, he can read the app label beforehand to be informed about possible risks deriving from the installation and usage of such an app.
For each risk listed in the app label, a user-friendly description and a risk score, when applicable, are provided.
A short and simple description of the risks is required to promote the reading and comprehension by every class of end users.
Moreover, the risk score, which is a decimal value, could be mapped to keywords like "low", "medium", and "high" when shown to the user.
This allows a more straightforward perception.

Besides informing the end user about app's behaviour and possible risks, the app label seamlessly integrates with user-defined policies.
This means that if the label of a given API would violate the rules defined by the user, its execution is automatically denied.
For example, if a user defined a policy which reads as "No device that may cause fire can be turned on remotely", and the app label contains the `turnOnOven` API, the app can be installed, but the execution of that API is forbidden at runtime.


# Tags List
In the following, we report a non-exhaustive list of tags and their descriptions for the three risk categories.
If present, the symbol **⚠** denotes that a risk score is associated with the tag it is defined in.

| **Safety**| 
| -------- | 
| FIRE_HAZARD\
  *The execution may cause fire.* |
| AIR_POISONING\
  *The execution may release toxic gasses.* |
| BURST\
  *The execution may cause an explosion.* |
| ASPHYXIA\
  *The execution may cause oxygen deficiency by gaseous substances.* |
| WATER_FLOODING\
  *The execution allows water usage which may lead to flood.* |
| POWER_OUTAGE --- **⚠**\
  *The execution may cause an interruption in the supply of electricity.* |
| POWER_SURGE\
  *The execution may expose to high voltage.* |
| UNAUTHORISED_PHYSICAL_ACCESS\
  *The execution disables a protection mechanism and unaccredited individuals may physically enter home.* |
| SPOILED_FOOD\
  *The execution may lead to rotten food.* |
|
| **Privacy** | 
| AUDIO_VIDEO_STREAM\
  *The execution authorises the app to obtain a video stream with audio.* |
| AUDIO_VIDEO_RECORD_AND_STORE\ 
  *The execution authorises the app to record and save a video with audio on persistent storage.* |
| LOGGING_USAGE_TIME\
  *The execution authorises the app to get and save information about app's duration of use.* |
| LOG_ENERGY_CONSUMPTION\
  *The execution authorises the app to get and save information about app's energy impact on the  device the app runs on.* |
| RECORD_USER_PREFERENCES\
  *The execution authorises the app to get and save information about user's preferences.* |
| RECORD_ISSUED_COMMANDS\
  *The execution authorises the app to get and save user inputs.* |
| TAKE_PICTURES\
  *The execution authorises the app to use a camera and take photos.* |
| TAKE_DEVICE_SCREENSHOTS\
  *The execution authorises the app to read the display output and take screenshots of it.* |
|
| **Financial** | 
| SPEND_MONEY\
  *The execution authorises the app to use payment information and make a payment transaction.* |
| PAY_SUBSCRIPTION_FEE\
  *The execution authorises the app to use payment information and make a periodic payment.* |
| ELECTRIC_ENERGY_CONSUMPTION --- **⚠**\
  *The execution enables a device that consumes electricity.* |
| GAS_CONSUMPTION --- **⚠**\
  *The execution enables a device that consumes gas.* |
| WATER_CONSUMPTION --- **⚠**\
  *The execution enables a device that consumes water.* |

> [name=marco-rasori] | Hypothermia / Freeze hazard\
> *The execution may freeze either food or living being.*


Note that the list of tags is not exhaustive and is designed to be extended also externally, having third parties and/or developers proposing new tags for new specific operations related to smart home devices.

# API Labels
In the following, we report a short list of sample APIs and their own labels.

| API                       | Label     |
| --------                  | --------  | 
| `turnOnOven`               | <ul><li>FIRE_HAZARD</li><li>POWER_OUTAGE (risk score: 0.8)</li> <li>LOG_ENERGY_CONSUMPTION</li> <li>ELECTRIC_ENERGY_CONSUMPTION (risk score: 0.8)</li></ul>  |
| `recordVideo`               | <ul><li>AUDIO_VIDEO_RECORD_AND_STORE</li></ul> | %Tenants recording, Children recording
| `lowerFridgeTemperature`    | <ul><li>POWER_OUTAGE (risk score: 0.5)</li> <li> ELECTRIC_ENERGY_CONSUMPTION (risk score: 0.5)</li></ul>                    |
| `raiseFridgeTemperature`    | <ul><li>SPOILED_FOOD</li></ul>                          |
| `orderFood`                 | <ul><li>SPEND_MONEY</li></ul>                        | > da includere nella lista?
| `turnOnAirConditioner`      | <ul><li>POWER_OUTAGE (risk score: 0.7)</li> <li>ELECTRIC_ENERGY_CONSUMPTION (risk score: 0.7)</li></ul>                     |
| `turnOnVacuumCleaner`       | <ul><li>POWER_OUTAGE (risk score: 0.8)</li> <li>LONG_LASTING_RESOURCE_LOCK</li> <li>ELECTRIC_ENERGY_CONSUMPTION (risk score: 0.8)</li></ul>  | % da includere nella lista?
| `disarmAlarm`               | <ul><li>UNAUTHORISED_PHYSICAL_ACCESS</li></ul>          |
| `openShutters`              | <ul><li>UNAUTHORISED_PHYSICAL_ACCESS</li></ul>          |
| `streamMicAudio`            | <ul><li>TENANTS_VOICE_STREAM</li> <li>CHILDREN_VOICE_STREAM</li></ul> | > da includere nella lista?
| `unlockDoor`                | <ul><li>UNAUTHORISED_PHYSICAL_ACCESS</li></ul>          |
| `renewSubscription`         | <ul><li>PAY_SUBSCRIPTION_FEE</li></ul> |


# Labels Format

API labels and app label should be implemented so that they can be easily converted in other formats and exported, namely they need to be serializable.
Possible formats that they can be serialized to are JSON, XML, TOML, etc.
In the following, we provide an implementation of a JSON schema for both API labels and app label.


## JSON Format
We first introduce the API label JSON format through an example, then we define the API label schema, and finally the app label schema.

The example is given for the `turnOnOven` API.
The JSON object in the following listing contains three properties: (i) `api_name`, which must match the API the label refers to, i.e., `turnOnOven`; (ii) `description`, which gives a brief explanation of the API behaviour; and (iii) `security_label`, which specifies the risks associated with the API.

The `security_label` property is an object that contains three properties representing the three categories: `safety`, `privacy`, and `financial`.
Every property contains an array populated by objects with the same structure, each representing a tag.
These objects identify the risks associated with the API, and they are composed of the properties `name`, `description`, and, optionally, `risk_score`. 
In the example, the `safety` property is an array of size two containing the tags POWER_OUTAGE, which reports also the risk score, and FIRE_HAZARD.
```
{
  "api_name": "turnOnOven",
  "description": "Activates the oven at the last selected temperature.",
  "security_label": {
    "safety": [
      {
        "name": "FIRE_HAZARD",
        "description": "The execution may cause fire."
      },
      {
        "name": "POWER_OUTAGE",
        "description": "High instantaneous power. The execution may cause power outage.",
        "risk_score": 0.8
      }
    ],
    "privacy": [
      {
        "name": "LOG_ENERGY_CONSUMPTION",
        "description": "The execution allows the app to register information about energy consumption."
      }
    ],
    "financial": [
      {
        "name": "ELECTRIC_ENERGY_CONSUMPTION",
        "description": "The execution enables the device to consume further electricity.",
        "risk_score": 0.8
      }
    ]
  }
}
```

### api-label Schema

The reference JSON schema for an API label is presented in the following listing.
This schema [bundles](https://json-schema.org/understanding-json-schema/structuring.html#bundling) the *api-label schema* and a *tag subschema* into a single schema. 
The tag subschema defines the `tag` object, which is used by all the risk categories (`safety`, `privacy`, and `financial` properties).

The `tag` object contains two required properties: (i) `name`, which must match one of the tags defined in the tags list, and (ii) `description`, which gives a brief explanation of the risk.
Additionally, the `tag` may contain the `risk_score` property, indicating the gravity of the risk and defined as a number in the range [0,1] with a step size of 0.1.

<!-- >[name=marco-rasori]
The `tag` object declares the properties `name` and `description` as required, and the property `risk_score` as optional.
The latter is defined as a number in the range $[0,1]$, with a step size of $0.1$. -->

```
{
   "$schema":"http://json-schema.org/draft-07/schema#",
   "$id":"https://raw.githubusercontent.com/sifis-home/wp2-documents/master/wp2-deliverable-2.2/schemas/api-label.jschema",
   "title":"SIFIS-Home API label schema.",
   "description":"JSON schema defining the API security label structure within the SIFIS-Home framework.",
   "type":"object",
   "properties":{
      "api_name":{
         "type":"string"
      },
      "description":{
         "type":"string"
      },
      "security_label":{
         "type":"object",
         "properties":{
            "safety":{
               "type":"array",
               "items":{
                  "$ref":"/schemas/tag"
               }
            },
            "privacy":{
               "type":"array",
               "items":{
                  "$ref":"/schemas/tag"
               }
            },
            "financial":{
               "type":"array",
               "items":{
                  "$ref":"/schemas/tag"
               }
            }
         },
         "required":[
            "safety",
            "privacy",
            "financial"
         ]
      }
   },
   "required":[
      "api_name",
      "description",
      "security_label"
   ],
   
   "definitions":{
      "tag":{
         "$id":"/schemas/tag",
         "type":"object",
         "properties":{
            "name":{
               "type":"string"
            },
            "description":{
               "type":"string"
            },
            "risk_score":{
               "type":"number",
               "minimum":0,
               "maximum":1,
               "multipleOf":0.1
            }
         },
         "required":[
            "name",
            "description"
         ]
      }
   }
}
```

The app label can be a JSON which contains an array of API labels in JSON format, as the one defined in the example above.

### app-label Schema
The *app-label schema* is defined in the following listing.
The schema declares three required properties, i.e., `app_name`, `description`, and `api_labels`.
The latter is an array of `api-label` objects.

```
{
   "$schema":"http://json-schema.org/draft-07/schema#",
   "$id":"https://raw.githubusercontent.com/sifis-home/wp2-documents/master/wp2-deliverable-2.2/schemas/app-label.jschema",
   "title":"SIFIS-Home app label schema.",
   "description":"JSON schema defining the app label structure within the SIFIS-Home framework.",
   "type":"object",
   "properties":{
      "app_name":{
         "type":"string"
      },
      "description":{
         "type":"string"
      },
      "api_labels":{
         "type":"array",
         "items":{
            "$ref":"/sifis-home/wp2-documents/master/wp2-deliverable-2.2/schemas/api-label.jschema"
         }
      }
   },
   "required":[
      "app_name",
      "description",
      "api_labels"
   ]
}
```




<!--
>Safety and ...[integrity / damage / harm]:
>* Fire Hazard
>* Air Poisoning
>* Burst
>* Asphyxia
>* Water Flooding
>* Power Outage (??)
>* Power Surge
>* Unauthorised Physical Access
>* Spoiled Food
>
>Privacy:
>* Video and Audio Streaming
>* Video and Audio Recording and Storing
>* Logging Usage Time
>* Logging Energy Consumption
>* Recording User Preferences
>* Recording Issued Commands
>* Taking Pictures
>* Taking Device Screenshots
>
>Financial:
>* Wallet Access
>* Spend Money
>* Pay Subscription Fee
>* Electric Energy Consumption
>* Gas Consumption
>* Water Consumption
-->