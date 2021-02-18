---
tags: wp2.1, wp2, deliverable
title: 2.software-assessment
---

https://gcc.gnu.org/wiki/DavidMalcolm/StaticAnalyzer



# Software Quality Assessment

*Software Quality Assessment* consists of several methodologies to evaluate the quality of different aspects and behavior of a software through an assessment model. An assessment model contains quality criteria with clear methods to assess each quality criterion. The assessment method is often a mathematical model which aggregates product metrics to quality factors [@swqualmapping].

**TODO**: Quality model papers: https://xin-xia.github.io/publication/scis181.pdf

http://mediatum.ub.tum.de/doc/1169637/955300.pdf

A software can be considered adequate if it satisfies its requirements.

The requirements can be grouped in _functional requirements_ and _non-functional requirements_.

With _functional requirements_ we consider all the requirements specific to a given application. 

With _non-functional requirements_ we consider the basic attributes that are common in all software, notwithstanding their specific behavior and design.

Most of the _non-functional_ requirements can be evaluated by automatic means. Tools can be used to produce reports and metrics with little to none human interaction.

A good deal of _functional_ requirements cannot be automatically assessed and require dedicated professional insights in order to be confirmed. The approach of declaring capabilities and other form of software contract allows some automatic assessment of the intended behavior.

The wp2.x focus is on providing tools to automate the software assessment in order to minimize the effort to maximize the software quality.



## Functional requirements

Even if assessing functional requirements is generally a manual process that often requires domain expertise, few important requirements have good automation possibility. 

### Documentation
It is not generally possible to make sure that the user documentation are in sync with the software itself without having developers and Q/A cross-checking manually.

The developer documentation can have a partial automatic assessment. While human intervention is needed to make sure the documentation is in sync, it is easy to detect where the documentation is missing completely.

### Behavior
Unit and integration testing are a widespread alternative to the more formal and cumbersome design by contract. Both allows some automatic verification of the software behavior.

In both cases writing the tests requires a creative effort, but running the tests and set up a proper Continuous Integration environment does not.

Some platform provide means to restrict the application to use the least amount of privileges, this is a easy an practical mean to ensure that the application cannot misbehave.

iOS capabilities and Android Manifest Permission are good examples, macOS Gatekeeper on the other hand is a good case study on how this restrictions may cause more problems than the ones they are supposed to solve.

## Non-functional requirements

The most important non-functional requirement is *maintanability*.

*Software maintainability* is defined as the ease of maintaining software during the delivery of its releases. Maintainability is defined by the ISO 9126 standard as

> The ability to identify and fix a fault within a software component 
>
> -- [@iso-9126] and by the ISO/IEC 25010:2011 standard as

> degree of effectiveness and efficiency with which a product or system can be modified by the intended maintainers
> 
> -- [@iso-25010]
 
Maintainability is an integrated software measure that encompasses some code characteristics, such as readability, documentation quality, simplicity, and understandability of source code [@aggarwal2002integrated]. 

Maintainability is also a crucial factor in the economic success of software products. It is commonly accepted in the literature that the most considerable cost associated with any software product over its lifetime is the maintenance cost [@zhou2007predicting]. The maintenance cost is influenced by many different factors, e.g., the necessity for code fixing, code enhancements, the addition of new features, poor code quality, and subsequent need for refactoring operations [@nair2020towards].

The aspects of maintanability we focus on are the following:
- defect detection through code analysis.
- testing coverage measurement and maximization through profiling.
- understandability assessment through objective metrics

The 3 aspects are complementar to each other:
- maximizing the test coverage improves the results of the dynamic code analysis
- the undestandability objective metrics computation is few orders of magnitude simpler than static code analysis. Running the latter in the subset of the codebase deemed hard to understand by the former can provide interesting results in a fraction of the time.


### Static code analysis

Assigned to @Luni-4 

Static code analysis is the analysis of the code of a computer software and is usually performed without actually executing the relative program, in contrast with dynamic analysis, which is analysis performed on programs while they are in execution.
[@Wichmann; @Egele]

Static analysis is mainly adopted by the industry for quality assurance purposes [@Wichmann] and it is normally used in safety-critical computer systems with the aim of locating potentially unsafe and insecure code [@Livshits].

Many industries have identified the use of static code analysis as a means of improving the quality of increasingly sophisticated and complex software:
* *Medical software*
* *Nuclear software*
* *Aviation software*
* *Automotive & Machines*

This analysis is usually performed by automatic tools and the produced results are then supervised through human intervention.

Program analysis is strongly influenced by the semantics of a language and the strength of the analysis may well depend on subtle features of the language, so it fundamental defining a programming language in the most accurate way [@Wichmann]. Indeed, dynamic languages are more difficult to analyze than languages that include, for example, strong typing and range constraints. Hence, the nature of the input language needs to be taken into account in the specification of the static analysis to be undertaken.

The information obtained from the analysis of a code can be used to just highlight errors or define formal methods to mathematically prove whether the behavior of a code matches its specification.

In the sections below, we will present a series of open source and closed source solutions currently in use in academic and industrial world.

#### Open source solutions

Open source solutions can be useful when industries and universities need to study, modify, and improve the code of a static code analysis tool. Furthermore, knowing the source code of a tool can help detecting insecurities in its code very fast, and consequently fixing bugs as soon as possible. 

Most of the time the tools which follow the open source model are licensed in such a way that contributing to them results rather regulated for external contributors. In addition, a series of items allows to access the code in an efficient way, for example through Internet hosting such as `GitHub` or `GitLab`.

##### Clang Static Analyzer

The *Clang Static Analyzer*, https://clang-analyzer.llvm.org/, is a source code analysis tool that finds bugs in C, C++, and Objective-C programs. Its main goal is to provide a industrial-quality static analysis framework for analyzing C, C++, and Objective-C programs which is freely available, extensible, and has a high quality of implementation. It is implemented as a C++ library such that can be used by other tools and applications.

The project is a continuous work-in-progress. So using static analysis to automatically find deep program bugs is about trading CPU time for the hardening of code. Because of the deep analysis performed by state-of-the-art static analysis tools, static analysis can be much slower than compilation. In fact, some of the algorithms needed to find bugs require in the worst case exponential time. The analyzer is able to run in a reasonable amount of time by both bounding the amount of checking work it will do as well as using clever algorithms to reduce the amount of work it must do to find bugs.

The analysis performed by the analyzer is not perfect, it can falsely flag bugs in a program where the code behaves correctly. Because some code checks require more analysis precision than others, the frequency of false positives can vary widely between different checks.

##### GCC -fanalyze option

Since GCC version 10, the compiler adds an option to perform a static analysis pass in order to diagnose various kinds of problems in C code at compile-time (e.g. double-free, use-after-free, etc).

The analyzer itself is implemented as an interprocedural pass for GCC. It is off by default, and must be enabled setting up the *-fanalyzer* option.

The analyzer associates state machines with data, with transitions at certain statements and edges. It finds interprocedural paths through the user's code, in which bogus state transitions happen. 

##### Infer

Infer is a static analysis tool developed by Facebook and written in Ocaml programming language which produces a list of potential bugs receiving some Java or C/C++/Objective-C code as input. It is thought to help prevent crashes or poor performance.

It is running continuously to verify select properties of every code modification for the main Facebook apps for Android and iOS, Facebook Messenger, Instagram, and other apps. 

At present Infer is tracking problems caused by null pointer dereferences and resource and memory leaks, which cause some of the more important problems on mobile.


#### Closed source solutions

Closed source solutions are usually thought for services provided *uniquely* by a single firm. So it is not possible to freely contribute to the development of those kind of software at all. If one wants to study how they work, most of the time it is required to buy them. 

Since those firms provide their solution in a closed form, their software could be very expensive in some cases, so small firms or research groups may not afford to use them over long periods of time.

##### PVS-Studio

*PVS-Studio* is a tool for detecting bugs and security weaknesses in the source code of programs written in C, C++, C# and Java. It works under 64-bit systems in Windows, Linux and macOS environments, and can analyze source code intended for 32-bit, 64-bit and embedded ARM platforms.

This tool performs static code analysis and generates a report that helps a programmer find and fix bugs. It performs a wide range of code checks, and it is also useful in finding misprints and copy-paste errors.

Using *PVS-Studio* regularly helps identifying and fixing errors at the earliest stages. So the the main idea proposed by this tool is not to find one hidden bug on the day before the release, but to fix dozens of bugs day by day.

The analyzer can be run at night on a server and it will warn about suspicious code fragments automatically. Ideally, these errors can be detected and fixed before getting into the version control system. *PVS-Studio* can automatically be launched immediately after the compiler for the files that have been just modified.

##### Coverity Scan

Coverity Scan is a closed source service offered by *Synopsys* which provides the results of analysis on open source coding projects to open source code developers that have registered their products with Coverity Scan.

Synopsys, the development testing leader, is the standard for companies that need to protect their brands and bottom lines from software failures. It offers the results of the analysis on registered projects at no charge to registered open source developers.

*Synopsis* is focused on finding source code defects and vulnerabilities.  Additionally, Synopsys's implementation of static analysis can follow all the possible paths of execution through source code and find defects and vulnerabilities caused by the conjunction of statements that are not errors independent of each other.

##### LGTM
: Similar analysis service, their approach on providing a query engine to find similar pattern within different codebases is fairly interesting.

### Dynamic code analysis

Assigned to @Luni-4 

A. Tahir and R. Ahmad, “An aop-based approach for collecting software
maintainability dynamic metrics,” in 2010 Second International Confer-
ence on Computer Research and Development, pp. 168–172, May 2010.

Analyze the code as it is executed. Either by using specifically instrumented builds or by running unmodified code through special runtimes.

[Valgrind](https://www.valgrind.org/)
: It allows running unmodified binaries. It dynamically recompiles the binary as it runs on a simulation of the host cpu.

[DynamoRIO](https://github.com/DynamoRIO/dynamorio)
: It uses an approach similar to Valgrind, but it focuses on providing building blocks instead of a toolkit.

[AddressSanitizer, MemorySantitizer and related](https://github.com/google/sanitizers)
: Introduced in [LLVM](https://clang.llvm.org/docs/AddressSanitizer.html) and ported to [GCC](https://gcc.gnu.org/onlinedocs/gcc/Instrumentation-Options.html), they are a form of instrumentation and thus bound to a specific compiler and helper libraries.


### Code Coverage

Assigned to @lucaardito

Coverage test is a measure used to describe the degree to which the source code of a program is executed when a particular test suite runs. 
A program with high test coverage, measured as a percentage, has had more of its source code executed during testing, which suggests it has a lower chance of containing undetected software bugs compared to a program with low test coverage.

Basic coverage criteria

* Function coverage
* Statement coverage
* Edge coverage
* Branch coverage
* Condition coverage (or predicate coverage)

TODO: mention fuzzing/mutation testing as a mean to extend the code coverage.
TODO: mention gcovr and grcov as open-source alternative (for grcov there are documents produced by Marco around) and some closed-source alternatives


### Code Clarity

Assigned to @Luni-4 

Code clarity refers to the understandability of a code, so the measure of complexity of its information.

A list of some of the most common code clarity metrics present in scientific literature:

* **SLOC**: Source Lines of Code. It returns the total number of lines in a file.
* **PLOC**: Physical Lines of Code. It returns the number of instructions and comment lines in a file.
* **LLOC:** Logical Lines of Code. It returns the number of logical lines (statements) in a file.
 * **CLOC:** Comment Lines of Code. It returns the number of comment lines in a file.
 * **BLANK:** Blank Lines of Code. It returns the number of blank lines in a file.
 * **NOM:** Number of Methods. It counts the number of methods in a file.
 * **NARGS**: Number of Arguments. It counts the number of arguments of each method in a file.
 * **NEXITS**: Number of Exit Points. It counts the number of exit points of each method in a file.
 * **CC:** McCabe's Cyclomatic Complexity. It calculates the code complexity examining the control flow of a program.
 * **COGNITIVE**: Cognitive Complexity. It is a measure of how difficult a unit of code is to intuitively understand. 
 * **Halstead:** It calculates the Halstead suite. 
 * **MI:** Maintainability Index. It is a suite to measure the maintainability of a code. It is calculated both on files and functions.

“Ieee standard glossary of software engineering terminology,” IEEE Std
610.12-1990, pp. 1–84, Dec 1990.

J. Ostberg and S. Wagner, “On automatically collectable metrics for
software maintainability evaluation,” in 2014 Joint Conference of the
International Workshop on Software Measurement and the International
Conference on Software Process and Product Measurement, pp. 32–37,
Oct 2014.

M. Saboe, “The use of software quality metrics in the materiel release pro-
cess experience report,” in Proceedings Second Asia-Pacific Conference
on Quality Software, pp. 104–109, Dec 2001.

@ARTICLE {7420491,
author = {G. J. Holzmann},
journal = {IEEE Software},
title = {Code Clarity},
year = {2016},
volume = {33},
number = {02},
issn = {1937-4194},
pages = {22-25},
keywords = {linux;standards;market research;encoding;white spaces;software reliability},
doi = {10.1109/MS.2016.44},
publisher = {IEEE Computer Society},
address = {Los Alamitos, CA, USA},
month = {mar}
}

Many tools have been presented in academic and industrial works or are commonly used by practitioners to compute code clarity metrics on source code artifacts developed in many different languages [@mshelia2017comparative]. 

A recent systematic literature review had led to identify fourteen *open-source* tools able to compute a large set of different static metrics for a great variety of different programming languages [@ardito2020tool]. 

Those tools do not provide a complete coverage of the most common metrics, just a specific set of them. Other ones, instead, they provide only a certain number of metrics according to the type of the license acquired by a user. In addition, as a negative aspect, some of them appears to be unmaintained.

We will better describe a series of tools adopted in this project in *deliverable 2.2*.




