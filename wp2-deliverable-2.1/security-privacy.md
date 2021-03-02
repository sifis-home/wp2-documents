---
tags: wp2.1, wp2, deliverable
title: 3.security-privacy
---

# Security and Privacy Assessment Metrics

Unlike software quality assessment, security metrics are a far more recent field of study. The research community has started proposing objective measures to identify those pieces of code showing critical security issues. Many security metrics and standards have been proposed [@ccrev5]. They are in use to measure the security and resilience of IT and software systems. WP2 is focused on providing metrics and tools to support SIFIS-Home aware app development, providing guidelines, and analyzing the source code to assess the level of security and the lack of vulnerabilities, which might imply security issues for the application, user, or the SIFIS-Home framework. In the following, this section reports an analysis of software-based security metrics proposed in the literature, based on detecting programming practices that might introduce, either by mistake or maliciously, dangerous behaviors or exploitable vulnerabilities. Furthermore, a set of regulations and related measures are introduced to analyze privacy implications based on data management strategies. The following metrics should not be taken as standalone, should instead be coupled with the previously defined code quality metrics, and should be used to have a more specific view on which issues might be brought by a low-quality source code. 

## Code Security Metrics

As anticipated, a relatively large number of software quality attributes have been studied and measured, as discussed in the previous section. On the other hand, security received relatively small attention [@Alshammari2016DevelopingSS] for what concerns the code. Security is mainly calculated at the system level. However, this kind of evaluation performed at the system level is not sufficient for a system where third-party software is installed at runtime. Such a model requires that instead, applications are evaluated at the code level. To this end, the following metrics and indexes have been defined to identify code structures and implementation language issues. 

### Stall Ratio

The Stall Ratio [@chowdhury08] is defined as the number of non-progressing code statements present in a block of code (e.g., in a loop statement), divided by the whole number of lines of code in that block of code. Examples of non progressing statements are neutral operations such as *a=a+0*, empty loops, unused counters and tautologies (a==a). The rationale behind this metric's definition is to avoid attacks aimed at stalling a system in doing a long set of unnecessary operations, which might result, to a certain extent, in a Denial Of Service attack. Producing high numbers of logs or continuously asking to issue a connection to an external server are both examples of non-progressive operations, which might result in a DoS, either for the device running the code or an external device. 

### Coupling corruption propagation

Coupling between methods is the concept that two or more methods are reliant on each other due to one or more interwined elements. This could involve data sharing or decision-making in the child methods using one of the caller call parameters. The effects of content/control coupling can quickly ripple into other methods several levels down the call chain. Coupling corruption propagation is meant to measure the total number of methods affected by an erroneous originating method. Given a parameter *s* for a method *f*, the coupling corruption propagation [@chowdhury08] is defined as the number of children methods of *f* based on the parameter *s* of the original invocation. Thus, supposing to have a number of nested invocations, such as *f()*, which invokes *g()*, which invokes *k()*, if a variable *a*  defined in *f()* is passed as parameter to invoke *g()*, directly or indirectly, uses the same parameter to invoke *h()*, the level of coupling corruption propagation is equal to 2, since a malicioys alteration of *a* can potentially affect both *g()* and *h()*. 

### Critical Element Ratio

Critical element ratio measures the number of critical elements that are present in a specific block of code. A critical element [@chowdhury08] is defined as an element of a class that is not instantiated and is not used during the program execution, divided by the number of elements defined in a code block. Depending on the source code language, such elements might be maliciously changed during the program execution (buffer overflow) and might destabilize the whole execution. The critical element called ratio metric measures the ratio of elements that malicious user inputs can possibly corrupt to the total elements in a class or method. The more such user inputs enter the system, the more open the system is to the user. The more the system is open to the users, the more is the risk of getting attacked by malicious user inputs.



## Object-Oriented Specific Security Metrics

### Information Flow and Data Accessibility

[@Alshammari2009]
Security accessibility metrics statically measure the potential flow of information from an accessibility perspective for an individual object-oriented class. These metrics only consider attributes and methods declared as classified since they are the ones that need to be kept secret. We divide these metrics for individual classes into three kinds of accessibility:
instance attributes; class attributes; and methods

### Unhandled exceptions

Programs fail mainly for two reasons: logic errors in the code and exception failures.
Exception failures occur when a program is prevented by unexpected circumstances from providing its specified service [@aggarwal07]. The following measures have thsu been defined to measure the quality of exception handling in a specific class:
* The Number of Catch Blocks per Class (NCBS) is defined as the ratio of catch blocks in a class to the total number of possible catch blocks in a class. This ratio measures thus the percentage of handled exception on the total number of possible exceptions for a catch block. A low value of this index generally implies a poor work related to exception handling, where many conditions have not been considered and might thus represent an exploitable vulnerability.
* The Exception Handling Factor (EHF) is formally defined as the ratio of number of exception classes to the total number of possible *exception classes* in software, where the number of exception classes is the count of exceptions covered in a system. The exception class is passed as an argument to the catch construct as type of argument arg. This type of argument specifies types of exception classes.

This two metrics are semantically similar to the critical element ratio described in the previous subsection, representing the lack of error handling in object oriented languages using exceptions as a construct. 

## Vulnerability Assessment

In the following, we report a list of measures and indexes to assess the potential threat brought by software, based on 

### Common Weakness Enumeration (CWE)

CWE [@mellado10] provides a set of unified and measurable software weaknesses which facilitate a practical discussion, description,
selection and use of software security services and tools, thus permitting these weaknesses to be discovered in the source code or in operational systems and facilitating a better understanding and management of those software weaknesses related to architecture and design. The severity of weaknesses can be scored using Common Weakness Scoring System (CWSS) and Common Weakness Risk Analysis Framework (CWRAF). CWSS enables organizations to score the severity of software coding errors found in their software applications to mitigate weaknesses in applications they are currently using and influence future purchases. In contrast, CWRAF enables organizations to apply CWSS to those CWEs that are most relevant to their specific businesses, missions, and deployed technologies.


### Common Vulnerability Scoring System (CVSS)

CVSS is currently in the custody of the Forum for International Response Teams (FIRST).
Among the benefits offered by the CVSS are Standardized punctuation of vulnerabilities, contextualized score, and open scoring system.  The CVSS provides all the details concerning the parameters used to compute each score, thus permitting organizations to understand both the reasoning behind a score and the significance of differences between different scores.
The scores assigned by the CVSS are derived from the following three groups of metrics:
* Base: This group represents the properties of a vulnerability that do not alter over time, specifically: the complexity of access, access vector, and the degree to which the system's confidentiality, integrity, and availability are compromised.
* Temporal: This group measures the properties of a vulnerability that alter over time, such as the existence of patches or code which could be exploited. 
* Environmental: This group measures the properties of a vulnerability that are representative of the environment in which the IT is used, such as the prevalence of affected systems and potential losses.

The CVSS uses simple formulas along with the groups of metrics shown above to produce the final score associated with
the vulnerability. 
The base metrics are used to derive a score from 0.0 to 10.0 as described in [@mellado10]. 
The CVSS was designed so that it would be understandable to the general public and permit any organization to prioritize the order in which it wishes to tackle computing vulnerabilities that affect it, regardless of the technology used by that organization in its computing systems.
The overall CVSS for a specific software or system can be calculated by using freely available dedicated tools, like the one provided by FIRST itself. 

### Common Misuse Scoring System (CMSS)

CMSS [@mellado10] is an open scoring scheme standardized to measure the severity of software element misuse vulnerabilities. Software elements misuse vulnerabilities are those vulnerabilities in which the software elements provide a means to compromise the system's security. CMSS is derived from CVSS. The scores assigned by the CMSS are derived from three groups of metrics: base, temporal and environmental. The base metrics are used to evaluate the intrinsic exploitability of the vulnerability and the impact on confidentiality, integrity, and availability. The temporal measures measure the aspects of variation in time of the severity of the vulnerabilities, such as the preponderance of existing exploits. The environmental metrics measure those aspects of vulnerability related to the organization's specific vulnerability, such as the local implementation of countermeasures. The CMSS also includes a formula that combines these measures to provide a score for the severity of each vulnerability. 

## Privacy Assessment Metrics

Compliance with laws and regulations on privacy is most of all an issue of qualitative assessment of the adequacy of personal data processing.
This is made clear by the rules of the GDPR.

According to art. 24 of the General Data Protection Regulation (EU) 2016/679 (hereinafter "GDPR"), the data controller (who determines the purposes and the means of the processing of personal data) is responsible for the correct processing of personal data. It has to implement appropriate technical and organizational measures (including appropriate data protection policies) to ensure and to be able to demonstrate that processing is performed in accordance with GDPR.

Moreover, articles 25 (Data protection by design and by default), 32 (Security of processing), and 35 (Data protection impact assessment) provide for assessment obligation on the data controller; art. 32 provides for assessment obligation on the processor (who processes personal data on behalf of the controller)[^IoT_vendor].

From these rules, a common path to be followed in assessing compliance arises: the controller must take into account state of the art, the cost of implementation and the nature, scope, context, and purposes of the processing, as well as the risks of varying likelihood and severity for rights and freedoms of natural persons posed by the processing.
This clarifies that GDPR compliance for IoT devices and the software installed on them implies a qualitative self-assessment to be performed by the controllers (and the processors).

Different methodologies to perform such assessments have been, and continue to be, proposed.

As a way of example, the DECODE project[^decode] adopted a series of privacy design strategies to comply with the obligation provided by art. 25 of GDPR to perform privacy by design and by default assessment (at the time of the determination of the means for processing and at the time of the processing itself)[@decode]:
1. Minimise
2. Separate
3. Abstract
4. Hide
5. Inform
6. Control
7. Enforce
8. Demonstrate.

The obligation to perform the data protection impact assessment (PIA) provided by art. 35 of GDPR implies a more accurate assessment than the assessment to be performed, according to artt. 25 and 32 of the GDPR, and also it is provided only in special cases.

For example, CNIL (the French Privacy Supervising Authority) published[^CNIL], a method available in 3 documents to allow compliance with the obligation to perform the PIA.

The PIA methodology of CNIL, described in the first document[@CNIL_methodology], allows to:
1. define and describe the context of the processing of personal data under consideration;
2. analyze the controls guaranteeing compliance with the fundamental principles: the proportionality and necessity of processing, and the protection of data subjects' rights;
3. assess privacy risks associated with data security and ensure they are properly treated;
4. formally document the validation of the PIA in view of the previous facts to hand or decide to revise the previous steps.

A document with templates to perform the Privacy Impact Assessments is also available on CNIL's official website [@CNIL_templates]. 

Finally, a document with a knowledge base is made available[@CNIL_kb].

CNIL also published a specific version of its PIA method applied to IoT devices[@CNIL_IoT].
CNIL also made available free software to perform the PIA2.

Performing GDPR privacy assessments can be supported by quantitative measures, including security measures.

Some approaches to complement security impact assessment and PIA in order to achieve an iterative and unified risk assessment process on-the-fly considering the interdependence of cybersecurity and privacy are starting to be proposed in the literature[@match].

It is, therefore, reasonable to expect that some of the security metrics to be produced by the SIFIS-HOME system could be useful for the PIA and other privacy assessments to be performed by the controllers and the processors. 




[^decode]:See https://decodeproject.eu/ 

[^IoT_vendor]: It is worth mentioning that the IoT devices' seller is interested in supporting the controllers and the processors to perform the privacy assessments (to make it easier for customers that are controllers and processors to buy more easily its IoT devices). This makes available information to perform the assessments easily (including, if possible, a preconfigured assessment to be adapted by the controller) is an excellent way to achieve this.

[^CNIL]: See https://www.cnil.fr/en/cnil-publishes-update-its-pia-guides 


