---
tags: wp2.2, wp2, deliverable
title: 2.Software Quality Guidelines
---

# Software Quality Guidelines

In this part of the document we propose some guidelines that a developer is **strongly** recommended to consider for software development, and consequently, software quality evaluation.

The guidelines will be structured as a workflow that describes step-by-step the procedures and methods a developer **should** follow to produce a software of good quality.

Regarding software quality instead, in deliverable 2.1 we have identified a series of different metrics to evaluate a software. All of them are part of a software engineering branch called *Software Maintainability* and below we present the ones which we consider notable from a developer perspective:

* *Static analysis*: analyzes the source code with the purpose of finding defects and providing some information to improve code quality.
* *Dynamic analysis*: analyzes a running software with the purpose of finding possible memory faults and security issues. In addition, it also detects the parts of a program that can be further optimized. 
* *Code coverage*: determines the percentage of source code covered by the test suite.

Some metrics can only give information on the status of a code or the bad practices adopted during the development phase, while other ones identify the faults present in a software. For this reason, we have grouped the metrics in two categories: *Fault metrics* and *Quality metrics*. Then, we have used those categories to define the stamps that allow to determine the quality level of a software.

For what concerns the arguments treated in this section, we start presenting the workflow structure followed by some practical workflow examples. The examples are focused on two languages, an innovative one called *Rust*, and the notorious *C* language.

Subsequently, we illustrate some software quality notions from a developer perspective, the meaning of the two metrics categories and finally the definition of the stamps.

In the last part instead, we will provide some additional notes about the *Rust* language, since it tries to solve by construction some of the defects pointed out by metrics, and some information on the *reproducibility* of the results obtained during the workflow steps.

We would like to specify that those guidelines are thought **only** for developers, so they are not aimed neither at system integrators nor at software distributors, even though it is possible to find  within the various subsections some information about software packaging and how to write tests for the final binary.

## Workflow Structure

Multiple tool may fit the same role within a good workflow, this chapter just suggests the phases and does not mention specific software, for specific scenarios please refer to [Example C Workflow][] and [Example Rust Workflow][].

### Main components
The workflow assumes a single project exists, with its **Build System**, it has a **Continuous Integration** setup and that includes a **Continuous Delivery** phase.

### Lifecycle
The workflow assumes that the software is developed using the **Pull Request** model:
- A patcheset is prepared, containing features and fixes and tests covering the code changes.
- The patchset is put in **review**
- The continuous integration automation will run a set of **fast static analysis**, as a rule of thumb this phase should be at least twice as fast as building the project:
    - Coding style checks
    - Code Quality Analysis
- If the phase passes then the CI will run increasingly more resource intensive tasks:
    - Compile tests
    - Static Fault Analysis
    - Unit tests
    - Integration tests
    - Code coverage evaluation
    - Dynamic Fault Analysis

- Once those phases pass and it is possible to prepare packages and ensure that the software would be ready for distribution.
- If all those phases passes and the **reviewers** approve the changes, the patchset is merged.

### Phases in detail
The workflow should try to minimize the developer wait time. As soon as a mistake is detected it should be reported. 

When possible most the fast tests should be run by the developer while writing the software.

Ideally all the checks should be integrated in the **build system**, making it more practical to execute locally every test when the need arises.

#### Fast static analysis
The fast static analysis is meant to enforce a level of uniformity through the linters and to provide a quick overview of the project state.

The code quality metrics execute quickly and their output can help the developer and the reviewer by highlighting the part of the code that have higher complexity and thus require more documentation and additional tests.

#### Compile test
Making sure the code builds for all the supported targets is important even if you are not going to run tests on all of them.

Setting up and keep operational a full test environment for many architectures can be cumbersome, having a cross-building setup is a good compromise.

If the code stops compiling on an architecture the problem has to be solved as soon as possible.

#### Static Fault Analysis
This kind of static analysis usually is as slow or few times slower than building the software by a normal compiler.

For many languages the compiler suite itself may include the capability.

The static analyzers can detect a good number of mistakes that could be overlooked on review and it is usually still faster than the phases coming later.

#### Testing
Proper **unit** and **integration** tests make sure that the behavior of the software is correct.

A single unit test is quick to write and usually quick to execute, but it adds up quickly and completing the unit test suite may require some time and resources.

Integration tests may be more cumbersome in general but they consider a bigger picture and catch mistakes unit tests cannot easily detect.

In general the tests should **cover** as much of the codebase as possible.

#### Coverage analysis
In order to measure how much of the code the tests cover some tools can be used for the purpose.

Some require *instrumenting specifically* the build, adding another **compilation** phase.

Other use non-intrusive profiling to get less precise data at a fraction of the time.

It is possible to use the code complexity/quality map together with the code coverage map to decide which area of the code should be prioritized and decide when the coverage is adequate. 

If a new feature is introduced without enough tests covering it this phase would be able tell.

#### Dynamic fault analysis
The tools available to dynamically detect faults in the code can be split in two groups:
- Those that require custom build and instrumentation
- Those that rely on the non-intrusive profiling features provided by the platform

This class of tools tend to execute between two times and tenfold times slower than a normal debug build.

They may be coupled with fuzzing technologies to detect faults and expand the code coverage, this activity should not happen on a per-pull request basis since it is extremely onerous.

#### Packaging checks

The codebase should be ready to ship anytime, the best way to ensure it is to automate the package creation.

Some packages do require some form of digital signature and may add additional obfuscation to the build.

Depending on how onerous the process it, it may run per pull-request or as a daily/weekly basis.

Since code-signing in itself can be a security concern separated signing keys could be used when possible.

## Example Workflow - C

The C language does not have a standard build system.

On Windows traditionally what comes with the IDE of choice is used.

On unix-like platforms, traditionally the Posix Make and its [gnu dialect](https://www.gnu.org/software/make/) with some *configure* helper script were the most widely used setup.

macOS has a mix of the two, with XCode and the unix-way coexisting.

Nowadays [ninja](https://ninja-build.org/) is making strides, popularized by [cmake](https://cmake.org/) and [meson](https://mesonbuild.com/) replacing the traditional *configure* script.

For this example we'll use [meson](https://mesonbuild.com), since it provides a good, yet minimalistic, [test integration](https://mesonbuild.com/Unit-tests.html) that includes support for test coverage out of box.

[cmake](https://cmake.org/)'s [testing support](https://cmake.org/cmake/help/latest/manual/ctest.1.html) is more complex and richer, that makes it less suited for an example.

### Tests

The C language does not have a built-in concept of Unit Test, there are a number of third-party libraries to automate part of the process and have a standardized output. 

The tests can be built as a normal meson [`executable()`](https://mesonbuild.com/Reference-manual.html#executable) targets. and [`test()`](https://mesonbuild.com/Reference-manual.html#test) let you run a test executable, parse its output and report the result.

``` meson
e = executable('prog', 'testprog.c')
test('name of test', e)
```

### Linting
A good style linter for C, among the others, is `clang-format`.

**meson** integrates with it [out of box](https://mesonbuild.com/Code-formatting.html).



#### Code Quality Metrics
[rust-code-analysis](https://crates.io/crates/rust-code-analysis) provides a report good report

#### Coverage
- Are we testing enough?

Tools: grcov, codecov

### Probable Fault Analysis
- Static Fault Analysis (coverity, clang-analyzer)
- Dynamic Analysis (valgrind, miri, Asan, Msan, Tsan)

@lu-zero Spiegazione Miri https://www.ralfj.de/blog/2020/12/14/provenance.html


## Software Quality

Software quality defines a series of methods to evaluate the quality of a software and provides some information on the safety, security, reliability, and maintainability of a codebase.

The data produced by those methods are usually metrics that can be computed either analyzing the code of a program or its execution flow.

During the description of the sections, we recommend some programs for computing metrics. This is not an *imposition*, but **only** a recommendation, in fact a developer **should** follow the steps defined in the workflow presented above, but the choice of the software to be used is at discretion of a developer.

### Static analysis

Static code analysis analyzes the code of a software to evaluate its quality and detect its faults before a program is being run. 

#### Code quality

*Code quality* provides a set of metrics that establish the quality of a code through the verification of some properties.

One property is *verbosity*. A verbose code could take a long time to be read and comprehended, wasting a lot of mental energy. It is usually considered in terms of the number of code lines in a source file.

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

Reducing *SLOC*, *PLOC*, and *LLOC* metrics through refactors guarantees a less verbose code, which results in a simpler and faster understandability of a codebase, while an higher value for *CLOC* indicates good documentation and clarity in the most difficult parts of a code.

Another property is the *structure* of a code. So the functions and closures that compose a codebase are analyzed to evaluate their lengths, number of arguments, and in case of functions, the number of exit points.

NOM
: Number of Methods. It counts the number of methods in a file.

NARGS
: Number of Arguments. It counts the number of arguments of each method in a file.

NEXITS
: Number of Exit Points. It counts the number of exit points of each method in a file.

*NARGS* and *NEXITS* are intuitively linked with the easiness in reading and interpreting a source code: a function with a high number of arguments can be more difficult to analyze because of the higher number of possible paths, while a function with many exit points may be problematic in reading the code.

For metrics computation, we recommend an open-source tool developed by Mozilla [@rca], called *rust-code-analysis*, because it is fast on large codebases and covers some of the most notorious programming languages.

#### Code complexity

*Code complexity* determines the complexity of maintaining a code over a long period of time. So those kind of metrics provides some information about the difficulty to understand at first glance the control flow of a program, or the effort to manage a codebase, or even an estimate on the ease of introducing bugs and errors in a code.

As explained in more detail in Deliverable 2.1, three are the most known metrics created for these purposes:

* *Cyclomatic Complexity*: it measures the complexity of a method’s control flow. It was originally intended to identify software modules that will be difficult to test or maintain [@cyclomatic]
* *Cognitive Complexity*: it evaluates the control flow of a code through mathematical models that reflect programmers’ intuitions about the mental, or *cognitive* effort required to understand those flows [@campbell]
* *Halstead Suite*: After having retrieved every operands and operators present in a code, it computes a set of quantitative complexity measures that quantify, for example, the effort to manage a codebase of a determined size and volume, or an estimate on the ease of introducing bugs and errors in a code.

As for the code quality metrics, we recommend the use of *rust-code-analysis* for their computation.

### Dynamic analysis

@lucaardito 

TODO EVERYTHING
(simple resume from a developer perspective)

Look at static analysis as example

- What information do we get from a dynamic analysis? 
- Why is it so important?
- Which tools do we recommend to do it and why them?

### Code coverage

@lucaardito 

TODO EVERYTHING
(simple resume from a developer perspective)

Look at static analysis as example

- What is it? 
- Why is it so important?
- Which tools do we recommend to do it and why them?

## Metrics Categories

Some of the metrics described above identifies faults that can lead to security problems or make a software unusable because of crashes, while other ones aim at detecting the parts of code affected by complexity problems that **may** transform into bugs and dangers in future refactors.

This distinction leads to define two categories:

* *Fault metrics*
* *Code quality metrics*

*Fault metrics* describe the *objective* defects present in a software, such as memory faults, security issues, and the presence of a limited test suite. Those metrics are called *static* when are computed analyzing a code in search of errors, while are *dynamic* when count the number of passed unit and integration tests, estimate the percentage of code covered by the test suite, and detect some other faults at runtime. Practically, *Fault metrics* represent every *unambiguous* problem that could arise in a code and, consequently, in the final binary.

*Code quality metrics* instead identify the portions of code that are complex to understand at first glance and the ones that could become serious threats in the future. Practically, this category provides some indications to a developer in order to improve code quality, more specifically the static metrics such as code complexity and code clarity.

## Software Quality Certification

The software quality certification is a procedure that a developer **must** undertake to guarantee to users, and even other developers, that a software is reliable, secure, well tested, and with a code written in a comprehensible way.

This certification procedure consists of assigning a colored stamp at each of the *two* metrics category defined above. The color of a stamp represents the requirements satisfied for a determined category. The stamp associated to *Fault Metrics* is called *Fault Stamp* and it is **mandatory**, while the one for *Code Quality Metrics* is called *Code Quality Stamp* and is **optional**, so it should be considered as an added value for determining the quality of a software.

### Fault Stamp

The main task for the *Fault Stamp* consists of evaluating the security and reliability of a software.

To do so, a developer **must** compute the *Fault metrics* and present their values alongside the list of tools used to obtain them. 
It is strongly recommended to save those metrics in a machine-readable format in order to simplify a possible future processing, but any other human-comprehensible format (just to cite few: HTML, MarkDown, Yaml) can also be valid.

The colors associated to this stamp are based on a traffic-light system:

* <span style="color:red">*Red*</span>: the software is **dangerous** and **unreliable**. Its use is not recommended
* <span style="color:orange">*Orange*</span>: The software can be used, but it is not **fully** certified
* <span style="color:green">*Green*</span>: The software has been **entirely** certified, so its use is recommended

The minimal set of requirements a software **must** satisfy to obtain the <span style="color:orange">*orange*</span> color is:

* No memory faults detected
* No undefined behaviors
* No known security issues
* A code coverage $\geq 60\%$

To obtain a <span style="color:green">*green*</span> color instead:

* No memory faults detected
* No undefined behaviors
* No known security issues
* A code coverage $\geq 80\%$

All other possible combinations lead to a <span style="color:red">*red*</span> color.

We would like to clarify that those requirements should not be interpreted as if the software is **free** by any faults, but rather that the tools used by a developer for its certification have **not** detected any problem.

Some programming languages could implement out of box features that prevent certain classes of mistakes. In that case, a developer **must** provide an official reference to the programming language specification in order to skip certain workflow steps.

@lu-zero After the workflows will be finished
> [name=mik] Non si capisce la frase sotto, va contestualizzata meglio con il paragrafo precedente creando una storia. 

It is advised to run all the check nonetheless during the integration tests.

### Code Quality Stamp

The meaning of the colors for the *second* certification level is:

* <span style="color:grey">*Grey*</span>: **none** of the optional metrics has been computed, so the developer has decided **not** to consider the second certification level
* <span style="color:orange">*Orange*</span>: **only** some of the optional metrics have been computed
* <span style="color:green">*Green*</span>: **every** optional metric has been computed

Difficoltà per sviluppatore a contribuire perché il codice è molto complicato.

E anche, quello che tu sviluppatore stai facendo rende il tuo codice complicato o meno complicato.

The second certification level provides information about the code and the software through the computation of the *Informative metrics*.

The output of those metrics **may** be added alongside the ones from the *Fault metrics*.

This certification level is optional since it provides information on how maintainable is the software, but not how inherently secure or trustworthy it is.

More complex code statistically may hide more logic issues, the developers **should** focus on the components of the code that are harder to understand according to the metrics either by improving the metrics through refactoring and/or provide extensive documentation and a comprehensive testing suite. 

## Additional notes

At last, we provide a series of notes that a developer **may** consider to further improve the quality of a software and reduce any possible effort related to its own maintainability.

### Rust as Advice

@lu-zero Decide to add part of https://people.mpi-sws.org/~jung/phd/thesis-screen.pdf that formally proves that Rust is safety

Once the content and the structure of a project have been defined, the next step usually consists of choosing a programming language that allows to implement the software according to the requirements established for the project.

@lu-zero Aggiungi le motivazioni contenute nei tuoi link nel paragrafo sotto

https://queue.acm.org/detail.cfm?id=3468263

A valid programming language should contain a set of features that, on one hand, notably simplify the job of a developer, while on the other hand, maintain a good balance among optimization and security concerns. An innovative language that satisfies those requests is the *Rust* language.

*Rust* is a recent programming language whose focus is on developing reliable and efficient systems that exploit parallelism and concurrency. Conciseness, expressiveness, and memory safety are among the principal properties that guided the Rust development [@matsakis2014rust].

According to the report on the security vulnerabilities published by the Microsoft Security Response Centre (MSRC) [@msrc], about 70% of those vulnerabilities are memory safety issues caused by developers which inadvertently insert memory corruption bugs into their C and C++ code. 

Rather than investing in more and more tools for addressing those flaws, the use of a programming language that prevents the introduction of memory safety issues into a feature work directly during its development would help both the feature developers as well as the security engineers. In this way, the onus of software security is removed from the feature developer and is put in the hand of the language developer. 

Many programming languages regarded as *safe* from memory corruption vulnerabilities result in being inefficient from the optimization perspective since they waste a lot of hardware resources. 

Rust provides both of the requirements above in an efficient way, as pointed out by its main features:

* Fast and memory efficient
* No runtime or garbage collector
* Easily integrate with other programming languages
* Guarantee memory-safe and thread-safe code, eliminating many classes of bugs at compile-time
* Useful methods to manage errors and print the relative messages in a comprehensible way
* Good documentation

Along with the *rustc* compiler, *Rust* also provides a package manager called *Cargo* which performs the following tasks:

1. Download the dependencies of a program;
2. Call *rustc* to compile the dependencies. Each dependency is compiled in an independent way from the other ones.
3. Call the linker to link together all the produced objects in order to obtain the final artifact. 

Every building option can be either passed as an input parameter to the *Cargo* CLI or defined in a *toml* file called `Cargo.toml`. The output artifact produced by *Cargo* is called *crate*.

A Rust *crate* is either a library or an executable program, referred to as either a *library crate* or a *binary crate*, respectively. Loosely, the term crate may refer to either the source code for a determined target or to the compiled artifact that the target produces. It may also refer to a compressed package fetched from a registry, thus a dependency.
A crate can be published on a hosting site called *crates.io* in order to be used as dependency by other *Rust* projects.

*Cargo* also allows to subdivide the source code for a given crate into modules, logical units which provide isolated namespaces within the code. This is usually done to organize the code into areas of related functionality or to control the visible scope (public/private) of symbols within the source, improving the modularity of a project in an easy way, without having to struggle with build systems that make use of dynamic and static libraries. So, from a simple perspective, Cargo eliminates the need for manual management of large dependency graphs and simplifies building the software, unlike tools written in C/C++. 

In addition, *Cargo* can automatically build the documentation of a software, as a series of different *html* and *css* files, running a subcommand called `doc`. The resulting documentation can subsequently be seen through the use of a browser or directly online if the crate is going to be published on *crates.io*. In the latter case, the documentation associated with each public API of a crate is accessible from a site called *docs.rs*.

### Distribution Strategies

Il bollino automatico prodotto:

A me sviluppatore è importante per confermare il livello di qualità a cui vai a tendere. 

È nel tuo interesse, all'atto di distribuire a terze parti il tuo software, fare in modo che sia il più facile riprodurre i risultati indipendentemente dall'ambiente di sviluppo locale, oppure usare un servizio di certificazione del software che produca un bollino.

For an open-source project, it would be another sign of quality providing the scripts in addition to the detailed procedure that has been used to obtain the values for all the computed metrics. In this way, any other developer will be able to *reproduce* the outcome at any time.

For example, a developer might present and comment out the various CI checks and scripts, the CI configuration, plus the scripts and programs used to benchmark the software.

About a closed-source project instead, a developer **should** at least describe the parameters and the configurations of the tools that had been run on the final binary in order to obtain the first and second certification level. This procedure needs to be done always to allow the reproducibility of the outcomes.