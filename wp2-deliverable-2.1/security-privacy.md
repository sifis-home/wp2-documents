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
Security accessibility metrics statically measure the potential flow of information from an accessibility perspective for an individual object-oriented class [@Alshammari2009]. These metrics only consider attributes and methods declared as classified since they are the ones that need to be kept secret. The following measures, intended for object oriented languages, are thus used to evaluate the data accessibility given by the availability to developers of methods to access private class data, which if not handled correctly might imply vulnerabilities and program misbehavior.

#### Classified Instances Data Accessibility (CIDA)
This metric measures the direct accessibility of classified instance attributes of a particular class. It helps to protect the classified internal representations of a class, i.e. instance attributes, from direct access. It is defined as “The ratio of the number of classified instance public attributes to the number of classified attributes in a class”. Therefore, it is calculated by dividing the number of public classified instance attributes in a class to its total number of classified
attributes. This gives us the ratio of classified instance attributes which have direct access from outside the class. Higher values indicate higher accessibility to these classified attributes and hence a larger ‘attack surface’. This means a higher possibility for confidential data to be exposed to unauthorized parties.
Aiming for lower values of this metric adheres to the security principle of *reducing the attack surface*.

#### Classified Class Data Accessibilty (CCDA)
This metric measures the direct accessibility of classified class attributes of a particular class. This metric aims to protect the classified internal representations of a class. i.e. class attributes, from direct access. It is defined as follows: “The ratio of the number of classified class public attributes to the number of classified attributes in a class”. This metric is calculated by dividing the number of public classified class attributes of a given class by its total number of classified attributes. The result shows the ratio of classified class attributes which are directly accessible from outside its class.
Higher values mean that confidential data of that class has a higher chance of being exposed to unauthorized parties. This metric contributes towards measuring the attack surface size of a given program’s classified class attributes. Thus, lower values of this metric enforce the security principle of *reducing the attack surface*.

#### Classified Operation Accessibility (COA)
This metric is the ratio of the accessibility of public classified methods of a particular class. It is defined as: “The ratio of the number of classified public methods to the number of classified methods in a class”. It is calculated by dividing the number of classified methods which are declared as public in a given class by its total number of classified methods.
This value also indicates the size of the attack surface of a given class. It aims to protect the internal operations of a class which interact with classified attributes from direct access. Lower values of this metric would reduce potential information flow of classified data which could be caused by calling public methods. This metric measures the potential attack
surface size exposed by classified methods.

#### Classified Mutator Attribute Interactions (CMAI)
This metric measures  the interactions  of mutators (constructor, setters, getters) with  classified  attributes  in  a  class.  We  define  this metric as: “The ratio of the number of mutators which may interact with classified attributes to the possible maximum  number  of mutators  which  could  interact with classified attributes”. To calculate this metric, it is at first 
needed to find out in how many places in the design/program classified attributes could be mutated. Then, this number is divided by the total number of possible  ways of mutating these classified attributes. The result is a ratio which can be used to indicate the potential interactions between mutators and classified attributes. Higher interaction means stronger cohesion between  mutators and  classified  attributes  within  a given  class,  and  consequently  more  privileges are given to mutators on classified attributes. Conversely, lower  values  indicate  weaker  cohesion between mutators and classified attributes which means a lower chance of classified information flow from mutators.
With regard to the security principles, a lower value allows fewer privileges over confidential data and therefore adheres to the least privilege principle

#### Classified Accessor Attribute Interactions (CAAI)
This metric measures the interactions of accessors with classified attributes in a class. We define this metric as: “The ratio of the number of accessors which may interact with classified attributes to the possible maximum number of accessors which could have access to classified attributes”. This metric is calculated in a similar way to the CMAI metric by first finding out in how many parts of the design/program classified attributes could be accessed. Then, this number is divided by the total number of possible ways of accessing these classified attributes. This results in a ratio which directly shows the potential interactions between accessors and classified attributes. Higher interaction means stronger cohesion between accessors
and classified attributes within a given class. Similar to mutators, weak cohesion is desirable to reduce any potential flow of classified data caused by accessors. Weak cohesion also indicates fewer privileges are given to accessors over classified attributes. This would reduce the chance of potential flow of classified data to adversaries. Moreover, lowering the value of
this metric would lower privileges of accessors over classified attributes and thus satisfy the security principle of least privilege.

#### Classified Attributes Interaction Weight (CAIW)
This metric is defined to measure the interactions with classified attributes by all methods of a given class. The metric is defined as: “The ratio of the number of all methods which may interact with classified attributes to the total number of all methods which could have access to all attributes”. This metric is calculated by finding the number of methods of a given class which may interact with classified attributes, and dividing this number by the total number of potential interactions with all attributes in that class. The importance of this metric is that it shows how many potential class interactions are dependent on classified attributes. This is another metric which measures the privileges of class methods over classified data. However, this metric differs from the previous ones as it shows the overall privileges by a class’ methods over classified attributes. The higher the value of this metric for a given class the more privileges are given to this class’ methods over classified attributes, and therefore the less that class adheres to the security *principle of least privilege*.

#### Classified Methods Weight (CMW)
This metric is defined to measure the weight of methods in a class which potentially interact with any classified attributes in a particular class. We define this metric as: “The ratio of the number of classified methods to the total number of methods in a given class”. From this definition, we can calculate this metric by initially summing the number of methods which may interact in any form with classified attributes in a class. Then, this number is divided by the total number of methods in that class. This metric can directly measure the attack surface size of a given class based on its operations over confidential data. This differs from the previous attack surface metrics as it doesn’t focus on accessibility but instead it focuses on the interaction weight of classified methods. Higher values of this metric indicates that more classified operations are offered by the given class. This leads to a higher chance of information flow of classified data by calling the class’s methods and violations of the security principle of reducing the attack surface.


### Unhandled exceptions

Programs fail mainly for two reasons: logic errors in the code and exception failures.
Exception failures occur when a program is prevented by unexpected circumstances from providing its specified service [@aggarwal07]. The following measures have thus been defined to measure the quality of exception handling in a specific class:

* The Number of Catch Blocks per Class (NCBS) is defined as the ratio of catch blocks in a class to the total number of possible catch blocks in a class. This ratio measures thus the percentage of handled exception on the total number of possible exceptions for a catch block. A low value of this index generally implies a poor work related to exception handling, where many conditions have not been considered and might thus represent an exploitable vulnerability.
* The Exception Handling Factor (EHF) is formally defined as the ratio of number of exception classes to the total number of possible *exception classes* in software, where the number of exception classes is the count of exceptions covered in a system. The exception class is passed as an argument to the catch construct as type of argument arg. This type of argument specifies types of exception classes.

These two metrics are semantically similar to the critical element ratio described in the previous subsection, representing the lack of error handling in object oriented languages using exceptions as a construct. 

## Vulnerability Assessment

In the following, we report a list of measures and indexes to assess the potential threat brought by software, based on the presence of known vulnerabilities, due to usage of deprecated libraries or insecure software. 

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

From these rules, a common path to be followed arises. In assessing compliance the controller must take into account:
1. the state of the art of technical and organizational measures,
2. the cost of implementation of technical and organizational measures,
3. the nature of the processing,
4. the scope of the processing,
5. the context of the processing,
6. the purposes of the processing,
7. the risks of varying likelihood and severity for rights and freedoms of natural persons posed by the processing.
This list clarifies that GDPR compliance for IoT devices and the software installed on them implies a qualitative self-assessment to be performed by the controllers (and the processors).

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

The obligation to perform the data protection impact assessment (PIA) provided by art. 35 of GDPR implies a more accurate assessment than the assessment to be performed, according to art. 25 and 32 of the GDPR, and also it is provided only in special cases.

For example, CNIL (the French Privacy Supervising Authority) published[^CNIL], a method available in 3 documents to allow compliance with the obligation to perform the PIA.

The PIA methodology of CNIL, described in the first document [@CNIL_methodology], allows to:
1. define and describe the context of the processing of personal data under consideration;
2. analyze the controls guaranteeing compliance with the fundamental principles: the proportionality and necessity of processing, and the protection of data subjects' rights;
3. assess privacy risks associated with data security and ensure they are properly treated;
4. formally document the validation of the PIA in view of the previous facts to hand or decide to revise the previous steps.

A document with templates to perform the Privacy Impact Assessments is also available on CNIL's official website [@CNIL_templates]. 

Finally, a document with a knowledge base is also available [@CNIL_kb].

CNIL also published a specific version of its PIA method applied to IoT devices [@CNIL_IoT].
CNIL also made available free software to perform the PIA2.

Performing GDPR privacy assessments can be supported by quantitative measures, including security measures.

Some approaches to complement security impact assessment and PIA in order to achieve an iterative and unified risk assessment process on-the-fly considering the interdependence of cybersecurity and privacy are starting to be proposed in the literature [@match].

It is, therefore, reasonable to expect that some of the security metrics to be produced by the SIFIS-Home project could be useful for the PIA and other privacy assessments to be performed by the controllers and the processors. 




[^decode]:See https://decodeproject.eu/ 

[^IoT_vendor]: It is worth mentioning that the IoT devices' seller is interested in supporting the controllers and the processors to perform the privacy assessments (to make it easier for customers that are controllers and processors to buy more easily its IoT devices). This makes available information to perform the assessments easily (including, if possible, a preconfigured assessment to be adapted by the controller) is an excellent way to achieve this.

[^CNIL]: See https://www.cnil.fr/en/cnil-publishes-update-its-pia-guides 


