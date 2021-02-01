---
tags: wp2, brainstorming
title: Brainstorming and useful resources
---

# Brainstorming

Each idea that comes up to our mind has been organized in different subsections such that we are able to maintain a coherent workflow.

This section is just a collection of ideas and it does not represent an official work.

## Useful Links

https://www.gsma.com/iot/wp-content/uploads/2018/11/GSMA_Assessing-regulatory-requirements-of-privacy-management-for-members-offering-IoT-services-using-personal-data.pdf

Analysis of risk for privacy
https://www.researchgate.net/publication/324942420_Privacy_risk_analysis_in_the_IoT_domain/link/5e43ade1a6fdccd9659bdeec/download

Security and privacy report from EU (2017)
https://ec.europa.eu/information_society/newsroom/image/document/2017-15/final_report_20170113_v0_1_clean_778231E0-BC8E-B21F-18089F746A650D4D_44113.pdf

User Privacy Request in Internet of Things
https://www.ics.uci.edu/~kobsa/papers/2016-WFioT-Kobsa.pdf


What matters to users?
https://www.researchgate.net/publication/258499184_What_Matters_to_Users_Factors_that_Affect_Users_Willingness_to_Share_Information_with_Online_Advertisers/link/00b7d528bddb285707000000/download

## Carnegie Mellon Research

Scientific paper: https://arxiv.org/abs/2002.04631

Website: https://www.iotsecurityprivacy.org/labels

Spreadsheet explaining each label's field: https://docs.google.com/spreadsheets/d/1EZyCgs6tB4jxhQXVZE7UF0LchL3bYrseYFzNShS0Y88/edit#gid=0

Two label levels, the first label is glued on a IOT device while the second one contains more information and can be consulted online.

## STIX language

Website and documentation

https://oasis-open.github.io/cti-documentation/stix/intro.html

Structured Threat Information Expression (STIX) is an open source language and serialization format used to exchange cyber threat intelligence (CTI).

It is composed by different objects that interact with each other. Each object is serialized through a JSON file that represents the object itself and all of its properties. 

The data representation used to show how those objects interact one with each other is a graph.

Nodes are the unique concepts of cyber threat intelligence and they are called SDO. You can find an exhaustive list with in addition the relative explanation of them here:

https://oasis-open.github.io/cti-documentation/stix/intro.html#stix-21-defines-18-stix-domain-objects-sdos

Edges are the relationship objects or SRO. You can find an exhaustive list with in addition the relative explanation of them here:

https://oasis-open.github.io/cti-documentation/stix/intro.html#stix-2-defines-two-stix-relationship-objects-sros

Descriptive and intuitive videos
What are objects? https://www.youtube.com/watch?v=iAnd3rApMcA
What are the common properties between objects? https://www.youtube.com/watch?v=dv-Zt4k1zt0
How does versioning work? https://www.youtube.com/watch?v=s4c4PHUfttE

## User Perspective

Considering a mobile app, we should inform the user at startup of the possible threats the app could encounter during its execution. So a subset of the information contained in a label need to be presented to the user. A possible way to store this data could be implementing an Android-like manifest format. Obviously, this new manifest format should be cross-platform and architecture-independent.

## Developer Perspective

Our labels *should* focus mainly on APIs, but we must keep in mind that the end-user would normally see devices as whole more than specific applications or single API. For example, let's suppose the following API called *SwitchOn*. In a case, this API might refer to a stereo, while in another one to a cooker. For the latter, we *must* also provide information about the device, due to the security threats. A possible way to solve this problem consists of creating different APIs for different group of devices, like *SwitchOnStereo* or *SwitchOnCooker*. At the end, our APIs should approximate devices, like WebThings is doing right now, and cannot be treated in a general way. So it is fundamental to *always* consider the device on which they are running on.

If we decide to consider either some certification levels or a star ratings system, the relative graphic artifacts (e.g icons) could be placed near the signature of an API. This graphic artifacts, other than representing an evaluation system, are hyperlinks to where our labels are located.


## Why avoiding star ratings systems?

From: https://arxiv.org/abs/2002.04631

* Consumers might have trouble distinguishing a large number of ratings, yet a more granular scale could help manufacturers better differentiate their privacy and security practices
* Ratings might pose an unhealthy incentive for IoT companies to achieve full-star ratings only to be able to compete in the market. Companies may be able to game the ratings in order to get all the stars and eventually all products will have all stars, whether they deserve them or not.


## Why multiple certification levels?

From: https://arxiv.org/abs/2002.04631

They offer a secure baseline or minimum standard instead of star rating systems. But it is necessary that consumers should know it passes the minimum security level (so tests should be provided for an API, to guarantee the minimum standard are respected)

Multiple certification label example for devices, but it can be adapted for APIs: https://ims.ul.com/iot-security-rating-levels

Risks: Since the lowest certification level indicates a safe device, there is a risk that manufacturers will aim to achieve the lowest level and not bother pursuing higher levels. Market competition may encourage manufacturers to pursue higher certification levels, especially for devices where the consequences of security breaches are most severe.

## Standard to validate privacy and security (and more) label's fields

Possible standard we can follow in order to validate the fields that compose our label: 

https://thedigitalstandard.org/
https://github.com/TheDigitalStandard/TheDigitalStandard

For each argument(Privacy, Security, Ownership and Governance), there are various criteria. At each criteria is associated an indicator and the releative procedure to evaluate the indicator through data/links/automatic tests and so on.

## Technology Proposal

Labels should be serializable. In this way, depending on the needs, they could be outputted as JSON, XML, TOML, YAML, CBOR (the last is a binary file used to transmit data on a network much faster).

Labels could be rendered online in two modes:

* User mode: presents the information contained in our labels sorting them out according to the preferences extracted from the surveys conducted by the Carnegie Mellon colleagues on IOT users. This label will be represented  in various file formats to be accessed from different systems:
    * *AndroidManifest.xml* for Android
    * *manifest.plist* an XML-format used by Apple
    * *manifest.json* for web apps
* Developer mode: Same as user mode, but focusing on developers and sorting them out according to the preferences extracted from the surveys conducted by the Carnegie Mellon colleagues on IOT developers and experts.

In addition, we could also implement two views:
* Only the most relevant information depending on the mode defined above
* All the information contained in a label

If someone clicks the link through the API documentation, it will be directly redirected to the developer mode page, on the other hand, if a user wants to know more about a label, they can access to the user mode page from the store or through link inserted by a developer into the app.