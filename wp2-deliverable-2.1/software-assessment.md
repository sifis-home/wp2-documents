---
tags: wp2.1, wp2, deliverable
title: software-assessment
---

# Software Assessment

*Software Assessment* consists of several methodologies to assess an open-source software.

A software can be assessed considering  refers to two related but distinct notions:

    Software functional quality reflects how well it complies with or conforms to a given design, based on functional requirements or specifications. That attribute can also be described as the fitness for purpose of a piece of software or how it compares to competitors in the marketplace as a worthwhile product.[1] It is the degree to which the correct software was produced.
    Software structural quality refers to how it meets non-functional requirements that support the delivery of the functional requirements, such as robustness or maintainability. It has a lot more to do with the degree to which the software works as needed.


Descrtibe Software quality

but also the ones more focused on software such as *maintainability*.




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

## Software Metrics

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