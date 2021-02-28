---
tags: wp2.1, wp2, deliverable
title: 4.privacy-and-security-assessment-techniques
---

# Privacy and Security Assessment Techniques

Compliance with laws and regulations on privacy is most of all an issue of qualitative assessment of the adequacy of the processing of personal data.
This is made clar by the rules of the GDPR.

According to art. 24 of the General Data Protection Regulation (EU) 2016/679 (hereinafter “GDPR”), the data controller (who determines the purposes and the means of the processing of personal data) is responsible for the correct processing of personal data and has to implement appropriate technical and organisational measures (including appropriate data protection policies) to ensure and to be able to demonstrate that processing is performed in accordance with GDPR.

Moreover, articles 25 (Data protection by design and by default), 32 (Security of processing) and 35 (Data protection impact assessment) provide for assessment obligation on the data controller; art. 32 provides for assessment obligation also on the processor (who processes personal data on behalf of the controller)[^IoT_vendor].

From these rules a common path to be followed in assessing compliance arises: the controller must take into account the state of the art, the cost of implementation and the nature, scope, context and purposes of processing as well as the risks of varying likelihood and severity for rights and freedoms of natural persons posed by the processing.
This makes clear that GDPR compliance for IoT devices, and for the software installed on them, implies a qualitative self assessment to be performed by the controllers (and the processors).

Different methodologies to perform such assessments have been, and continue to be, proposed.

As way of example, the DECODE project[^decode] adopted a series of privacy design strategies to comply with the obligation provided by art. 25 of GDPR to perform a privacy by design and by default assessment (at the time of the determination of the means for processing and at the time of the processing itself)[@decode]:
1. Minimise
2. Separate
3. Abstract
4. Hide
5. Inform
6. Control
7. Enforce
8. Demonstrate.

The obligation to perform the data protection impact assessment (PIA) provided by art. 35 of GDPR implies more accurate assessment then the assessment to be performed according to artt. 25 and 32 of the GDPR and also it is provided only in special cases.

As way of example, CNIL (the French Privacy Supervising Authority) published[^CNIL]1 a method available in 3 documents to allow compliance with the obligation to perform the PIA.

The PIA methodology of CNIL, described in the first document[@CNIL_methodology], allows to:
1. define and describe the context of the processing of personal data under consideration;
2. analyse the controls guaranteeing compliance with the fundamental principles: the proportionality and necessity of processing, and the protection of data subjects' rights;
3. assess privacy risks associated with data security and ensure they are properly treated;
4. formally document the validation of the PIA in view of the previous facts to hand or decide to revise the previous steps.

A document with templates to perform the Privacy Impact Assessments is also available on CNIL’s official website [@CNIL_templates]. 

Finally, a document with a knowledge base is made available[@CNIL_kb].

CNIL also published a specific version of its PIA method applied to IoT devices[@CNIL_IoT].
CNIL made also available a free software to perform the PIA2.

Performing GDPR privacy assessments can be supported by quantitative measures, including security measures.

Some approaches to complement security impact assessment and PIA in order to achieve an iterative and unified risk assessment process on-the-fly considering the interdependence of cybersecurity and privacy are starting to be proposed in literature[@match].

It is therefore reasonable to expect that some of the security metrics to be produced by SIFIS-HOME system could be useful for the PIA and other privacy assessments to be performed by the controllers and the processors. 




[^decode]:See https://decodeproject.eu/ 

[^IoT_vendor]:It is worth mentioning that the seller of the IoT devices has interest in supporting the controllers and the processors to perform the privacy assessments (in order to make easier that customers that are controllers and processors buy more easily its IoT devices). Making available information to easily perform the assessments (including, if possible, a preconfigured assessment to be adapted by the controller) is a good way to achieve this.

[^CNIL]:See https://www.cnil.fr/en/cnil-publishes-update-its-pia-guides 





