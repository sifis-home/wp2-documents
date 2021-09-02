---
tags: wp2.2, wp2, deliverable
title: conclusion
---

# Conclusion 

This document aimed to introduce developers guidelines in order to produce secure, privacy-aware and policy-based IoT software.
 
The first section of this document described a specific workflow that helps developers increase their software quality. We also provided an example for this workflow based on the C language. Then, we have defined a possible stamp to certify software quality through the workflow automatically. At last, we added some notes that a developer might consider further improving software quality and reducing any possible effort related to its maintainability.

The second section of this document described the SIFIS-Home developer APIs and their relation to other architectural components.
In particular, we introduced the concept of API label which describes safety, privacy, and financial risks associated with an API.
For each category, we presented a sample list, and then we gave a concrete example of API label.
Moreover, we introduced the app label, which is derived from the API labels of the APIs used within the application code. The app label integrates with user-defined policies, so that the execution of an API can be allowed or denied at runtime.
Finally, we presented the labels format for both API label and app label, and we offered an implementation in JSON format.

<!--The second section of this document analyzed the security labels. This mechanism helps developers write secure IoT software using specific APIs. The APIs leverage a permissions mechanism that enforces developers to declare which actions and operations their application will perform.-->

The third and last section of this document considered the legal guidelines that will help a developer to comply with privacy laws and adopt specific standards. This aspect is essential for Smart Home applications since they collect personal data through sensors and devices. Hence, a developer needs to consider how to manage personal data carefully.