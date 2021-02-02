---
tags: wp2, deliverable
title: wp2-deliverable-2-1
bibliography: wp2-deliverable-2-1-citations.bib
csl: transactions-on-computational-logic.csl
---


# Executive Summary

Short explanation of the purpose of this document in the scope of the SIFIS-Home project.

(look at the already published deliverables here: https://drive.google.com/drive/folders/1RRwJT16m60ocWaPavfinL4kRQQAjjlB6)

# Introduction

General discussion on the relevance of software quality in the project and about the need of evaluating these aspects in applications that will be run in the SIFIS-Home framework. Some text can be borrowed from the proposal.

Assigned to @lucaardito

# Software Assessment

*Software Assessment* consists of several methodologies to define an assessment process for open-source software. Many methods have been developed over the years, and the most well-known one is the *Open Source Maturity Model (OSMM) from Capgemini*.

They are specifically thought for the *FLOSS* development process and most of them are released under a *Creative Commons* license. 

Some of them can be interchangeably treated both as models and methodologies since they contain a series of elements to be assessed but also a set of rules and guidelines describing how to conduct an assessment process.

Those models evaluates a series of non-functionality aspects related to the organization around the open-source project such as *maturity*, *durability*, and *strategy*, but also the ones more focused on software such as *maintainability*.

## Software quality


@Luni-4: Which model should we use to analyze the development of Sifis? OSMM? Another one?


## Software Maintainabilty

*Software maintainability* is defined as the ease of maintaining software during the delivery of its releases. Maintainability is defined by the ISO 9126 standard as

> The ability to identify and fix a fault within a software component 

[@iso-9126] and by the ISO/IEC 25010:2011 standard as

> degree of effectiveness and efficiency with which a product or system can be modified by the intended maintainers

[@iso-25010]
 
Maintainability is an integrated software measure that encompasses some code characteristics, such as readability, documentation quality, simplicity, and understandability of source code [@aggarwal2002integrated]. 

Maintainability is also a crucial factor in the economic success of software products. It is commonly accepted in the literature that the most considerable cost associated with any software product over its lifetime is the maintenance cost [@zhou2007predicting]. The maintenance cost is influenced by many different factors, e.g., the necessity for code fixing, code enhancements, the addition of new features, poor code quality, and subsequent need for refactoring operations [@nair2020towards].

Hence, many methodologies have consolidated in software engineering research and practice to enhance this property, indeed a considerable amount of metrics have been defined to provide a quantifiable and comparable measurement for it [@004]. Many metrics measure lower-level properties of code (e.g., related to the number of lines of code and code organization) as proxies for maintainability. Several comprehensive categorizations and classifications of the maintainability metrics presented in the literature during the last decades have been provided, e.g., the one by Frantz et al. provides a categorization of 25 different software metrics under the categories of *Size*, *Coupling*, *Complexity*, and *Inheritance* [@frantz2019ranking]. 

From a more practical perspective, several frameworks which leverage on combinations of software code metrics either to predict or infer the maintainability of a project have been analyzed in literature [@kaur2014software; @amara2017towards; @mshelia2019can]. The most recent work in the field of metric computation is aiming at applying machine learning-based approaches to the prediction of maintainability by leveraging the measurements provided by static analysis tools [@schnappinger2019learning].

## Static metrics

Describe the most known static metrics and describe the advantages and disadvantages of dynamic metrics. Why aren't we focusing on them?

## Code Clarity

What should be written here?

- Why C code is problematic: https://en.m.wikipedia.org/wiki/International_Obfuscated_C_Code_Contest

## Tools
Many tools have been presented in academic and industrial works or are commonly used by practitioners to compute automatically software metrics related to maintainability on source code artifacts developed in many different languages [@mshelia2017comparative]. 

A recent systematic literature review had led to identify fourteen *open-source* tools able to compute a large set of different static metrics for a great variety of different programming languages [@ardito2020tool]. Below we present only a small set of those tools, evaluated according to their usage:

* *CBR Insight* is a tool based on the closed-source metrics computation framework called *Understand* which aims at computing reliability and maintainability metrics [@ludwig2019cbr]; 

* *CCFinderX* is tailored for finding duplicate code fragments [@matsushita2017detecting];

* *CKJM* is developed to compute the *C\&K* metrics suite and other method-related metrics for Java code [@kaur2014proposed]; 
 
* *CodeAnalyzers* a tool supporting more than 25 software maintainability metrics, that covers the highest number of programming languages along with CBR Insight [@sarwar2008comparative]; 

* *Halstead Metrics Tool* is a no-more-developed tool for the computation of the Halstead Suite [@hariprasad2017software];

* *Metrics Reloaded* is able to compute many software metrics for C and Java code both as and IntelliJ IDEA plug-in and through command line [@saifan2018evaluating]; 

* *Squale* is a tool to measure high-level quality factors for software, measuring a set of code-level metrics to predict economic aspects of software quality [@ludwig2017compiling].


As additional limitations of the identified set of tools, it is needed to point out that only few of them provide a complete coverage of the most common metrics.
The other ones computes a specific set of metrics, for example the *Halstead Metrics Tool* computes only thr *Halstead Metric suite*, and in some cases, *CodeAnalyzer*, the number of metrics is limited by the type of acquired license. 

Also, some of the tools, *Squale* and *Halstead Metrics Tool*, appear to be no more actively developed by the time of the writing of this article.

### Why tools written in Rust?

The emergence of new programming languages requires new software to compute and evaluate software metrics. Each language needs indeed a dedicated parser and a semantic analyzer to compute a metric.

### rust-code-analysis


*Rust* is a recent programming language whose focus is on developing reliable and efficient systems that exploit parallelism and concurrency. Conciseness, expressiveness, and memory safety are among the principal properties that guided the Rust development [@matsakis2014rust].





### Other tools (we need to decide which one to consider)




# Security and Privacy Metrics

What should be written here?
- Measures reporting code mistakes that might imply vulnerabilities (e.g. Stall Ratio, Critical Element Ratio...)
- Usage of code blocks that expose the program to memory-based security attacks (e.g. buffer overflow).
- Measures about data traceability, including approaches based on data tainting.
- Usage of API and libraries known to be deprecated due to or implying security vulnerabilities.
- Usage of security protocols in network-based applications.   

# Privacy and Security Assessment Techniques

*We need to validate the procedures used to create the privacy and security fields of our own label?*

Below some links about a possible validation process and its explanation

https://thedigitalstandard.org/ 

https://github.com/TheDigitalStandard/TheDigitalStandard

For each one of the arguments, Privacy, Security, Ownership and Governance), various criteria have been identified. Then, at each criteria is associated an indicator and the corresponding procedure to evaluate it through data/links/automatic tests and so on.

# Infrastracture Assessment

The label associated to an app that controls an *IoT* device within a house is analyzed (we need to define how, but first we need to create a label!!!). Then the average among the labels needs to be computed in some way such that the entire infrastructure can be assessed.

Some questions: 

* Where does the tool that assess the infrastructure should run? I presume on the gateway because we are following a WebThing approach. So the average among the labels occurs there. 
* Since we are not interested in device labels, how can we get the labels associated to each app in order to compute the average? Whenever a request is sent to a gateway by an app?

Need to know how the infrastructure is structured first.


# Questions (this section is going to be deleted eventually)