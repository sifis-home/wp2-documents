---
tags: wp2.2, wp2, deliverable
title: 4.Legal Guidelines
---


# Legal guidelines (licensing and privacy)

Different subjects may be obliged – or at least strongly interested – to comply with privacy laws and therefore to adopt certain standards.
In a situation where data is collected through smart-home systems, the Data Controller of processing performed with software inteeracting with IoT devices, according to the GDPR, could be the owner of the house (or the tenant), who willingly installed IoT devices in his house, but it can also be a Software as a Service provider, who obtains personal data from IoT devices and stores it.
While following the privacy rules is not mandatory for the software developer (or the “application designer”, as it’s usually called today), it is very advantageous for him to comply with privacy rules and follow current standards, as being compliant to privacy rules means that his software could be more easily reviewed and accepted by both the end user and the Software as a Service Provider who wants to provide services based on the application designed by the developer.
For this reason, we propose some insight on following the best practices in order to ship software that is not only privacy-compliant, but also based on the state of the art approaches to data protection and self-evaluation. 
This chapters deals with a second goal that derives from the reuse and distribution of  Free and Open Source software: compliance with legal obligation arising from Free and Open Source software. 

## 4.1 - Privacy

Different rules provided by the GDPR are to be followed by software developers and publishers. In particular, the Saas provider has to satisfy accountability requirements, and must perform a quantitative risk assessment analysis. The main requirements are found in:
- **Article 13/14 GDPR**[^13_14_GDPR], that impose a series of informations to be provided to the data subject. These informations are to be given also when not collecting personal data:
    - a) The identity and contact details of the Data Controller and the Data Protection Officer, if present.
    - b) The purposes of the processing.
    - c) What kind of personal data is being processed.
    - d) If applicable, the intention of transferring personal data to a third-party country, external from the European Union.
    - e) The period of time in which personal data will be kept.
    - d) The right for the data subject to obtain a modification or cancellation of their data and the practical ways in which he can exercise this right.
    - f)  the existence of automated decision-making, including profiling.
     
- **Article 25**[^25_GDPR], that asks the Data Controller to implement appropriate technical and organisational measures designed to implement data-protection principles, such as data minimisation, compatibly with the cost of the implementation and the nature of processing. This is called “data protection by design” and combines with the concept of “data protection by default”, which mandates the controller to implement other technical and organisational measures to ensure that. by default, only personal data which is necessary for each specific purpose of the processing is processed.

- **Article 32**[^32_GDPR], which sets requirements on the matter of security (obligation to implement appropriate technical and organisational measures to ensure a level of security appropriate to the risk).

- **Article 35**[^35_GDPR], that mandates the controller to carry out a Privacy Impact Assessment when the processing is likely to result in a high risk to the rights and freedoms of natural persons, or if processing is carried out automatically or on a large scale.
Of these requirements, the most complicated is probably that found in Article 35. To aid Data Controllers in building and demonstrating compliance to the GDPR, the French CNIL[^CNIL] created a useful tool[^CNIL_PIA] that has quickly become reference standard. Using this tool can help the developer to understand the security and privacy risks posed by his software and may give him the chance to solve them before shipping his product to the public. It is therefore highly recommendable to use this tool to ensure a software’s compliance to GDPR rules.

## 4.2 - Licensing
The goal of complying with legal obligations arising from reuse and distribution of  Free and Open Source software stands at the base of both the OpenChain[^OpenChain] and the ClearlyDefined[^ClearlyDefined] projects. These initiatives aim at helping free and open source software to become more standardised and well defined, clearing doubts regarding legal compliance and providing an eventual subsequent developer with a clear and comprehensive information that will inform him of the limits and obligations that the various Free and Open Source licenses impose on the use or modification of the original software.
More specifically, the OpenChain project wants to “establish requirements to achieve effective management of free/open source software for software supply chain participants, such that the requirements and associated collateral are developed collaboratively and openly by representatives  from the software supply chain, open source community, and academia”. OpenChain has become an international standard (ISO 5230) that allows software developers to obtain compliance regarding open source licenses. After following its guidelines, a software developer can send to the OpenChain organisation a document affirming that his software satisfies all the requirements of the specification and is therefore compliant to the OpenChain standard[^OpenChain_Certification]. It is important to notice that an OpenChain compliance badge can only be obtained if all the requirements are satisfied, and not just some of them. Following the OpenChain specification, the software developer creates, and therefore can make available, the compliance artifacts, that is “a collection of artifacts that represent the output of a compliance program and accompany the supplied software..”  that “..may include (but is not limited to) one or more of the following: attribution notices, source code, build and install scripts, copy of licenses, copyright notices, modification notifications, written offers, open source component bill of materials, and SPDX documents”.
The ClearlyDefined project, on the other hand, is still on its early days, but already offers some suggestions on how to distribute a clearly defined open source software, so that users and other developers alike are precisely informed on important things such as the type of open source license used, or where to find the components used for bug fixing or new versions (such as a GitHub page), and how these are made. It also offers a security forum so that developers can ask questions and receive answers in the matter of security and vulnerabilities that may be present in their software[^ClearlyDefined_Checklist].
Following both the OpenChain and the ClearlyDefined practices gives the software important certification that can aid in its diffusion.

## 4.3 Conclusion
To try to summarise the privacy and licensing legal requirements and taking into account the usefulness of following some standard practices, we propose this “traffic light system” to assess whether one’s software is compliant with the concepts exposed in the previous paragraphs.

### Green Light:
1) The software developer successfully performed a Privacy Impact Assessment based on reasonable assumptions for at least a standard use case and the documentation it accompanies the software[^GreenLight].
2) The software developer has produced information to be used for compliance to articles 13, 14, 25 and 32 of GDPR and the document containing the information accompanies the software.
2) The software developer followed the OpenChain specification or other public specification for licensing compliance and the software is accompanied by compliance artifacts.
4) The methodology used and the standard followed in creating the privacy impact assessment, the document produced according to point 2 and the compliance artifacts, is publicly available, free of any right of third party, so that everyone can assess compliance and use it.

The Data Controller can easily assess if the software is compliant with the GDPR and Free and Open Source license obligations and can therefore be used in the EU to process personal data.

### Yellow Light
1) The software developer states that he can make available all the information required to perform a Privacy Impact Assessment.
2) The software developer declares that he has produced information to be used to comply to articles 13, 14, 25 and 32 of GDPR.
3) The software developer declares that he has compliance artifacts.
4) The software developer declares that the methodology used and the standard followed in creating the above documentation can be made available in order to assess compliance.

The Data Controller should be in condition to assess if the software is compliant with the GDPR and Free and Open Source license obligations and can therefore be used in the EU to process personal data but some additional work will be required.

### Red Light
One or more of the points provided for Yellow Light are not satisfied.
This software must be carefully analysed  to assess if it is compliant with the GDPR and Free and Open Source license obligations before using it in the EU to process personal data.

[^13_14_GDPR]: Article 13: https://www.privacy-regulation.eu/en/article-13-information-to-be-provided-where-personal-data-are-collected-from-the-data-subject-GDPR.htm 
Article 14: https://www.privacy-regulation.eu/en/article-14-information-to-be-provided-where-personal-data-have-not-been-obtained-from-the-data-subject-GDPR.htm 

[^25_GDPR]: Article 25: https://www.privacy-regulation.eu/en/article-25-data-protection-by-design-and-by-default-GDPR.htm 

[^32_GDPR]: Article 32: https://www.privacy-regulation.eu/en/article-32-security-of-processing-GDPR.htm 

[^35_GDPR]: Article 35: https://www.privacy-regulation.eu/en/article-35-data-protection-impact-assessment-GDPR.htm 

[^CNIL]: CNIL is France’s independent administrative regulatory body to ensure that data privacy law is enforced in the French territories.

[^CNIL_PIA]: Downloadable on the official CNIL’s website: https://www.cnil.fr/en/open-source-pia-software-helps-carry-out-data-protection-impact-assesment 

[^OpenChain]: See https://www.openchainproject.org/resources/faq 

[^ClearlyDefined]: See https://clearlydefined.io/about 

[^OpenChain_Certification]: These requirements are found in the Supplier Education Pack (see https://github.com/OpenChain-Project/Reference-Material/raw/master/OpenChain-ISO-5230-Supplier-Education-Pack/OpenChain%20ISO%205230%20Supplier%20Education%20Pack.zip) downloadable on the official OpenChain website, and in particular in the “basic-open-source-education” .pdf file in the .zip pack.

[^ClearlyDefined_Checklist]: The ClearlyDefined “checklist” can be found in the ClearlyDefined by clearlydefined webpage (see https://docs.clearlydefined.io/clearly#secure), on the official ClearlyDefined website.

[^GreenLight]: For example using the CNIL’s tool as stated before