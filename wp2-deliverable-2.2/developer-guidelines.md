---
tags: wp2.2, v1.0, wp2, deliverable
title: 1.Developer Guidelines
---

# Executive Summary {.unnumbered}

This document presents a series of developer guidelines to provide a methodology to write a secure, privacy-aware and policy-based IoT code for the SIFIS-Home project and the third-party apps expected to run within the SIFIS-Home framework.
Those guidelines are preliminary, and they are going to be completed in D2.4. 

We will also review the best practices, techniques, and formalisms to increase the quality and reliability of IoT software. Then, we will discuss how the SIFIS-Home developer APIs will help developers to write a more reliable and secure software.

Finally, this deliverable will present the legal guidelines to comply with regulations when handling personal data. A more specific report on Legal and Ethical Aspects will be subsequently presented in D2.5.

# Introduction

In Chapter 2, we propose some guidelines that a developer is recommended to consider for software development, and consequently, software quality evaluation.

The guidelines will be structured as a workflow that describes step-by-step the procedures and methods a developer should follow to produce a software of good quality.

First, we will describe the structure of the workflow followed by a practical example. Then, we will present some notions about software quality from a developer perspective and a possible definition for stamp to evaluate software quality, and finally, we will provide some additional notes that a developer may consider to further improve a software.

<!--
In Chapter 3, we introduce the concept of API label and provide a sample list. Then, we describe the app label, and, finally, we present the labels format for both API label and app label, offering an implementation in JSON format.

To cope with possible risks deriving from the execution of SIFIS-Home developer APIs, we then define a set of labels representing safety, integrity, security, and privacy issues intrinsically related to the execution of each specific developer API.
In other words, we link each developer API with an *API label* that brings information about possible risks.
The set of API labels linked with the APIs used in an application forms a general label for that application, called *app label*.
This label is shown to the user before the installation process of such an application.
The advantage of this mechanism is twofold: (i) it informs the user about possible risks related to the application, and (ii) it seamlessly integrates with user-defined policies, meaning that if the label of a given API violates some rule defined by the user, its execution is automatically denied.
-->

In Chapter 3, we deal with possible risks deriving from the execution of SIFIS-Home developer APIs.

We define a set of labels representing safety, integrity, security, and privacy issues intrinsically related to the execution of each specific developer API.
In other words, we link each SIFIS-Home developer API with an *API label* that brings information about possible risks.
The set of API labels linked with the APIs used in an application forms a general label for that application, called *app label*.
This label is shown to the user before the installation process of such an application.
The advantage of this mechanism is twofold: (i) it informs the user about possible risks related to the application, and (ii) it seamlessly integrates with user-defined policies, meaning that if the label of a given API violates some rule defined by the user, its execution is automatically denied.


In the last and final chapter of this deliverable instead, we deal with the legal guidelines.

Collecting data is a necessary but challenging task. In the European Union, indiscriminate collection of data is limited and regulated through the GDPR (General Data Protection Regulation).

While there are some subjects, such as the Data Controller, that must be explicitly determined and are obliged to follow the GDPR’s rules, others, like the software developer, or the “application designer”, don’t have such an obligation, but may be interested in programming along those lines, in a way that the resulting software is by *default* compliant to privacy laws. This allows the application to be better distributed, accepted and reviewed by both the end user and the possible Service Provider.

We therefore try to clarify what rules must be followed by what subjects, and when it is mandatory or just advantageous to follow them. This topic is also closely linked to that of licensing, and the use of free software and the legal obligations arising from its use.

We explore the main requirements found in GDPR, mainly specified in articles 13, 14, 25, 32 and 35, and the initiatives aimed at making free and open software more standardized, such as the OpenChain and ClearlyDefined projects.

In the end, we propose a “traffic-light system” based upon different criteria through which software can be evaluated in the matter of privacy and licensing.

![Main GDPR requirements and recommendations flowchart](./resources/legals_guidelines.png){#fig:legal}

