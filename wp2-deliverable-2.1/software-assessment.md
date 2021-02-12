---
tags: wp2.1, wp2, deliverable
title: software-assessment
---

TODO: When introducing the concept of static and dynamic analysis.

Wichmann, B. A.; Canning, A. A.; Clutterbuck, D. L.; Winsbarrow, L. A.; Ward, N. J.; Marsh, D. W. R. (Mar 1995). "Industrial Perspective on Static Analysis" (PDF). Software Engineering Journal. 10 (2): 69–75. doi:10.1049/sej.1995.0010. Archived from the original (PDF) on 2011-09-27.

Egele, Manuel; Scholte, Theodoor; Kirda, Engin; Kruegel, Christopher (2008-03-05). "A survey on automated dynamic malware-analysis techniques and tools". ACM Computing Surveys. 44 (2): 6:1–6:42. doi:10.1145/2089125.2089126. ISSN 0360-0300.



# Software Assessment

*Software Assessment* consists of several methodologies to assess an open-source software.

Those methodologies are grouped into two large groups: _functional requirements_ and _non-functional requirements_ 

With _functional requirements_ we consider all the requirements specific to a given application. The analysis aims to confirm that the given software respects its design specification and behaves as advertised. (TODO: Looking for a scientific paper to confirm this definition or an ISO citation)

With _non-functional requirements_ we consider the basic aspects that are common in all software, notwithstanding their specific behavior and design. We focus in particular on *robustness* and *maintainability* criteria.
(TODO: Look for a scientific paper to confirm this definition or an ISO citation)

Most of the _non-functional_ aspects can be evaluated by automatic means. Tools can be used to produce reports and metrics with little to none human interaction.

Most of the _functional_ aspects cannot be automatically assessed and require dedicated professional insights in order to be confirmed. The approach of declaring capabilities and other form of software contract allows some automatic assessment of the intended behavior.

TODO: Venn diagram to explain functional and non-functional aspects as keywords. 

This chapter focuses on exploring means to automate the assessment of the following aspects:
- Software Maintainability
- Manifest-based behavior compliance

TODO: review the list.

## Software Maintainability

*Software maintainability* is defined as the ease of maintaining software during the delivery of its releases. Maintainability is defined by the ISO 9126 standard as

> The ability to identify and fix a fault within a software component 

[@iso-9126] and by the ISO/IEC 25010:2011 standard as

> degree of effectiveness and efficiency with which a product or system can be modified by the intended maintainers

[@iso-25010]
 
Maintainability is an integrated software measure that encompasses some code characteristics, such as readability, documentation quality, simplicity, and understandability of source code [@aggarwal2002integrated]. 

Maintainability is also a crucial factor in the economic success of software products. It is commonly accepted in the literature that the most considerable cost associated with any software product over its lifetime is the maintenance cost [@zhou2007predicting]. The maintenance cost is influenced by many different factors, e.g., the necessity for code fixing, code enhancements, the addition of new features, poor code quality, and subsequent need for refactoring operations [@nair2020towards].

Hence, many methodologies have consolidated in software engineering research and practice to enhance this property, indeed a considerable amount of metrics have been defined to provide a quantifiable and comparable measurement for it [@004]. Many metrics measure lower-level properties of code (e.g., related to the number of lines of code and code organization) as proxies for maintainability. Several comprehensive categorizations and classifications of the maintainability metrics presented in the literature during the last decades have been provided, e.g., the one by Frantz et al. provides a categorization of 25 different software metrics under the categories of *Size*, *Coupling*, *Complexity*, and *Inheritance* [@frantz2019ranking]. 

From a more practical perspective, several frameworks which leverage on combinations of software code metrics either to predict or infer the maintainability of a project have been analyzed in literature [@kaur2014software; @amara2017towards; @mshelia2019can]. The most recent work in the field of metric computation is aiming at applying machine learning-based approaches to the prediction of maintainability by leveraging the measurements provided by static analysis tools [@schnappinger2019learning].

### Code quality

#### Bug detection

#### Code Sanitization

#### Code Coverage


### Code Clarity

Describe the most known metrics to evaluate whether a code is understandable. 

Describe: 

 * **SLOC:** Source Lines of Code. It returns the total number of lines in a file.

 * **PLOC:** Physical Lines of Code. It returns the number of instructions and comment lines in a file.

 * **LLOC:** Logical Lines of Code. It returns the number of logical lines (statements) in a file.

 * **CLOC:** Comment Lines of Code. It returns the number of comment lines in a file.

 * **BLANK:** Blank Lines of Code. It returns the number of blank lines in a file.

 * **NOM:** Number of Methods. It counts the number of methods in a file.

 * **NARGS**: Number of Arguments. It counts the number of arguments of
   each method in a file.

 * **NEXITS**: Number of Exit Points. It counts the number of exit points of
   each method in a file.

 * **CC:** McCabe's Cyclomatic Complexity. It calculates the code complexity
   examining the control flow of a program.

 * **COGNITIVE**: Cognitive Complexity. It is a measure of how difficult
   a unit of code is to intuitively understand.
   
 * **Halstead:** It calculates the Halstead suite.
 
 * **MI:** Maintainability Index. It is a suite to measure the maintainability of a code.
   It is calculated both on files and functions.


## Tools

Different software will be evaluated with a focus on software that are open source and widely available.

### Code quality

#### Bug detection
Both LLVM and GCC provide static analysis capabilities to detect a number of faults in C and C++ codebases.

Commercial solutions such as `coverity` and `LGTM` provide such even more advanced analysis as online services.

#### Code Sanitization
Multiple means to instrument the code to detect faults at runtime are provided by both LLVM and GCC.

`valgrind` provides similar capabilities.

#### Code Coverage
Another form of instrumentation provided by both GCC and LLVM is profiling traces via `--coverage`


### Code clarity

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
The other ones computes a specific set of metrics, for example the *Halstead Metrics Tool* computes only the *Halstead Metric suite*, and in some cases, *CodeAnalyzer*, the number of metrics is limited by the type of acquired license. 

Also, some of the tools, *Squale* and *Halstead Metrics Tool*, appear to be no more actively developed by the time of the writing of this article.

### rust-code-analysis

*rust-code-analysis* is a *Rust* library to analyze and extract information from source code written in the following programming languages: *C++*, *C#*, *CSS*, *Go*, *HTML*, *Java*, *JavaScript*, *Python*, *Rust*, *Typescript*.

Mozilla developed the initial version of this library to support the *Firefox* development processes. This library is one of the elements developed to help to evaluate the inherent risk of a change and preventing the introduction of new defects [@nayrolles2018clever], especially at the uplift phase [@castelluccio2017uplift; @castelluccio2018uplift].

The *rust-code-analysis* library is mainly thought for developers. 
Indeed, through its APIs, it is possible to carry out various tasks related to code metric computation and maintenance analysis:

* Print the Abstract Syntax Tree (AST) of a source code passed as input;
* Use the information extracted from AST nodes to detect in advance possible parsing errors present in the code. For example, it is possible to catch grammar errors before a program is compiled;
* Print a series of Source Code Metrics to evaluate the quality of source code;
* Export metrics in different output formats.

Leveraging the power of *Rust*, some of the APIs are implemented in a multi-threaded fashion, speeding up considerably the entire computation.

The library is available on [GitHub](https://mozilla.github.io/rust-code-analysis/index.html), published on [Crates.io](https://crates.io/crates/rust-code-analysis) and released under the Mozilla Public License v2.0. It can run on the most common platforms (i.e., Linux, macOS, and Windows) and its dependencies can be managed and built with *Cargo*.

To help users interacting with the APIs in an easy way, the library comes coupled with a command-line tool called *rust-code-analysis-cli*, which can be installed through *Cargo* as well. Through the CLI's commands, a user can visualize on the shell the output produced by the APIs or decide to print and export the metrics as different text and binary formats.

All *rust-code-analysis* metrics are calculated starting from the source code of a program without executing it, indeed the library only computes *static metrics*. Static metrics allow the evaluation of software quality, discover sections of a source code that might be more difficult to maintain, and compare the difference between programming languages.

The implemented metrics are divided into three main groups:

* *Line* metrics detect the number of lines of a certain kind, such as the number of instructions, comments, and statements in code.
* *Function* metrics count the number of functions and closures in a code. They can also extract further data, such as the number of arguments and exit points of a function.
* *Global* metrics provide a series of information on the effort required to maintain and understand a codebase, including an estimate of the number of bugs or the time needed to implement software. Also, they can evaluate the complexity of a codebase by examining the control flow of a program.

Metrics are computed independently for each function and then merged to determine the general quality of a program.

*rust-code-analysis* guarantees metrics correctness running unit tests on code with well-known characteristics. Those tests are indeed created to satisfy two main requirements:

* Verify *rust-code-analysis* correctness in typical use cases, i.e., using source codes which are representative of real cases and can usually be found in a codebase;
* Check *rust-code-analysis* in extreme cases using unusual parameters (corner case).


## Alternative approaches

> [name=Luca Barbato] in this chapter we'll give a different solution. Reduce the bug number by switching to a better language.

The emergence of new programming languages requires new software to compute and evaluate software metrics. Each language needs indeed a dedicated parser and a semantic analyzer to compute a metric.

*Rust* is a recent programming language whose focus is on developing reliable and efficient systems that exploit parallelism and concurrency. Conciseness, expressiveness, and memory safety are among the principal properties that guided the Rust development [@matsakis2014rust].

Among some of the advantages provided by this language:

* Fast and memory efficient
* No runtime or garbage collector
* Easily integrate with other programming languages
* Guarantee memory-safety and thread-safety, eliminating many classes of bugs at compile-time
* Useful methods to manage errors and print the relative messages in a comprehensible way
* Good documentation

In addition, it is possible to download the dependencies required by a program and compile them along the program itself through the *Rust* package manager, called *Cargo*, and distributed with the compiler. Cargo eliminates the need for manual management of large dependency graphs and simplifies building the software, unlike tools written in C/C++.