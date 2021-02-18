---
tags: wp2.1, wp2, deliverable
title: 5.infrastructure-assessment
---

# Infrastructure Assessment

The label associated to an app that controls an *IoT* device within a house is analyzed (we need to define how, but first we need to create a label!!!). Then the average among the labels needs to be computed in some way such that the entire infrastructure can be assessed.

Some questions: 

* Where should the tool that assess the infrastructure run? I presume on the gateway because we are following up the WebThing approach. So the average among the labels occurs there. 
* Since we are not interested in device labels, how can we get the labels associated to each app in order to compute the average? Whenever a request is sent to a gateway by an app?

Need to know how the infrastructure is structured first.

> [name=Luca Barbato] TODO: https://webofthings.org/standards/



# Evaluation criteria

> [name=Luca barbato] TODO: OSI Stack here (some a diagram?)

The infrastructure is made out of nodes interacting:
- Smart devices
- Not-so-smart devices
- Gateways

Each of them is connected to others through a physical medium, using specific protocols and expressing an expected behavior.

> [name=Mik] Should we explain in detail what smart and not-so-smart devices are? Or do we take them for granted?

## Physical
The device could use a wired or wireless medium to connect to a gateway and may or may not share the medium with other nodes.

A wireless medium does have some inherent level of privacy and security that may or may not be equivalent to the wired model.

Depending on the medium certain concerns (privacy, security) may be pushed up to the protocol level.

### Example

A wired network has the concern of not leaving an access that could be used by an attacker, such as a garden socket that may give an easy access to the powerline network.

> [name=Mik] Don't know how to handle something like that. I mean, providing a solution. But the description is clear.

A wireless network has additional concerns due its nature. TODO: write more about it.

## Protocols
The communication protocols may or may not be encrypted and may or may not have desiderable properties.

E.g. The protocol may offer mutual authentication / pairing capabilities, discovery / advertisement, etc.

### Example

A sensor may expose itself using plain http or even telnet. In order to secure it, it must stay in a separate network so it can be accessed only by a gateway.

## Behavior

> [name=Luca Barbato] TODO: https://iot.mozilla.org/wot/ 

The expected behavior of a device includes its normal operations and the ability to notify exceptional conditions, or lack of.

### Example

A lamp exposes either an `on/off` or a `level` property, certain lamps may advertise certain additional `events` to signal the `overheat` condition. 

An induction cooker exposes similar properties, `on/off` and a `level`, but it advisable to advertise an `event` to signal the `overheat` condition.

In both cases the Gateway may use the information to automatically shut off the device, but the threat level of an induction cooker overheating is certainly different from having a led lamp operating above its ideal temperature range.