---
tags: wp2, deliverable
title: Report on Security and Privacy Metrics
bibliography: wp2-deliverable-2-1.bib
---

[//]: # (https://www.zotero.org/styles citation styles)

[//]: # (Docx/Pdf rendering, installing pandoc-citeproc: pandoc --filter=pandoc-citeproc --standalone --csl transactions-on-computational-logic.csl --bibliography bibliography.bib -o article.pdf/docx article.md)

# Privacy and Security Assessment Techniques

@lucaardito since he created this section: @60pElkHvRuOJcPgiD0CZIQ arised a question on the meaning of this section. I replied that its meaning could be the description of the processes to validate privacy and security metrics, but I'm not sure about my reply either. Could you please elaborate more on this argument? In short, *we need to validate the procedures used to create the privacy and security fields of our own label?*

Below some links about a possible validation process and its explanation

https://thedigitalstandard.org/ 

https://github.com/TheDigitalStandard/TheDigitalStandard

For each one of the arguments, Privacy, Security, Ownership and Governance), various criteria have been identified. Then, at each criteria is associated an indicator and the corresponding procedure to evaluate it through data/links/automatic tests and so on.

# Software Assessment

*Software Assessment* consists of several methodologies to define an assessment process for open-source software. Many methods have been developed over the years, and one of the most well-known is the *Open Source Maturity Model (OSMM) from Capgemini*.

They are specifically thought for the *FLOSS* development process and most of them are released under a *Creative Commons* license. 

Some of them can be interchangeably treated both as models and methodologies since they contain a series of elements to be assessed but also a set of rules and guidelines describing how to conduct an assessment process.

Those models evaluates a series of non-functionality aspects related to the organization around the open-source project such as the *maturity*, the *durability*, and the *strategy*, but also those most focused on software like *maintainability* and *code complexity*.


## Organizazion aspects

@lucaardito 

Describe *maturity*, *durability*, and *strategy* in relation to Sifis



@Luni-4: Which model should we use to analyze the development of Sifis? OSMM? Another one?


## Software Maintainabilty

*Software maintainability* is defined as the ease of maintaining software during the delivery of its releases. Maintainability is defined by the ISO 9126 standard as
> The ability to identify and fix a fault within a software component 

[@iso-9126] and by the ISO/IEC 25010:2011 standard as

> degree of effectiveness and efficiency with which a product or system can be modified by the intended maintainers

[@iso-25010]
 
Maintainability is an integrated software measure that encompasses some code characteristics, such as readability, documentation quality, simplicity, and understandability of source code [@aggarwal2002integrated]. 

## Most known static metrics

## Why not dynamic metrics?

## Tools

### rca

### Other tools


# Security and Privacy Metrics


## Security



## Privacy


# Infrastracture Assessment

@lucaardito could you please explain what should be added in this section? Is it something related to Polito or CNR? How could an infrastructure be evaluated? 

@Luni-4 the idea was to combine the labels of all the components inside the infrastructure. Let's call it `meta-evaluation`

@lucaardito So what's the assessment here? What do you mean with the term `components`? Please provide a better description on what this section should contain, some example, a use-case, something like that, thanks!

@Luni-4: components mean all the IoT devices inside the house. you analyze (parse) the evaluation of each device and you assess the infrastructure.




The label associated to an app that controls an *IoT* device within a house is analyzed (we need to define how, but first we need to create a label!!!). Then the average among the labels needs to be computed in some way such that the entire infrastructure can be assessed.

Some questions: 

* Where does the tool that assess the infrastructure should run? I presume on the gateway because we are following a WebThing approach. So the average among the labels occurs there. 
* Since we are not interested in device labels, how can we get the labels associated to each app in order to compute the average? Whenever a request is sent to a gateway by an app?

Need to know the infrastructure first.


# Questions (this section is going to be deleted eventually)