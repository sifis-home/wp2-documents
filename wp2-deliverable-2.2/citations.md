---
tags: wp2.2, wp2, deliverable
title: citations
---

@article{matsakis2014rust,
  title={The rust language},
  author={Matsakis, Nicholas D and Klock, Felix S},
  journal={ACM SIGAda Ada Letters},
  volume={34},
  number={3},
  pages={103--104},
  year={2014},
  publisher={ACM New York, NY, USA}
}

@online{msrc,
    title={A proactive approach to more secure code},
    author={Gavin Thomas},
    url={https://msrc-blog.microsoft.com/2019/07/16/a-proactive-approach-to-more-secure-code/},
    addendum ={(accessed: 21.06.2021)},
}

@article{cyclomatic,
  title={A Complexity Measure},
  author={Thomas J. McCabe},
  journal={IEEE Transactions on Software Engineering},
  volume={SE-2, No. 4},
  month={December},
  year={1976},
}

@article{campbell,
  title={Cognitive Complexity. A new way of measuring understandability},
  author={Campbell G. A},
  year={2018},
  institution={SonarSource SA}
}

@article{rca,
title = {rust-code-analysis: A Rust library to analyze and extract maintainability information from source codes},
journal = {SoftwareX},
volume = {12},
pages = {100635},
year = {2020},
issn = {2352-7110},
doi = {https://doi.org/10.1016/j.softx.2020.100635},
url = {https://www.sciencedirect.com/science/article/pii/S2352711020303484},
author = {Luca Ardito and Luca Barbato and Marco Castelluccio and Riccardo Coppola and Calixte Denizet and Sylvestre Ledru and Michele Valsesia},
keywords = {Algorithm, Software metrics, Software maintainability, Software quality},
abstract = {The literature proposes many software metrics for evaluating the source code non-functional properties, such as its complexity and maintainability. The literature also proposes several tools to compute those properties on source codes developed with many different software languages. However, the Rust language emergence has not been paired by the community’s effort in developing parsers and tools able to compute metrics for the Rust source code. Also, metrics tools often fall short in providing immediate means of comparing maintainability metrics between different algorithms or coding languages. We hence introduce rust-code-analysis, a Rust library that allows the extraction of a set of eleven maintainability metrics for ten different languages, including Rust. rust-code-analysis, through the Abstract Syntax Tree (AST) of a source file, allows the inspection of the code structure, analyzing source code metrics at different levels of granularity, and finding code syntax errors before compiling time. The tool also offers a command-line interface that allows exporting the results in different formats. The possibility of analyzing source codes written in different programming languages enables simple and systematic comparisons between the metrics produced from different empirical and large-scale analysis sources.}
}