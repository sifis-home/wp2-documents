---
tags: wp2.2, wp2, deliverable
title: 2.Software Quality Guidelines
---

# Introduction 

Many tools have been presented in academic and industrial works or are commonly used by practitioners to compute code clarity metrics on source code artifacts developed in many different languages [@mshelia2017comparative]. 

A recent systematic literature review had led to identify fourteen *open-source* tools able to compute a large set of different static metrics for a great variety of different programming languages [@ardito2020tool]. 

Those tools do not provide a complete coverage of the most common metrics, just a specific set of them. Other ones, instead, they provide only a certain number of metrics according to the type of the license acquired by a user. In addition, as a negative aspect, some of them appears to be unmaintained.

# Why Rust as guideline?

C.F https://msrc-blog.microsoft.com/2019/07/16/a-proactive-approach-to-more-secure-code/

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

# Static analysis tools

Four levels can be considered to define and structure the tools dedicated to perform static software analysis:

* *Unit Level*: Analysis that takes place within a specific program or subroutine, without connecting to the context of that program

* *Technology Level*: Analysis that takes into account interactions between unit programs to get a more holistic and semantic view of the overall program in order to find issues and avoid obvious false positives
    
* *System Level*: Analysis that takes into account the interactions between unit programs, but without being limited to one specific technology or programming language

* *Mission/Business Level*: Analysis that takes into account the business/mission layer terms, rules and processes that are implemented within the software system for its operation as part of enterprise or program/mission layer activities. These elements are implemented without being limited to one specific technology or programming language and in many cases are distributed across multiple languages, but are statically extracted and analyzed for system understanding for mission assurance


Buffer overflow is but one of many problems that can lurk in a body of software code. Static analysis is very effective in detecting a variety of different kinds of insidious software errors like buffer overflow. Rust solves this problem detecting buffer overflows at runtime, so building a static analysis tool with Rust avoids that the analyzer contains those kind of errors.

## rust-code-analysis

For static metrics of the most common programming languages (excluded Java)

#### rust-code-analysis

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