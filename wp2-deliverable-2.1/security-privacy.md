---
tags: wp2.1, wp2, deliverable
title: 3.security-privacy
---

# Security and Privacy Metrics

Differently from software quality metrics, security metrics are a far more recent field of study, where the research community has started proposing objective measures to identify those pieces of code showing critical security issues.  

## Code Security Metrics

Stall Ratio it is defined as the number of non-progressing code statements present in a block of code (e.g. in a loop statement), divided by the whole number of lines of code in that block of code. The rationale behind the definition of this metric is to avoid attacks aimed at stalling a system in doing a long set of unnecessary operations, which might result, to a certain extent to a Denial Of Service attack. Producing high numbers of logs or continuously asking to issue a connection to an external server, they are both examples of non-progressive operations, which might result in a DoS, either for the device running the code, or an external device. 
* Coupling corruption propagation: 
* Critical element ratio: a critical element is defined as an element of a class that is not instantiated and is not used during the program execution. Depending from the source code language such elements might be maliciously changed during the program execution (buffer overflow) and might destabilize the whole execution. 
* Unhandled exceptions: 

- Measures reporting code mistakes that might imply vulnerabilities (e.g. Stall Ratio, Critical Element Ratio, Unhandled Exceptions...)
- Usage of code blocks that expose the program to memory-based security attacks (e.g. buffer overflow).
- Measures about data traceability, including approaches based on data tainting.
- Usage of API and libraries known to be deprecated due to or implying security vulnerabilities.
- Usage of security protocols in network-based applications.   

# Privacy and Security Assessment Techniques

*We need to validate the procedures used to create the privacy and security fields of our own label?*

Below some links about a possible validation process and its explanation

https://thedigitalstandard.org/ 

https://github.com/TheDigitalStandard/TheDigitalStandard

For each one of the arguments, Privacy, Security, Ownership and Governance), various criteria have been identified. Then, at each criteria is associated an indicator and the corresponding procedure to evaluate it through data/links/automatic tests and so on.


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

