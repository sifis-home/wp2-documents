---
tags: wp2.1, wp2, deliverable
title: 3.security-privacy
---

# Security and Privacy Metrics

Differently from software assessment, security metrics are a far more recent field of study, where the research community has started proposing objective measures to identify those pieces of code showing critical security issues. Many security metrics and standards have been proposed [@ccrev5] and are in use to measure the security and resilience of IT and software systems. WP2 is focused on providing metrics and tools to support SIFIS-Home aware app development, providing guidelines and analyzing the source code to assess the level of security and the lack of vulnerabilities, which might imply security issues, for the application, user, or the SIFIS-Home framework. In the following, this section reports an analysis of software-based security metrics proposed in literature, based on detecting programming practices which might introduce, either by mistake or maliciously dangerous behaviors or exploitable vulnerabilities. Furthermore, a set of regulations and related measures are introduced to analyze privacy implications based on data management strategies. The following metrics should not be taken as standalone, should instead be coupled with the previously defined code quality metrics, and should be used to have a more specific view on which issues might be brought by a low-quality source code. 

## Code Security Metrics

As anticipated, a quite large number of software quality attributes have been studied and measured, as discussed in the previous section. Security, on the other hand, received relatively a small attention [@Alshammari2016DevelopingSS], for what concerns the code. Security is in fact is mainly calculated at system level. This kind of evaluation performed at system level, however, is not sufficient for a kind of system where third party software is installed at runtime. Such a model requires that instead applications are evaluated at code level. To this end the following metrics and indexes have been defined to identify code structures and implementation language issues. 

### Stall Ratio

The Stall Ratio [@chowdury08] it is defined as the number of non-progressing code statements present in a block of code (e.g. in a loop statement), divided by the whole number of lines of code in that block of code. The rationale behind the definition of this metric is to avoid attacks aimed at stalling a system in doing a long set of unnecessary operations, which might result, to a certain extent to a Denial Of Service attack. Producing high numbers of logs or continuously asking to issue a connection to an external server, they are both examples of non-progressive operations, which might result in a DoS, either for the device running the code, or an external device. 

### Coupling corruption propagation

Coupling between methods is the concept that two or more methods are reliant on each other in some way. This could involve data sharing or decision making in the child methods using one of its call parameters. The effects of content/control coupling can easily ripple into other methods several levels down the call chain. Coupling corruption propagation is meant to measure the total number of methods that could be affected by erroneous originating method. Given a parameter *s* for a method *f* the coupling corruption propagation [@chowdury08] is defined as the number of children methods of *f* based on the parameter *s* of the original invocation.

### Critical Element Ratio

Critical element ratio measures the number of critical elements that are present in a specific block of code. A critical element [@chowdury08] is defined as an element of a class that is not instantiated and is not used during the program execution, divided by the number of elements defined in a block of code. Depending from the source code language such elements might be maliciously changed during the program execution (buffer overflow) and might destabilize the whole execution. The critical element ratio metric measures the ratio of elements that can be possibly corrupted by malicious user inputs to the total elements in a class or method. The more such user inputs enter the system, the more open the system is to the user. The more the system is open to the users, the more is the risk of getting attacked by malicious user inputs.



## Object Oriented Specific Security Metrics

### Information Flow and Data Accessibility

[@Alshammari2009]
Security accessibility metrics statically measure the potential flow of information from an accessibility perspective for an individual object-oriented class. These metrics only consider attributes and methods declared as classified since they are the ones which need to be kept secret. We divide these metrics for individual classes into three kinds of accessibility:
instance attributes; class attributes; and methods

### Unhandled exceptions

[@aggarwal07]


## Vulnerability Assessment

In the following we report a list of measures and indexes to assess the potential threat brought by a software, based on 

### Common Weakness Enumeration (CWE)

CWE [@mellado10] provides a set of unified and measurable software weaknesses which facilitate an effective discussion, description,
selection and use of software security services and tools, thus permitting these weaknesses to be discovered in the source code or in operational systems, along with facilitating a better understanding and management of those software weaknesses related to architecture and design. The severity of weaknesses can be scored using Common Weakness Scoring System (CWSS) and Common Weakness Risk Analysis Framework (CWRAF). CWSS enables organizations to score the severity of software coding errors found in their software applications in order in mitigate weaknesses in applications they are currently using and to influence future purchases, while CWRAF enables organizations to apply CWSS to those CWEs that are most relevant to their own specific businesses, missions, and deployed technologies.

### Software Vulnerability Index (SVI)

### Common Vulnerability Scoring System (CVSS)

CVSS is currently in the custody of the Forum for International Response Teams (FIRST).
Among the benefits offered by the CVSS are: Standardized punctuation of vulnerabilities,  contextualised score, open scoring system.  The CVSS provides all the details concerning the parameters used to compute each score, thus permitting organisations to understand both the reasoning behind a score and the significance of differences between different scores.
The scores assigned by the CVSS are derived from the following three groups of metrics:
* Base: This group represents the properties of a vulnerability which do not alter over time, specifically: complexity of access, access vector, and degree to which the system’s confidentiality, integrity and availability are compromised.
* Temporal: This group measures the properties of a vulnerability which alter over time, such as the existence of patches or code which could be exploited. 
* Environmental: This group measures the properties of a vulnerability which are representative of the environment in which the IT is used, such as the prevalence of affected systems and potential losses.

The CVSS uses simple formulas along with the groups of metrics shown above to produce the final score associated with
the vulnerability. 
The base metrics are used to derive a score from 0.0 to 10.0 as described in [@mellado10]. 
The CVSS was designed in such a way that it would be understandable to the general public, and to permit any organisation to prioritize the order in which it wishes to tackle computing vulnerabilities that affect it, regardless of the technology used by that organisation in its computing systems.
The overall CVSS for a specific software or system can be calculated by using freely available dedicated tools, as the one provided by FIRST itself. 

### Common Misuse Scoring System (CMSS)

CMSS [@mellado10] is an open scoring scheme which is standardized to measure the severity of software elements misuse vulnerabilities. Software elements misuse vulnerabilities are those vulnerabilities in which the software elements provide a means to compromise the system’s security. CMSS is derived from CVSS. The scores assigned by the CMSS are derived from three groups of metrics: base, temporal and environmental. The base metrics are used to evaluate the intrinsic exploitability of the vulnerability and the impact on the confidentiality, integrity and availability. The temporal measures measure the aspects of variation in time of the severity of the vulnerabilities, such as the preponderance of existing exploits. The environmental metrics measure those aspects of vulnerability related to the specific vulnerability of the organisation’s environment, such as the local implementation of countermeasures. The CMSS also includes a formula which combines these measures in order to provide a score for the severity of each vulnerability. 

# MC: Suggestions on privacy

## Security of processing

Art. 32 (Security of processing) of GDPR provides:

> 1. Taking into account the state of the art, the costs of implementation and the nature, scope, context and purposes of processing as well as the risk of varying likelihood and severity for the rights and freedoms of natural persons, the controller and the processor shall implement appropriate technical and organisational measures to ensure a level of security appropriate to the risk, including inter alia as appropriate:
> 
> (a) the pseudonymisation and encryption of personal data;
> 
> (b) the ability to ensure the ongoing confidentiality, integrity, availability and resilience of processing systems and services;
> 
> (c) the ability to restore the availability and access to personal data in a timely manner in the event of a physical or technical incident;
> 
> (d) a process for regularly testing, assessing and evaluating the effectiveness of technical and organisational measures for
> ensuring the security of the processing.
> 
> 2. In assessing the appropriate level of security account shall be taken in particular of the risks that are presented by processing, in particular from accidental or unlawful destruction, loss, alteration, unauthorised disclosure of, or access to personal data transmitted, stored or otherwise processed.
> 3. Adherence to an approved code of conduct as referred to in Article 40 or an approved certification mechanism as referred to in Article 42 may be used as an element by which to demonstrate compliance with the requirements set out in paragraph 1 of this Article.
> 4. The controller and processor shall take steps to ensure that any natural person acting under the authority of the controller or the processor who has access to personal data does not process them except on instructions from the controller, unless he or she is required to do so by Union or Member State law."

## Privacy by design & by default

Art. 25 (Data protection by design and by default)
of GDPR provides:

> 1. Taking into account the state of the art, the cost of implementation and the nature, scope, context and purposes of processing as well as the risks of varying likelihood and severity for rights and freedoms of natural persons posed by the processing, the controller shall, both at the time of the determination of the means for processing and at the time of the processing itself, implement appropriate technical and organisational measures, such as pseudonymisation, which are designed to implement data-protection principles, such as data minimisation, in an effective manner and to integrate the necessary safeguards into the processing in order to meet the requirements of this Regulation and protect the rights of data subjects.
> 2. The controller shall implement appropriate technical and organisational measures for ensuring that, by default, only personal data which are necessary for each specific purpose of the processing are processed. That obligation applies to the amount of personal data collected, the extent of their processing, the period of their storage and their accessibility. In particular, such measures shall ensure that by default personal data are not made accessible without the individual's intervention to an indefinite number of natural persons.
> 3. An approved certification mechanism pursuant to Article 42 may be used as an element to demonstrate compliance with the requirements set out in paragraphs 1 and 2 of this Article.

### Example of privacy design strategies

As way of example, the privacy design strategies adopted in DECODE project (https://decodeproject.eu) are described in D1.2 *Privacy Design Strategies for the DECODE Architecture* https://decodeproject.eu/publications/privacy-design-strategies-decode-architecture, particularly, pp. 10-14:
* Minimise
* Separate
* Abstract
* Hide
* Inform
* Control
* Enforce
* Demonstrate

## Data protection impact assessment

Art. 35 (Data protection impact assessment), paragraph 1, of GDPR provides that:

> Where a type of processing in particular using new technologies, and taking into account the nature, scope, context and purposes of the processing, is likely to result in a high risk to the rights and freedoms of natural persons, the controller shall, prior to the processing, carry out an assessment of the impact of the envisaged processing operations on the protection of personal data...

Different methodologies are available to perform the data protection impact assessment (PIA).


### PIA of CNIL

As way of example, CNIL (French Privacy Supervising Authority) published a method 
https://www.cnil.fr/en/cnil-publishes-update-its-pia-guides
available in 3 documents:
- methodology https://www.cnil.fr/sites/default/files/atoms/files/cnil-pia-1-en-methodology.pdf
- template https://www.cnil.fr/sites/default/files/atoms/files/cnil-pia-2-en-templates.pdf
- knowledge base https://www.cnil.fr/sites/default/files/atoms/files/cnil-pia-3-en-knowledgebases.pdf

CNIL also published a specific version of its PIA method applied to IoT devices
https://www.cnil.fr/sites/default/files/atoms/files/cnil-pia-piaf-connectedobjects-en.pdf

CNIL made also available a free software to perform the PIA
https://www.cnil.fr/en/open-source-pia-software-helps-carry-out-data-protection-impact-assesment

