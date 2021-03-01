---
tags: wp2.1, wp2, deliverable
title: 2.software-assessment
---

# Software Quality Assessment

*Software Quality Assessment* consists of several methodologies to evaluate the quality of different aspects and behavior of a software through an assessment model. An assessment model contains quality criteria with clear methods to assess each quality criterion. The assessment method is often a mathematical model which aggregates product metrics to quality factors [@mapping].

Deissenboeck et all in [@quamoco] presented a tool chain for supporting, creating and editing quality models as well as for conducting automated quality assessments.

A software can be considered adequate if it satisfies its requirements.

The requirements can be grouped in _functional requirements_ and _non-functional requirements_.

With _functional requirements_ we consider all the requirements specific to a given application. 

With _non-functional requirements_ we consider the basic attributes that are common in all software, notwithstanding their specific behavior and design.

Most of the _non-functional_ requirements can be evaluated by automatic means. Tools can be used to produce reports and metrics with little to none human interaction.

A good deal of _functional_ requirements cannot be automatically assessed and require dedicated professional insights in order to be confirmed. The approach of declaring capabilities and other form of software contract allows some automatic assessment of the intended behavior.

The wp2.x focus is on providing tools to automate the software assessment in order to minimize the effort to maximize the software quality.

We will better describe a series of tools adopted in this project in *deliverable 2.2*.

## Functional requirements

Even if assessing functional requirements is generally a manual process that often requires domain expertise, there are few automation chance. 

### Documentation

It is not generally possible to make sure that the user documentation are in sync with the software itself without having developers and Quality Assurance experts cross-checking manually.

The developer documentation, though, can have a partial automatic assessment. While human intervention is needed to make sure the documentation is in sync, it is easy to detect where the documentation is missing completely and make so that new code with no documentation is not accepted.

### Behavior

#### Testing
Unit and integration testing are a widespread alternative to the more formal and cumbersome design by contract. Both allows some automatic verification of the software behavior.

In both cases writing the tests requires a creative effort, but running the tests in a proper Continuous Integration environment does not require further human effort.

#### Sandboxing
Some platform provide means to restrict the application to use the least amount of privileges, this is a easy an practical mean to ensure that the application cannot misbehave.

iOS capabilities and Android Manifest Permission are good examples, macOS Gatekeeper on the other hand is a good case study on how badly set restrictions may cause more problems than the ones they are supposed to solve.

## Non-functional requirements

The most important non-functional requirement is *maintanability*.

*Software maintainability* is defined as the ease of maintaining software during the delivery of its releases. Maintainability is defined by the ISO 9126 standard as

_The ability to identify and fix a fault within a software component_ [@iso-9126] and by the ISO/IEC 25010:2011 standard as _degree of effectiveness and efficiency with which a product or system can be modified by the intended maintainers_ [@iso-25010].
 
Maintainability is an integrated software measure that encompasses some code characteristics, such as readability, documentation quality, simplicity, and understandability of source code [@aggarwal2002integrated]. 

Maintainability is also a crucial factor in the economic success of software products. It is commonly accepted in the literature that the most considerable cost associated with any software product over its lifetime is the maintenance cost [@zhou2007predicting]. The maintenance cost is influenced by many different factors, e.g., the necessity for code fixing, code enhancements, the addition of new features, poor code quality, and subsequent need for refactoring operations [@nair2020towards].

The aspects of maintanability we focus on are the following:

- defect detection through code analysis.
- testing coverage measurement and maximization through profiling.
- understandability assessment through objective metrics

The 3 aspects are complementary to each other:

- maximizing the test coverage improves the results of the dynamic code analysis
- the undestandability objective metrics computation is few orders of magnitude simpler than static code analysis. Running the latter in the subset of the codebase deemed hard to understand by the former can provide interesting results in a fraction of the time.


### Static code analysis

Static code analysis is the analysis of the code of a computer software and is usually performed without actually executing the relative program, in contrast with dynamic analysis, which is analysis performed on programs while they are in execution.
[@Wichmann; @Egele]

Static analysis is mainly adopted by the industry for quality assurance purposes [@Wichmann] and it is normally used in safety-critical computer systems with the aim of locating potentially unsafe and insecure code [@Livshits].

Many industries have identified the use of static code analysis as a means of improving the quality of increasingly sophisticated and complex software:

* *Medical software*
* *Nuclear software*
* *Aviation software*
* *Automotive & Machines*

This analysis is usually performed by automatic tools and the produced results are then supervised through human intervention since the analysis may find false positives.

Program analysis is strongly influenced by the semantics of a language and the strength of the analysis may well depend on subtle features of the language, so it fundamental defining a programming language in the most accurate way [@Wichmann]. Indeed, dynamic languages are more difficult to analyze than languages that include, for example, strong typing and range constraints. Hence, the nature of the input language needs to be taken into account in the specification of the static analysis to be undertaken.

The information obtained from the analysis of a code can be used to just highlight errors or define formal methods to mathematically prove whether the behavior of a code matches its specification.

In the sections below, we will present a series of open source and closed source solutions currently in use in academic and industrial world.

#### Open source solutions 

Open source solutions can be particularly useful since they can be extended to support new platforms without the involvement of the original authors and they are not tied to a specific vendor.

They may have a quite varying level of maturity.

[Clang Static Analyzer](https://clang.llvm.org/docs/ClangStaticAnalyzer.html)
: It leverages the clang parsers to perform static analysis over the languages supported by clang itself. It provides a detailed html report or provides the report within the IDE.

[GCC -fanalyze](https://gcc.gnu.org/onlinedocs/gcc-10.1.0/gcc/Static-Analyzer-Options.html)
: It produces extended diagnostic messages and some GraphViz-compatible diagrams. As per GCC 10 it is its infancy and under heavy development. Only C is currently supported.

[Infer](http://fbinfer.com/) 
: Infer is a static analysis tool developed by Facebook and written in the Ocaml programming language. It supports C, C++, objC and Java. It offers integration with build-systems and provides reports in textual/diagnostic form, html and json.

#### Closed source solutions

Closed source solutions tend to be more feature-rich and more polished and they offer extended support to its customers.

It may be difficult to have them adapted and extended for specific needs.

[PVS-Studio](https://www.viva64.com/en/pvs-studio/)
: It is a set of tools to run on-premise static analysis. It has integrations for build-systems, IDEs and Continuous Integration systems.

[Coverity Scan](https://scan.coverity.com/)
: It is an analysis *as-service* platform. It requires to run a local scanner tool and then upload its payload to run the analysis on the remote platform. It supports out of box GitHub and Travis-CI. 

[LGTM](https://lgtm.com/) 
: it is a code analysis platform similar to Coverity Scan. It has better integrations with source hosting platforms such as GitHub and offers a specific query language to dig deeper in the codebases and find structural similarities.

### Dynamic code analysis

A *Dynamic* code analysis evaluates the code whereas it is being executed, either by using specifically instrumented builds or by running unmodified code through special runtimes parameters.

Differently from a static analysis which is more focused on the structural aspects of a software system, a dynamic analysis is more interested in detecting the behavioral aspects of a system.

Furthermore, a dynamic analysis provides more precisely measures of the internal attributes of a software, such as coupling, complexity etc., on the basis of the data collected during actual execution of the system, which have direct impact on quality factors of a software such as reliability, testability, maintainability, performance, and error-rates.

Below we present a simple comparative comparison table to illustrate the differences between the metrics produced by a static and a dynamic analysis [@Kumar].


| Static Metrics                                                                                                        | Dynamic Metrics                                                                     |
|-----------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|
| Simpler to collect                                                                                                    | Difficult to obtain                                                                 |
| Available at the early stages of software development                                                                 | Accessible very late in software development lifecycle                              |
| Less accurate than dynamic metrics in measuring qualitative attributes of software                                    | Suitable for measuring quantitative as well as qualitative attributes of software |
| Deal with the structural aspects of the software system                                                               | Deal with the behavioral aspects of the system also                                 |
| Inefficient to deal with object-oriented features such as inheritance, polymorphism and dynamic binding | Dynamic metrics are capable to deal with all object-oriented features |
| Less precise than dynamic metrics for the real-life systems                                                           | More precise than static metrics for the real-life systems                          |

Below we present a series of tools which can be used to obtain some dynamic metrics about a software.

[Valgrind](https://www.valgrind.org/)
: It allows running unmodified binaries. It dynamically recompiles the binary as it runs on a simulation of the host cpu. The process tends to be slower than the instrumentation approach and requires platform-specific support, making it supporting new processors and operating systems more involving.

[DynamoRIO](https://github.com/DynamoRIO/dynamorio)
: It uses an approach similar to Valgrind, but it focuses on providing building blocks instead of a toolkit of ready-to-use tools.

[AddressSanitizer and MemorySantitizer](https://github.com/google/sanitizers)
: Introduced in [LLVM](https://clang.llvm.org/docs/AddressSanitizer.html) and ported to [GCC](https://gcc.gnu.org/onlinedocs/gcc/Instrumentation-Options.html), they are a form of instrumentation and thus bound to a specific compiler and a set of helper libraries.
They offer better execution speed and their integration with debuggers such as [GDB](https://www.gnu.org/software/gdb/) or [RR](https://rr-project.org/) makes them a good alternative to Valgrind.

[miri](https://github.com/rust-lang/miri/)
: Miri is a specific tool to instrument and analyze the middle-level intermediate language currently used by Rust.
It instruments the code and runs it on a generic platform abstraction. 


### Code Coverage

Coverage test is a measure used to describe the degree to which the source code of a program is executed when a particular test suite runs. 
A program with high test coverage, measured as a percentage, has had more of its source code executed during testing, which suggests it has a lower chance of containing undetected software bugs compared to a program with low test coverage.

Basic coverage criteria

* Function coverage
* Statement coverage
* Edge coverage
* Branch coverage
* Condition coverage (or predicate coverage)


Mutation and Fuzz Testing can be used for improving the effectiveness of software test cases, and the coverage.

In Mutation Testing some statements of the source code are changed (mutated) to check if the test cases are able to find errors in source code. The goal of Mutation Testing is ensuring the quality of test cases in terms of robustness that it should fail the mutated source code. In Parveen et al [@parveen] presented an automated framework to evaluate taint flow analysis tools in the domain of IoT (Internet of things) apps.

Fuzz Testing is a software testing technique of putting invalid or random data (called FUZZ) into software system to discover coding errors and security loopholes. The purpose of fuzz testing is inserting data using automated or semi-automated techniques and testing the system for various exceptions like system crashing or failure of built-in code.
As described by Kumar et al in [@kumar] fuzzy techniques aims to reduce the number of test cases so that it is possible to achieve more efficient and accurate results. Fuzzy clustering is a class of algorithms for cluster analysis in which the allocation of similar test cases is done to clusters that would help in finding out redundancy incorporated by test cases.

Code coverage tools popularity and usage strictly depend on the language they support. Most code-coverage approach rely on specific instrumentation of the running code, few rely on the normal debug information and runtime capabilities.

Here we present some examples of the most common ones.

[JACOCO](https://www.jacoco.org/)
: JaCoCo provides technology for code coverage analysis in Java VM based environments. The focus is providing a library for integration with various build and development tools.

[Coverage](https://coverage.readthedocs.io/en/coverage-5.5/)
: Coverage is a tool for measuring code coverage of Python programs. It monitors a python program showing which parts of the code have been executed, then analyzes the source to identify code that could have been executed but was not.

[gcov](https://gcc.gnu.org/onlinedocs/gcc/Gcov.html) and [llvm-cov](https://llvm.org/docs/CommandGuide/llvm-cov.html)
: Compiler-specific tool to extract coverage information from binaries compiled with the profiling harness (e.g. `-fprofile-arcs -ftest-coverage`)

[lcov](https://github.com/linux-test-project/lcov)
: Aggregates the coverage information generated by the `gcov` family of tools and produces reports in machine-parsable and human-readable formats.

[kcov](https://github.com/SimonKagstrom/kcov)
: Relies on the DWARF debugging information and the platform-specific debug capabilities (e.g. ptrace) in order to extract coverage information from non-instrumented binaries.

[GCOVR](https://gcovr.com/en/stable/) and [GRCOV](https://github.com/mozilla/grcov)
: They collect and aggregate the coverage information provided by other tools. Both tools retain compatibility with `lcov` but support additional input and output formats.


### Code Clarity

_*Code Clarity* is clearness or lucidity as to perception or understanding of a code, freedom from indistinctness or ambiguity._[^Oliver]

The main goal consists of maximizing the amount of understanding conveyed in the way a code is written which needs to be easy to read, understand, and modify. Achieving clarity is about so much more than proper indentation, it requires code to be organized well, with careful planning and proper separation.

This concept impacts on *code maintainability* also, indeed, a poorly written code can mean months of development later, while a clearly written code can also mean merely minutes or hours of maintenance in the future.

Code clarity can be evaluated through different standards and measures. 
As standards, we can consider the rules related to naming conventions and the ones which attempt to regulate the use of white spaces, so where comments, spaces, and braces *should* be put within a code. 

Naming is important because it affects the readability of a code and the ease with which that code can be understood when it needs to be reviewed. Naming conventions are not meant to help the compiler or an interpreter. Indeed, a compiler or an interpreter has no trouble distinguishing names, no matter how long, short, they are. But, a good name could help humans to get through a code in an easier way.

If a compiler or an interpreter does not consider at all the adopted naming convention, it considers even less the use of white spaces. There is a difference between the two though. Formatting choices are relatively easy to change using a specific tool, while it is much harder to change a program to adhere to a different naming convention than the original programmer used, assuming of course that they used one in the first place.

Clearly, the names adopted by functions and identifiers impact on code clarity, but it would be hard to capture this simple fact into a single rule or a simple naming convention which could be applied uniformly to all code. It comes down to the judgment of the programmer whether a verb or a noun best captures the intent of a function.

An observed pattern states that very long names are pretty rare, while short names are best used for things that do not require much attention [@Holzmann].

For what concerns measures instead, three have been created to evaluate the clarity of a code[^Gregory]:

* *Command-query separation*
* *Loose coupling*
* *High Cohesion*

With the exception of the *Command-query separation*, the other ones require an object-oriented language to be used. We are going to explore in the following deliverables whether those kind of measures can also be applied to trait-based languages like Rust.

#### Command-query separation 

*Command-query separation* provides a basis of safeguarding a code against unintended side effects when functions are called. Functions can be *commands*, which perform an action, and *queries*, which answer a question. A function should *not* be both of them simultaneously. 

Thus a function which answers a question, it should return a value, and not alter the state of the data, so running a command. Conversely, if a function runs a command, it should alter the state of the data without returning a value. For maximum clarity, a function *should* never return a value and alter the state of the data.

This kind of separation can clarify intent and prevent errors. As functions and code bases become larger, separation becomes much more important, as hunting for the function definition to find out what it does is not an efficient use of time.

#### Loose coupling 

*Coupling* is a measure of how much one program unit relies on others. Too much coupling (or tight coupling) is rigid and should be avoided, so a code needs to be flexible enough to cover a wide variety of use cases. 

Tight coupling consists of copying and pasting code, making minor changes to it, or rewriting code because it has been changed somewhere else in the codebase. This behavior is most prevalent in a group of functions and variables which could be better represented as a class. So when there are problems with inter-dependencies among functions, it is probably time to break functions into a new class.

A common case usually occurs when a developer is forced to either use an absurd amount of function parameters or create multiple copies of each function with the variables hard-coded in each one.

The problem above could be solved using the *loose coupling* approach, which generally results in much greater clarity. It consists of breaking up the functions and variables into a reusable class. As a result, we finish having fewer functions, with the variables stored in only one place, making updates much easier.

But tight coupling can also be present when a determined class needs to be modified because another one changes, which usually happens when a class depends on methods or properties taken from other classes. For example, not to break the code when new parameters are added to a class, a *loose coupling* way could be passing the constructor parameters as an object with the receiving object having fallback default values.

So a good code should be built as a series of independent block, easily connectable one to each other, and not as a series of intertwined pieces.

#### High cohesion 

*Cohesion* is a measure of how much the various different program units belong together. A high level of cohesion is good and adds clarity to code blocks, instead a low level of cohesion is bad and leads to much confusion. Functions and methods in a code block should make sense together, in practice having a high level of cohesion.

High cohesion means sticking related things, for example database functions or functions relating to a particular element, in one block or module. This helps not only with understanding how such things are laid out and where to find them, but also with preventing naming conflicts. If there are 30 functions, the chances of a conflicting name are far greater than when there are 30 methods split over four classes.

If two or three functions use the same variables, they belong together. For example, a series of functions and variables that control a page element, like a slider, represent a great opportunity for high cohesion, since it is possible to bundle them up into an object.

Repeated code is a sure sign of low cohesion. Similar lines of code should be broken into functions, and similar functions should be broken into classes. The rule of thumb here is that a line of code should never be repeated twice. In practice, this is not always possible, but it is always a good thing thinking about how to cut down on repetition.

Similarly, the same bit of data should not exist in more than one variable. If the same bit of data are defined in multiple places, it is better to group it into a class. Or when references to the same element need to be passed to multiple functions, that reference should probably be a property in an instance of a class.

To further increase cohesion, objects can even be put inside other objects.
Conversely, unrelated things should not be together in the same class. If properties are not used by multiple methods in a class, this can be a sign of low or bad cohesion. Similarly, if methods cannot be reused in a few different situations, or if a method is not used at all, this can also be a sign of low or bad cohesion.

High cohesion helps to alleviate tight coupling, and tight coupling is a sign that greater cohesion is needed. If the two ever come into conflict, though, choose cohesion. High cohesion is generally a greater help to the developer than loose coupling, although both can usually be accomplished together.

### Code Maintainability

*Code maintainability* comprehends a series of different metrics to evaluate many aspects related to the maintainability of a code.

One of them is the *verbosity* and it is usually considered in terms of the number of code lines in a source file.

SLOC
: Source Lines of Code. It returns the total number of lines in a file.

PLOC
: Physical Lines of Code. It returns the number of instructions and comment lines in a file.

LLOC
: Logical Lines of Code. It returns the number of logical lines (statements) in a file.

CLOC
: Comment Lines of Code. It returns the number of comment lines in a file.

BLANK
: Blank Lines of Code. It returns the number of blank lines in a file.

The rationale behind using multiple measurements for the lines of code can be motivated by the need for measuring different facets of the size of code artifacts and of the relevance and content of the lines of code. 

The measurement of physical lines of code (*PLOC*) does not take into consideration blank lines or comments, however, the count depends on the physical format of the statements and programming style since multiple *PLOC* can concur to form a single logical statement of the source code. *PLOC* are sensitive to logically irrelevant formatting and style conventions, while *LLOC* are less sensitive to these aspects [@nguyen2007sloc]. 

In addition to that, the *CLOC* and *BLANK* measurements allow a finer analysis of the amount of documentation (in terms of used APIs and explanation of complex parts of algorithms) and formatting of a source file.

Another aspect is how a code is *structured*, so how the structure of a source code is analyzed in terms of the properties and functions that compose the source files. To that end, three metrics have been adopted:

NOM
: Number of Methods. It counts the number of methods in a file.

NARGS
: Number of Arguments. It counts the number of arguments of each method in a file.

NEXITS
: Number of Exit Points. It counts the number of exit points of each method in a file.

*Nargs* and *Nexits* are intuitively linked with the easiness in reading and interpreting a source code: a function with a high number of arguments can be more complex to analyze because of a higher number of possible paths, while a function with many exits may include higher complexity in reading the code for performing maintenance efforts.

To evaluate the *complexity* of a code, we have identified the following metrics:

CC
: McCabe's Cyclomatic Complexity. It calculates the code complexity examining the control flow of a program.

COGNITIVE
: Cognitive Complexity. It is a measure of how difficult a unit of code is to intuitively understand. 

Halstead
: It calculates the Halstead suite. 

The Halstead Suite, a set of quantitative complexity measures originally defined by Maurice Halstead, is one of the most popular static code metrics available in the literature [@hariprasad2017software]. 

The details about the computation of all operands and operators are described in the table below:

|   Symbol  |                Description               |
|:---------:|:----------------------------------------:|
| $$\eta1$$ |       Number of distinct operators       |
| $$\eta2$$ |        Number of distinct operands       |
|   $$N1$$  | Total number of occurrences of operators |
|   $$N2$$  |  Total number of occurrences of operands |

<br>

While this other table contains all the remaining metrics of the Halstead Suite computed from the operators and operands presented above:


|                Measure                |  Symbol  |                     Formula                     |
|:-------------------------------------:|:--------:|:-----------------------------------------------:|
|             Program length            |   $$N$$  |                 $$N = N1 + N2$$                 |
|           Program vocabulary          | $$\eta$$ |             $$\eta = \eta1 + \eta2$$            |
|                 Volume                |   $$V$$  |              $$$V = N*log_2(\eta)$$             |
|               Difficulty              |   $$D$$  |            $$D = \eta1/2 * N2/\eta2$$           |
|             Program Level             |   $$L$$  |                   $$L = 1/D$$                   |
|                 Effort                |   $$E$$  |                   $$E = D*V$$                   |
|        Estimated Program Length       |   $$H$$  | $$H = \eta1*log_2(\eta1) + \eta2*log_2(\eta2)$$ |
| Time required to program (in seconds) |   $$T$$  |                   $$T = E/18$$                  |
|        Number of delivered bugs       |   $$B$$  |              $$ B = E^{2/3}/3000$$              |
|              Purity Ratio             |  $$PR$$  |                   $$PR = H/N$$                  |

<br>

At last, we present a composite metric to provide a single index of maintainability for software [@oman1992metrics], called *Maintainability Index*. 

MI
: Maintainability Index. It is a suite to measure the maintainability of a code. It is calculated both on files and functions.

Three different variants of this metric are considered. The original formula, created by Oman et al.., then the one defined by the Software Engineering Institute (*SEI*) and promoted in the C4 Software Technology Reference Guide [@bray1997c4], and finally the variant implemented for the Visual Studio IDE [@mi-vs]. 

The *SEI* formula adds to the original formula a specific treatment for the comments in the source code (i.e., the *CLOC* metric), and it is deemed by research as more appropriate, given that the comments present in a source code can be considered correct and appropriate [@welker2001software]. 

The last formula, instead, resettles the MI value in the 0-100 range, without considering the distinction between *CLOC* and *SLOC* operated by the SEI formula [@molnar2017discovering].

The respective formulas are reported in the table below. 

|   Variant  |                                                Formula                                               |
|:----------:|:----------------------------------------------------------------------------------------------------:|
| *Original* |                         $$171.0 - 5.2 * ln(V) - 0.23 * CC - 16.2 * ln(SLOC)$$                        |
|    *SEI*   | $$171.0 - 5.2 * log_2(V) - 0.23 * CC - 16.2 * log_2(SLOC) + 50.0 * sin(\sqrt{2.4 * (CLOC / SLOC)})$$ |
|    *VS*    |                $$\max(0,(171 - 5.2 * ln(V) - 0.23 * CC - 16.2 * ln(SLOC))*100 / 171)$$               |

<br>

The interpretation of the measured MI varies according to the adopted formula to compute it, below the ranges for each of them. 

|   Variant  | Low Maintainability | Medium Maintainability | High Maintainability |
|:----------:|:-------------------:|:----------------------:|:--------------------:|
| *Original* |     $$MI < 65$$     |    $$65 < MI < 85$$    |      $$MI > 85$$     |
|    *SEI*   |     $$MI < 65$$     |    $$65 < MI < 85$$    |      $$MI > 85$$     |
|    *VS*    |     $$MI < 10$$     |    $$10 < MI < 20$$    |      $$MI > 20$$     |

<br>

For the original and the *SEI* formulas of the *MI*, a value over 85 indicates an easily maintainable code, a value between 65 and 85 indicates average maintainability for the analyzed code, while a value under 65 indicates hardly maintainable code. The original and *SEI* formulas can also assume negative values. With the Visual Studio formula, the thresholds for medium and high maintainability are moved respectively to 10 and 20. 

[^Oliver]: https://gorails.com/blog/why-you-should-focus-on-writing-code-with-clarity Last visited 22/01/2021

[^Gregory]: https://alistapart.com/article/coding-with-clarity/ Last visited 22/01/2021