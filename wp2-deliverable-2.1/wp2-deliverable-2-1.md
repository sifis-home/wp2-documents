---
tags: wp2.1, wp2, deliverable
title: Report on Security and Privacy
author: WP2 Team
date: March 31, 2021
geometry: "left=3cm,right=3cm,top=2cm,bottom=2cm"
mainfont: Times New Roman
fontsize: 12pt
bibliography: wp2-deliverable-2-1-citations.bib
csl: transactions-on-computational-logic.csl
headers-include: |
    \usepackage{ragged2e}
    \justifying
---

# Executive Summary
This document reports the theoretical and practical aspects of measuring the quality and security of source code produced in the SIFIS-Home project or by third-party developers developing apps expected to run on the SIFIS-Home framework. 

The document is intended to provide a baseline for the definition of secure coding guidelines, which will be reported in D2.2 and D2.4. We will review here the main techniques and formalisms to evaluate the quality and reliability for general software, discussing how these measures are relevant for applications developed for the SIFIS-Home framework, presenting at first general quality metrics and then focusing on security and privacy-related indexes, as they are defined in the literature.

A subset of these metrics will also be used by the mechanisms to evaluate the quality and security of SIFIS-Home applications provided by third-party developers through the tools for evaluating the software defined in D2.3 and D2.5.


# Introduction

Software Engineering has always been devoted to the issue of program quality, which, by definition, is seen as the extent to which a product meets a certain number of expectations concerning both its operation and its internal structure.

A more precise definition of code quality has been illustrated by [@kothapalli2011codeq]: the source code's ability to meet the stated and implied requirements for a given software project.

Software measurement is a process that assesses the manifestation of the size, quantity, amount, or dimension of particular attributes of a software product.

In the literature, parameters have been established against which software quality can be measured or defined. These are divided into two broad categories: _external_ parameters, which refer to how end-users perceive the program, and _internal_ parameters, which refer to how developers perceive software quality.

![Software Parameters](./resources/00_parameters.png){#fig:software_params}

Internal parameters can be classified as follows:

- Testability: a software is defined as testable if its correctness and reliability properties are easily verifiable, i.e., if it effortlessly reveals its failures. 
- Maintainability: the ability of a program to be modified. These modifications include corrections or adaptations of the system to changes in requirements, environments, and specifications. It includes the properties of: 

    * Repairability: ease of eliminating defects and 
    * _Evolvability_, ease of modifying the program to adapt it to a new environment or improve its quality.
    
- Reusability: the ability to reuse a piece of software in creating another program, in the case of minor modifications.
- Portability: the ability of the system to run on different hardware and software platforms. This parameter is facilitated by modular design.
- Readability: a software is defined as readable if there is an ease in understanding the reading of the code and its organization and implementation.
- Modularity: useful to measure how many modules that compose a software artifact. Modules are portions of source code containing instructions written to be reused multiple times in the same program.

External parameters can be classified as follows [@codecomplete2]:

- Correctness: The degree to which a system is free from faults in its specification, design, and implementation.
- Usability: The ease with which users can learn and use a system.
- Efficiency Minimal use of system resources, including memory and execution time.
- Reliability: A system's ability to perform its required functions under stated conditions whenever required having a long mean time between failures.
- Integrity: The degree to which a system prevents unauthorized or improper access to its programs and data. The idea of integrity includes restricting unauthorized user accesses and ensuring that data is accessed properly—that is, that tables with parallel data are modified in parallel, that date fields contain only valid dates, and so on.
- Adaptability: The extent to which a system can be used, without modification, in applications or environments other than those for which it was specifically designed.
- Accuracy: The degree to which a system, as built, is free from error, especially with respect to quantitative outputs. Accuracy differs from correctness; it is a determination of how well a system does the job it's built for rather than whether it was built correctly.
- Robustness: The degree to which a system continues to function in the presence of invalid inputs or stressful environmental conditions.

In this work, the interest is focused on *internal parameters* since the final goal is strictly related to the developers' point of view and not to the users'. 

The external parameters are strongly related to the internal parameters:

- Correctness, Reliability, Accuracy, Integrity and Robustness are correlated to Testability, Maintainability and Readability.
- Adaptability and Usability are correlated to Modularity and Portability.

One of first the factors that can compromise a program comprehension is code readability. When a source code is hard to read, it is not easy to understand its flow and side effects. Poorly written code leads developers to introduce new bugs when fixing old bugs or adding new features. Readability measures the effort of the developer to access the information contained in the code. In contrast, understandability measures the complexity of such information [@readability]. However, code maintainability is the most critical part of software development. Being highly maintainable is the key to reducing approximately 75% of most systems' life cycle costs [@mt75perc].

The _IEEE Standard Glossary of Software Engineering Terminology_ defines software maintainability as the ease with which a software system or component can be modified to correct errors, improve performance or other attributes, or adapt to a changing environment.
 
Furthermore, according to the ISO standard IEC 9126, _software follows the evolution of the organization_, meaning that the program must adapt to all the boundary characteristics present in its development (environment, requirements, functionality).
 
Also, according to the ISO standard IEC 9126, the maintainability of the code has some attributes that allow its description entirely:

- Analysability: ability to perform diagnosis on the software and identify the causes of errors and malfunctions.
- Changeability: ability to allow the development of changes to the original software. Implementation includes changes to code, design, and documentation. 
- Stability: ability to avoid unwanted effects as a result of changes to the software.
- Testability: the ability to enable verification and validation of modified software, in other words, to perform testing.
- Maintainability compliance: ability to adhere to standards and conventions related to maintainability.


Software Engineering has dealt extensively with finding applicable models to measure the maintainability of software source code during its lifecycle. Through these models, it is possible to measure the source code's maintainability after any change to the code, checking whether the maintainability improves or worsens.

Over the years, it has been shown that measuring and improving code maintainability is very useful for managing _technical debt_; a definition used to describe all the complications that arise during the development of a software project [@cunningham1992tech]. Besides, another more recent study has shown that analysis and measurement of source code maintainability are still the main methods used for
the management of _technical debt_ [@ernst2015measure]. 

Software quality management is becoming a topic of absolute necessity as systems over the years are evolving in complexity and size. Using effective programs or tools to maintain them is critical for developers during the software lifecycle.

There are several types of tools in the literature that can be used to improve software quality [@krishnan2007codetools]:

- Static Analysis Tools: are useful for examining problems based on code analysis, such as the use of uninitialized variables, the possibility of memory leaks, dereferencing of null pointers.
- UT Tools: allows performing _Unit Testing_ of the source code.
- Memory Leak Detection Tools: detect possible memory leaks at runtime.
- Code Browsing/Reverse Engineering Tools: help with code understanding so that improvements and troubleshooting can be applied appropriately.
- Profiling Tools: help understand and monitor performance aspects of the code.
- Coverage Tools: highlight which test cases cover parts of the code run to ensure test quality.

Software Quality is an aspect that has fundamental importance within the SIFIS-Home project together with Security and Privacy. 

The purpose of this document is providing the theoretical and practical aspects of measuring the quality and security of source code produced in the SIFIS-Home project or by third-party developers developing apps expected to run on the SIFIS-Home framework.

SIFIS-Home will provide developers with software verification and evaluation tools to assess and communicate the overall quality of source code and produced applications to end-users in a user-friendly way. 

SIFIS-Home developer must also consider software-based security metrics that aim to detect programming practices that might introduce, either by mistake or maliciously, dangerous behaviors or exploitable vulnerabilities.

In addition to that, a SIFIS-Home developer needs to evaluate a set of regulations and related measures to analyze privacy implications based on data management strategies.

Through these mechanisms, the SIFIS-Home project pushes developers to implement applications according to their best security and quality criteria, building over time a reputation score aimed at winning end-user trust.
